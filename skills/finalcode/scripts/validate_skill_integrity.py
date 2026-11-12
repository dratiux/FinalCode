"""Skill integrity validator — deterministic consistency check for the FinalCode skill.

Detects, across SKILL.md and every other ``.md`` file in the skill:

1. broken references  — backticked relative paths or markdown links that
                        resolve to no file (tried skill-root, file-dir, repo-root)
2. outdated versions  — version strings older than the current version in
                        ``SKILL.md`` (e.g. v1.x..v4.x, v5.0/v5.1 when current
                        is 5.2.0); lines inside a clearly marked
                        Version History / Changelog / Release Notes section,
                        and descriptive "introduced-in" tags / examples, are
                        excluded. Remaining hits are WARNINGS, not errors:
                        distinguishing an actually-stale declaration from a
                        legitimate historical behavioral note requires human
                        judgment, so they are reported but do not fail the run.
3. orphaned files     — ``.md`` files not referenced anywhere in ``SKILL.md``
                        (literal or by glob), i.e. unreachable from the router

Files under ``archive/`` are skipped (archived material is stale by design).
Placeholder paths containing ``<...>`` (e.g. ``plugins/<name>/sdk.md``) are
conceptual examples, not references.

Usage:
    python validate_skill_integrity.py [skill_root] [--self-test]

``skill_root`` defaults to the skill directory this script lives in.
Exit 0 when there are no errors (broken references or orphaned files);
outdated-version warnings do not affect the exit code. Exit 1 when errors
exist, 2 on usage/input problems.

Stdlib only.
"""
import json
import os
import re
import sys

# Backtick-quoted relative file references, e.g. `core/decision-engine.md`.
# Captures two-or-more path components so it does not match bare filenames.
PATH_REF_RE = re.compile(r"`((?:[A-Za-z0-9_.-]+/)+[A-Za-z0-9_.-]+\.[A-Za-z0-9]+)`")

# Markdown link targets: ![alt]([target]) and [text]([target]).
MD_LINK_RE = re.compile(r"\]\(([^)\s]+(?:\s+\"[^\"]*\")?)\)")

# Version strings such as v5.2.0, V5.2, version 3.1, #5.2.0
VERSION_RE = re.compile(r"(?i)(?:^|[^A-Za-z0-9])(?:v|version|release)\s*(\d+(?:\.\d+){1,2})\b")

VERSION_MARKERS = ("Version History", "Changelog", "Release Notes", "CHANGELOG")

# Directories that are never reachable as skill documentation.
NON_DOCUMENTED_SUBDIRS = {"evals"}


def _version_tuple(token):
    if re.search(r"(?i)version", token):
        return token[0].upper(), re.findall(r"\d+", token)
    return token[0], re.findall(r"\d+", token)


def current_version(skill_root):
    skill_md = os.path.join(skill_root, "SKILL.md")
    try:
        text = open(skill_md, encoding="utf-8").read()
    except OSError:
        return None
    for line in text.splitlines():
        m = re.match(r"^\s*Version:\s*(\d+(?:\.\d+){0,3})", line)
        if m:
            return m.group(1)
    first = re.search(r"VERSION\s+(\d+(?:\.\d+){0,3})", text, re.IGNORECASE)
    return first.group(1) if first else None


def _is_outdated(older, current):
    t_old = re.findall(r"\d+", older)
    t_cur = re.findall(r"\d+", current)
    n = max(len(t_old), len(t_cur))
    a = [int(x) for x in t_old + ["0"] * (n - len(t_old))]
    b = [int(x) for x in t_cur + ["0"] * (n - len(t_cur))]
    return a < b


def _resolve(ref, file_dir, skill_root):
    if ref.startswith("/"):
        return os.path.exists(ref)
    for base in (skill_root, file_dir):
        if os.path.exists(os.path.join(base, ref)):
            return True
    rc = _repo_root(skill_root)
    if rc and os.path.exists(os.path.join(rc, ref)):
        return True
    return False


