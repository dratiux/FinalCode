"""Finding validator — enforces the Finding Format contract from SKILL.md.

Usage:
    python validate_findings.py findings.json [--score 95.9 --grade A+]

findings.json: {"findings": [{...}]} or a bare [...] list.
Exit 0 when valid, 1 with error list when not.
"""
import json
import re
import sys

ID_RE = re.compile(r"^FC-[A-Z]+-\d+$")
SEVERITIES = {"Critical", "High", "Medium", "Low", "Informational"}
STATUSES = {"Confirmed", "Needs Verification", "Not Verified"}
CLASSIFICATIONS = {"Confirmed Defect", "Security Vulnerability",
                   "Engineering Recommendation", "Architectural Suggestion",
                   "Style Recommendation"}
REQUIRED = ["id", "classification", "severity", "status", "category",
            "evidence", "affected_files", "impact", "root_cause",
            "preventive_recommendation", "recommended_fix",
            "verification_method", "confidence"]
GRADES = [(95, "A+"), (90, "A"), (85, "A-"), (80, "B+"), (75, "B"),
          (70, "B-"), (60, "C"), (50, "D"), (0, "F")]


def validate(findings, score=None, grade=None):
    errors, seen = [], set()
    for i, f in enumerate(findings):
        tag = f.get("id", f"index {i}")
        for field in REQUIRED:
            if f.get(field) in (None, "", []):
                errors.append(f"{tag}: missing required field '{field}'")
        if not ID_RE.match(f.get("id", "")):
            errors.append(f"{tag}: id must match FC-<CATEGORY>-<NUMBER>")
        elif f["id"] in seen:
            errors.append(f"{tag}: duplicate finding id")
        seen.add(f.get("id"))
        if f.get("severity") not in SEVERITIES:
            errors.append(f"{tag}: bad severity {f.get('severity')!r}")
        if f.get("status") not in STATUSES:
            errors.append(f"{tag}: bad status {f.get('status')!r}")
        if f.get("classification") not in CLASSIFICATIONS:
            errors.append(f"{tag}: bad classification {f.get('classification')!r}")
    if score is not None and grade is not None:
        expected = next(g for t, g in GRADES if score >= t)
        if expected != grade:
            errors.append(f"grade {grade} does not match score {score} (expected {expected})")
    return errors


def self_test():
    good = {"id": "FC-SEC-1", "classification": "Confirmed Defect",
            "severity": "High", "status": "Confirmed", "category": "Security",
            "evidence": "e", "affected_files": ["a"], "impact": "i",
            "root_cause": "r", "preventive_recommendation": "p",
            "recommended_fix": "f", "verification_method": "v", "confidence": "High"}
    assert validate([good], 95.9, "A+") == []
    bad = dict(good, id="bad-id", severity="Urgent")
    errs = validate([good, bad, dict(good)], 64, "A")
    assert len(errs) == 4, errs  # bad id, bad severity, duplicate id, grade mismatch
    print("validate_findings self-test OK (4 errors detected as expected)")


def main(argv):
    if "--self-test" in argv:
        return self_test()
    if not argv or argv[0].startswith("--"):
        print("usage: validate_findings.py findings.json [--score N --grade G] [--self-test]")
        return 2
    data = json.load(open(argv[0], encoding="utf-8"))
    findings = data if isinstance(data, list) else data.get("findings", [])
    score = grade = None
    if "--score" in argv:
        score = float(argv[argv.index("--score") + 1])
        grade = argv[argv.index("--grade") + 1]
    errors = validate(findings, score, grade)
    print(json.dumps({"ok": not errors, "errors": errors}, indent=2))
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
