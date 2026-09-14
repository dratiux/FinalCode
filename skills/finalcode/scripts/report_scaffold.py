"""Report scaffolder — creates a timestamped certification report skeleton.

Section list is parsed from `references/report-format.md` (single source of
truth); the embedded list below is only a fallback when that file is missing.
Never overwrites an existing report — a counter suffix is added on collision.

Usage:
    python report_scaffold.py --repo my-app --mode inspect [--verdict "READY TO SHIP"]
"""
import argparse
import datetime
import re
from pathlib import Path

HERE = Path(__file__).resolve().parent
FORMAT_DOC = HERE.parent / "references" / "report-format.md"
MODE_SPECIFIC = {"Fixes Applied": "Repair", "Refactors Applied": "Refactor",
                 "Intelligent Repair Stop": "Repair"}

# Fallback only — canonical list lives in references/report-format.md.
FALLBACK_SECTIONS = ["Executive Dashboard", "Audit Metadata",
                     "Repository Metadata", "Findings", "Repository Health Score",
                     "Certification"]


def load_sections(path=FORMAT_DOC):
    try:
        text = Path(path).read_text(encoding="utf-8")
    except OSError:
        return list(FALLBACK_SECTIONS)
    registry = text.split("Report Engine Section Registry", 1)[-1]
    sections = [re.sub(r"\s*\(.*\)$", "", m.group(1).strip())
                for m in re.finditer(r"(?m)^\d+\.\s+(.+)$", registry)]
    return sections or list(FALLBACK_SECTIONS)


def scaffold(repo, mode, verdict="", out_dir=Path(".finalcode/reports"), sections=None):
    sections = sections or load_sections()
    stamp = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
    out_dir.mkdir(parents=True, exist_ok=True)
    path = out_dir / f"{stamp}-certification.md"
    n = 1
    while path.exists():  # never overwrite existing reports
        n += 1
        path = out_dir / f"{stamp}-certification-{n}.md"
    lines = ["FINALCODE CERTIFICATION REPORT", "",
             f"Repository: {repo} | Mode: {mode} | Date: {stamp}"]
    if verdict:
        lines.append(f"Verdict: {verdict}")
    lines.append("")
    for s in sections:
        tag = f" ({MODE_SPECIFIC[s]} Mode only — omit if N/A)" if s in MODE_SPECIFIC else ""
        lines += [f"## {s}{tag}", "", "<!-- TODO -->", ""]
    path.write_text("\n".join(lines), encoding="utf-8")
    return path


def self_test():
    import tempfile
    with tempfile.TemporaryDirectory() as tmp:
        out = Path(tmp) / ".finalcode" / "reports"
        p1 = scaffold("demo", "inspect", out_dir=out, sections=["A", "B"])
        p2 = scaffold("demo", "inspect", out_dir=out, sections=["A", "B"])
        text = p1.read_text(encoding="utf-8")
        assert "FINALCODE CERTIFICATION REPORT" in text and p1 != p2
        assert (p1.exists() and p2.exists())
    assert "Fixes Applied" in load_sections()  # parses the real registry
    print("report_scaffold self-test OK")


def main(argv=None):
    ap = argparse.ArgumentParser()
    ap.add_argument("--repo", required=False, default="")
    ap.add_argument("--mode", default="inspect")
    ap.add_argument("--verdict", default="")
    ap.add_argument("--out-dir", default=".finalcode/reports")
    ap.add_argument("--self-test", action="store_true")
    args = ap.parse_args(argv)
    if args.self_test:
        return self_test()
    if not args.repo:
        ap.error("--repo is required")
    print(scaffold(args.repo, args.mode, args.verdict, Path(args.out_dir)))


if __name__ == "__main__":
    main()