def _repo_root(skill_root):
    p = skill_root
    for _ in range(10):
        if os.path.isdir(os.path.join(p, ".git")):
            return p
        parent = os.path.dirname(p)
        if parent == p:
            break
        p = parent
    return None


def all_md_files(skill_root):
    out = []
    for dirpath, dirnames, filenames in os.walk(skill_root):
        # Archived material is stale by design (never scanned or required);
        # evals/ holds test artifacts and fixtures, not documentation.
        dirnames[:] = sorted(d for d in dirnames
                             if d != "archive" and d not in NON_DOCUMENTED_SUBDIRS)
        for fn in filenames:
            if fn.endswith(".md"):
                out.append(os.path.join(dirpath, fn))
    return sorted(out)


def _line_starts_table_or_list(line):
    s = line.lstrip()
    return s.startswith(("#", "-", "*", ">", "|", "`", "#"))


def check_broken_references(md_files, skill_root):
    issues = []
    seen = set()
    version_token = current_version(skill_root)
    for path in md_files:
        file_dir = os.path.dirname(path)
        rel = os.path.relpath(path, skill_root)
        try:
            text = open(path, encoding="utf-8", errors="replace").read()
        except OSError:
            continue
        for i, line in enumerate(text.splitlines(), start=1):
            for m in PATH_REF_RE.finditer(line):
                ref = m.group(1)
                if ref.startswith((".", "~")):
                    continue  # runtime artifacts / home paths, not skill docs
                if "<" in ref or ">" in ref:
                    continue  # placeholder/conceptual path (e.g. plugins/<name>/x.md)
                key = (rel, i, "path", ref)
                if key in seen:
                    continue
                seen.add(key)
                if _resolve(ref, file_dir, skill_root):
                    continue
                issues.append({
                    "type": "broken_reference",
                    "file": rel,
                    "line": i,
                    "reference": ref,
                    "snippet": _snippet(line),
                })
            for m in MD_LINK_RE.finditer(line):
                target = m.group(1).split(" \"")[0]
                if target.startswith(("http://", "https://", "mailto:", "#")):
                    continue
                key = (rel, i, "link", target)
                if key in seen:
                    continue
                seen.add(key)
                if _resolve(target, file_dir, skill_root):
                    continue
                issues.append({
                    "type": "broken_reference",
                    "file": rel,
                    "line": i,
                    "reference": target,
                    "snippet": _snippet(line),
                })
    return issues


def _snippet(line, width=90):
    s = line.strip()
    return s if len(s) <= width else s[:width - 1] + "…"


def check_outdated_versions(md_files, skill_root, current_ver):
    issues = []
    for path in md_files:
        rel = os.path.relpath(path, skill_root)
        try:
            lines = open(path, encoding="utf-8", errors="replace").read().splitlines()
        except OSError:
            continue
        in_history = False
        for i, line in enumerate(lines, start=1):
            if re.match(r"^\s*#{1,6}\s", line):
                low = line.lower()
                in_history = any(m.lower() in low for m in VERSION_MARKERS)
            if in_history:
                continue
            m = VERSION_RE.search(line)
            if not m:
                continue
            vstr = m.group(1)
            if not _is_outdated(vstr, current_ver):
                continue
            # Skip legitimate in-line version tags that are part of a label,
            # maturity scale, or lifecycle range: 'Label (vX.Y.Z)', 'X.Y.Z: ...',
            # 'vX.Y.Z - vX.Y.Z', 'present', 'v3.x–v4.x' legacy ranges.
            if _is_legit_tag(line, vstr):
                continue
            issues.append({
                "type": "outdated_version",
                "file": rel,
                "line": i,
                "version": "v" + vstr,
                "current_version": current_ver,
                "snippet": _snippet(line),
            })
    return issues


