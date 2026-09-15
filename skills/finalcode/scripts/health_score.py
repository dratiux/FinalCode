"""Health Score calculator — pure function of (findings, weights).

Implements `references/health-score.md` deterministically so audits of the
same repository state always produce the same score and grade.

Usage:
    python health_score.py findings.json [--weights weights.json] [--explain]

findings.json: {"findings": [{"id": "FC-SEC-1", "category": "Security",
               "severity": "High", "status": "Confirmed"}], "policy_target": 90}

Only `Confirmed` findings deduct points: Needs Verification / Not Verified
are unverified by definition and must not move the score.
"""
import json
import sys

DEDUCTIONS = {"Critical": 25, "High": 15, "Medium": 8, "Low": 3, "Informational": 1}

DEFAULT_WEIGHTS = {
    "Security": 20, "Architecture": 15, "Maintainability": 15,
    "Performance": 10, "Documentation": 10, "Accessibility": 10,
    "Testing": 10, "Type Safety": 5, "GitHub Readiness": 5, "Dead Code": 0,
}

# ponytail: unknown gate/category names fold into Maintainability with a
# warning; add explicit aliases here instead of a fuzzy matcher.
ALIASES = {
    "code quality": "Maintainability", "error handling": "Maintainability",
    "dependencies": "Maintainability", "deps": "Maintainability",
    "typesafety": "Type Safety", "type-safety": "Type Safety",
    "github": "GitHub Readiness", "github readiness": "GitHub Readiness",
    "a11y": "Accessibility", "docs": "Documentation", "tests": "Testing",
    "perf": "Performance", "arch": "Architecture", "sec": "Security",
    "deadcode": "Dead Code", "dead code": "Dead Code",
}

GRADES = [(95, "A+"), (90, "A"), (85, "A-"), (80, "B+"), (75, "B"),
          (70, "B-"), (60, "C"), (50, "D"), (0, "F")]


def normalize(category):
    name = (category or "").strip()
    if name in DEFAULT_WEIGHTS:
        return name
    return ALIASES.get(name.lower(), "Maintainability")


def calculate(findings, weights=None):
    weights = weights or DEFAULT_WEIGHTS
    cats = {c: {"deduction": 0, "count": 0} for c in weights}
    deductions, warnings = [], []
    for f in findings:
        if f.get("status") != "Confirmed":
            continue
        sev = f.get("severity")
        if sev not in DEDUCTIONS:
            warnings.append(f"{f.get('id', '?')}: unknown severity {sev!r}, skipped")
            continue
        cat = normalize(f.get("category"))
        if (f.get("category") or "").strip() not in DEFAULT_WEIGHTS \
                and (f.get("category") or "").lower() not in ALIASES:
            warnings.append(f"{f.get('id', '?')}: unmapped category "
                            f"{f.get('category')!r}, counted under Maintainability")
        pts = DEDUCTIONS[sev]
        cats[cat]["deduction"] += pts
        cats[cat]["count"] += 1
        if cat == "Dead Code":
            # health-score.md footnote: dead code carries 0% weight of its own
            # and contributes via Maintainability instead.
            cats["Maintainability"]["deduction"] += pts
        deductions.append({"finding": f.get("id"), "category": cat,
                           "severity": sev, "points": pts})
    breakdown, total = {}, 0.0
    for cat, w in weights.items():
        score = max(0, 100 - cats[cat]["deduction"])
        contrib = round(score * w / 100, 1)
        total += score * w / 100
        breakdown[cat] = {"score": score, "weight": w,
                          "contribution": contrib, "findings": cats[cat]["count"]}
    score = round(total, 1)
    grade = next(g for threshold, g in GRADES if score >= threshold)
    classification = ("Excellent" if score >= 90 else "Good" if score >= 75
                      else "Fair" if score >= 50 else "Poor")
    return {"score": score, "grade": grade, "classification": classification,
            "categories": breakdown, "deductions": deductions, "warnings": warnings}


def explain(result):
    lines = ["REPOSITORY HEALTH SCORE", "-" * 49,
             f"Health Score: {result['score']} / 100 ({result['classification']})",
             f"Grade: {result['grade']}", "",
             "  Category        Weight  Score  Contribution"]
    for cat, d in result["categories"].items():
        lines.append(f"  {cat:<15} {d['weight']:>3}%    {d['score']:>3}    {d['contribution']:.1f}")
    return "\n".join(lines)


def self_test():
    findings = [
        {"id": "FC-SEC-1", "category": "Security", "severity": "High", "status": "Confirmed"},
        {"id": "FC-TEST-1", "category": "Testing", "severity": "Medium", "status": "Confirmed"},
        {"id": "FC-DOC-1", "category": "Documentation", "severity": "Low", "status": "Confirmed"},
        {"id": "FC-SEC-9", "category": "Security", "severity": "Critical", "status": "Needs Verification"},
    ]
    r = calculate(findings)
    assert r["score"] == 95.9, r["score"]
    assert r["grade"] == "A+" and r["classification"] == "Excellent"
    assert r["categories"]["Dead Code"] == {"score": 100, "weight": 0,
                                            "contribution": 0.0, "findings": 0}
    r2 = calculate(findings + [{"id": "FC-DEAD-1", "category": "Dead Code",
                                "severity": "Medium", "status": "Confirmed"}])
    assert r2["categories"]["Dead Code"]["score"] == 92
    assert r2["categories"]["Maintainability"]["score"] == 92  # shared deduction
    assert r2["score"] == 94.7, r2["score"]
    print("health_score self-test OK (95.9 / A+)")


def main(argv):
    if "--self-test" in argv:
        return self_test()
    args = [a for a in argv if not a.startswith("--")]
    if not args:
        print("usage: health_score.py findings.json [--weights w.json] [--explain] [--self-test]")
        return 2
    data = json.load(open(args[0], encoding="utf-8"))
    weights = None
    if "--weights" in argv:
        weights = json.load(open(argv[argv.index("--weights") + 1], encoding="utf-8"))
    result = calculate(data.get("findings", []), weights)
    target = data.get("policy_target")
    if target is not None:
        result["policy_target"] = target
        result["meets_target"] = result["score"] >= target
    print(explain(result) if "--explain" in argv else json.dumps(result, indent=2))


if __name__ == "__main__":
    main(sys.argv[1:])