def _is_legit_tag(line, vstr):
    """Heuristic: version is a descriptive tag, not a claim 'this is still vX'."""
    low = line.lower()
    # feature/section labels: 'Name (v2.2.0)' or 'Name (v2.2.0) — ...'
    if re.search(r"\(\s*v?" + re.escape(vstr) + r"(?:\.\d+)*\s*\)", low):
        return True
    # maturity/lifecycle scale: 'v3.0.0: Initial (30%)'
    if re.search(r"v?" + re.escape(vstr) + r"(?:\.\d+)*\s*:", line):
        return True
    # range: 'v1.0.0 - v1.2.0' or 'version 1.0.0 to 1.2.0'
    if re.search(r"v?" + re.escape(vstr) + r"(?:\.\d+)*\s*[-–]\s*", line) or \
       re.search(r"v?" + re.escape(vstr) + r"(?:\.\d+)*\s+to\s+\d", line, re.I):
        return True
    # 'present' / 'since'
    if re.search(r"v?" + re.escape(vstr) + r"(?:\.\d+)*\s+(?:- present|since|until)\b", line, re.I):
        return True
    # '(v3.x–v4.x, on demand)' range in legacy doc index
    if re.search(r"v\d+\.x\s*[–-]\s*v\d+\.x", low):
        return True
    return False


def check_orphans(md_files, skill_root):
    skill_md = os.path.join(skill_root, "SKILL.md")
    try:
        text = open(skill_md, encoding="utf-8", errors="replace").read()
    except OSError:
        return []
    refs = set()
    bare_names = set()
    for m in PATH_REF_RE.finditer(text):
        refs.add(_norm_path(m.group(1)))
    glob_re = re.compile(r"`((?:[A-Za-z0-9_.-]+/)+[A-Za-z0-9_.-]*(?:\*|[?])[A-Za-z0-9_.-]*\.[A-Za-z0-9]+)`")
    for m in glob_re.finditer(text):
        refs.add(_norm_path(m.group(1)))  # glob
    # Bare single-component references like `CHANGELOG.md` also count.
    for m in re.finditer(r"`([A-Za-z0-9_.-]*\.[A-Za-z0-9]+)`", text):
        name = m.group(1)
        if "/" not in name and "<" not in name \
                and not any(w in name for w in "*?"):
            bare_names.add(name)
    orphans = []
    for path in md_files:
        if os.path.samefile(path, skill_md):
            continue
        rel = os.path.relpath(path, skill_root)
        if _documented(rel, sorted(refs), bare_names):
            continue
        orphans.append({
            "type": "orphaned_file",
            "file": rel,
        })
    return orphans


def _norm_path(p):
    p = p.strip()
    if p.startswith("skills/finalcode/"):
        p = p[len("skills/finalcode/"):]
    return p


def _documented(rel, refs, bare_names):
    rel = rel.replace(os.sep, "/")
    if rel in refs:
        return True
    base = os.path.basename(rel)
    if base in bare_names:
        return True
    for ref in refs:
        if "*" in ref or "?" in ref:
            pattern = "skills/finalcode/" + ref if not ref.startswith(("core", "references", "plugins", "scripts")) else ref
            if _glob_match(pattern, rel) or _glob_match(ref, rel):
                return True
    return False


def _glob_match(pattern, rel):
    import fnmatch
    return fnmatch.fnmatch(rel, pattern) or fnmatch.fnmatch(rel.replace(os.sep, "/"), pattern.replace(os.sep, "/"))


def validate(skill_root):
    md_files = all_md_files(skill_root)
    current_ver = current_version(skill_root)
    result = {
        "skill_root": os.path.abspath(skill_root),
        "current_version": current_ver,
        "md_file_count": len(md_files),
    }
    if current_ver is None:
        result["errors"] = ["SKILL.md has no parseable 'Version: X.Y.Z' line"]
        result["ok"] = False
        return result
    broken = check_broken_references(md_files, skill_root)
    outdated = check_outdated_versions(md_files, skill_root, current_ver)
    orphans = check_orphans(md_files, skill_root)
    result["broken_references"] = broken
    result["orphaned_files"] = orphans
    # Outdated version strings are warnings, not errors: a version inside a
    # behavioral note ("identical to v1.9.0 behavior") is legitimate, and the
    # script cannot tell that context from a stale declaration. Report every
    # hit; decide per item. They do not affect ok/exit code.
    result["outdated_version_warnings"] = outdated
    result["errors"] = {
        "broken_references": len(broken),
        "orphaned_files": len(orphans),
    }
    result["warnings"] = {"outdated_versions": len(outdated)}
    result["total_errors"] = len(broken) + len(orphans)
    result["total_warnings"] = len(outdated)
    result["ok"] = result["total_errors"] == 0
    return result


def self_test():
    import tempfile, shutil
    tmp = tempfile.mkdtemp(prefix="finalcode_integrity_")
    try:
        os.makedirs(os.path.join(tmp, "core", "archive"))
        os.makedirs(os.path.join(tmp, "references"))
        good = os.path.join(tmp, "SKILL.md")
        open(good, "w", encoding="utf-8").write(
            "# Test\n\nVersion: 5.2.0\n\n"
            "Use `core/decision-engine.md`, `references/*.md`, "
            "and `core/archive/old.md`.\n")
        open(os.path.join(tmp, "core", "decision-engine.md"), "w", encoding="utf-8").write(
            "# d\n\nSee `references/gates.md` and missing `core/ghost.md`.\n"
            "Placeholder `plugins/<name>/x.md` is conceptual.\n"
            "v5.2.0: current release.\n\n## Version History\n\nv1.0.0: first\n")
        open(os.path.join(tmp, "core", "archive", "old.md"), "w", encoding="utf-8").write(
            "archived doc; still v1.2.0 text\n")
        open(os.path.join(tmp, "references", "gates.md"), "w", encoding="utf-8").write(
            "# g\n\nThis is still v2.3.0 text.\n")
        open(os.path.join(tmp, "orphan.md"), "w", encoding="utf-8").write("orphan\n")
        r = validate(tmp)
        assert r["current_version"] == "5.2.0", r
        assert any(b["reference"] == "core/ghost.md" for b in r["broken_references"]), r["broken_references"]
        assert not any(b["reference"] == "core/decision-engine.md" for b in r["broken_references"])
        assert not any("<" in b["reference"] for b in r["broken_references"]), "placeholder skipped"
        w = r["outdated_version_warnings"]
        assert any(o["version"] == "v2.3.0" for o in w), w
        assert not any(o["version"] == "v1.0.0" for o in w), "history section excluded"
        assert not any("old.md" in o["file"] for o in w), "archive dir skipped"
        assert any(o["file"] == "orphan.md" for o in r["orphaned_files"]), r["orphaned_files"]
        assert not any(o["file"] == "core/decision-engine.md" for o in r["orphaned_files"]), "glob-referenced"
        # warnings alone must not fail the run
        assert r["total_errors"] >= 2 and r["total_warnings"] >= 1
        shutil.rmtree(tmp)
        tmp2 = tmp + "_clean"
        os.makedirs(tmp2)
        open(os.path.join(tmp2, "SKILL.md"), "w", encoding="utf-8").write(
            "# Test\n\nVersion: 5.2.0\n\nSee `a.md`.\n")
        open(os.path.join(tmp2, "a.md"), "w", encoding="utf-8").write(
            "ok; identical to v1.9.0 behavior\n")
        r2 = validate(tmp2)
        assert r2["ok"] and r2["total_errors"] == 0, r2
        assert len(r2["outdated_version_warnings"]) == 1, r2  # warning, not error
        shutil.rmtree(tmp2)
        print("validate_skill_integrity self-test OK")
    finally:
        if os.path.isdir(tmp):
            shutil.rmtree(tmp)


def main(argv):
    if "--self-test" in argv:
        return self_test()
    args = [a for a in argv if not a.startswith("--")]
    skill_root = args[0] if args else os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    if not os.path.isfile(os.path.join(skill_root, "SKILL.md")):
        print(json.dumps({"ok": False, "errors": ["no SKILL.md in " + skill_root]}, indent=2))
        return 2
    result = validate(skill_root)
    print(json.dumps(result, indent=2, ensure_ascii=False))
    return 0 if result.get("ok") else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
