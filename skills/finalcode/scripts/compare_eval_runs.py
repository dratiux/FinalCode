"""Multi-model determinism comparator for FinalCode eval run logs.

Reads the canonical run store (evals/runs.json by default; schema:
evals/evals.json "run_log_schema") and reports, per eval group
(eval_name + fixture), determinism drift across models:

  - Severity Drift:            same finding id, different severity across runs.
  - Classification Drift:      same finding id, different Phase 0.5 category
                               across runs (Confirmed Defect vs Accepted
                               Trade-off conflicts are flagged explicitly).
  - Score Variance:            max - min of final_health_score across runs.
                                
Drifts are findings, not failures: exit 0 with a JSON summary whenever a
parseable store is given; exit 1 on unreadable input, exit 2 on bad usage.

Usage:
    python compare_eval_runs.py [runs.json] [--self-test] [--json]
"""
import json
import sys

# Phase 0.5 categories (core/decision-engine.md, Phase 0.5).
PHASE_05 = {"Confirmed Defect", "Engineering Recommendation",
            "Architecture Decision", "Accepted Trade-off",
            "Contextual Constraint"}
DEFECT = "Confirmed Defect"
TRADEOFF = "Accepted Trade-off"
SCORE_TOLERANCE = 0.0


def _by_id(entries):
    out = {}
    for e in entries or []:
        if isinstance(e, dict) and e.get("id"):
            out[e["id"]] = e
    return out


def analyze(runs):
    """Group runs by (eval_name, fixture) and detect the three drift types."""
    groups = {}
    for r in runs:
        if r.get("is_template"):
            continue
        key = (r.get("eval_name", "?"), r.get("fixture", "?"))
        groups.setdefault(key, []).append(r)

    report = {"groups": [], "severity_drift": [], "classification_drift": [],
              "score_variance": [], "coverage_gaps": []}
    for (eval_name, fixture), group in sorted(groups.items()):
        ids_seen = {fr["run_id"]: set() for fr in group}
        sev, cls, scores = [], [], {}
        for run in group:
            fid = run.get("run_id", "?")
            for f in run.get("detected_findings", []):
                ids_seen[fid].add(f.get("id"))
            sev.extend(dict(run_id=fid, **e) for e in _by_id(run.get("assigned_severities")).values())
            cls.extend(dict(run_id=fid, **e) for e in _by_id(run.get("phase_05_classifications")).values())
            if run.get("final_health_score") is not None:
                scores[fid] = float(run["final_health_score"])

        # Severity: same finding id seen in >=2 runs with >1 distinct severity
        sev_by_run = {}
        for e in sev:
            sev_by_run.setdefault(e["id"], {})[e["run_id"]] = e["severity"]
        for fid, per_run in sorted(sev_by_run.items()):
            if len(per_run) >= 2 and len(set(per_run.values())) > 1:
                report["severity_drift"].append(
                    {"finding": fid, "eval": eval_name, "fixture": fixture,
                     "assignments": per_run})

        cls_by_run = {}
        for e in cls:
            cls_by_run.setdefault(e["id"], {})[e["run_id"]] = e["classification"]
        for fid, per_run in sorted(cls_by_run.items()):
            if len(per_run) >= 2 and len(set(per_run.values())) > 1:
                cats = set(per_run.values())
                entry = {"finding": fid, "eval": eval_name, "fixture": fixture,
                         "assignments": per_run,
                         "defect_vs_tradeoff": DEFECT in cats and TRADEOFF in cats}
                report["classification_drift"].append(entry)

        # float() cast: run logs may carry scores as strings when hand-edited.
        scores = {k: float(v) for k, v in scores.items()}
        delta = max(scores.values()) - min(scores.values()) if scores else 0.0
        report["score_variance"].append(
            {"eval": eval_name, "fixture": fixture, "scores": scores,
             "max_delta": round(delta, 2),
             "within_tolerance": delta <= SCORE_TOLERANCE})

        all_ids = set().union(*ids_seen.values()) if ids_seen else set()
        for fid in sorted(all_ids):
            where = sorted(r["run_id"] for r in group if fid in ids_seen[r["run_id"]])
            if len(where) < len(group):
                report["coverage_gaps"].append(
                    {"finding": fid, "eval": eval_name, "fixture": fixture,
                     "seen_in": where,
                     "missing_from": sorted(r["run_id"] for r in group if fid not in ids_seen[r["run_id"]])})

        report["groups"].append({"eval": eval_name, "fixture": fixture,
                                 "runs": [r.get("run_id") for r in group],
                                 "models": sorted({(r.get("model_id") or "unknown") for r in group})})

    report["summary"] = {
        "runs_compared": sum(len(g) for g in groups.values()),
        "findings_with_severity_drift": len(report["severity_drift"]),
        "findings_with_classification_drift": len(report["classification_drift"]),
        "defect_vs_tradeoff_conflicts": sum(1 for d in report["classification_drift"] if d["defect_vs_tradeoff"]),
        "score_variances_over_tolerance": sum(1 for s in report["score_variance"] if not s["within_tolerance"]),
        "deterministic": (not report["severity_drift"]
                          and not report["classification_drift"]
                          and all(s["within_tolerance"] for s in report["score_variance"]))
    }
    return report


def self_test():
    import tempfile, os

    def run(rid, model, sevs, cls, score):
        return {"run_id": rid, "eval_name": "inspect-tiny-app", "fixture": "tiny-app",
                "model_id": model, "provider": "synthetic", "run_index": 1,
                "detected_findings": [{"id": k, "locations": ["a.py:1"]} for k in (sevs or cls or [])],
                "assigned_severities": [{"id": k, "severity": v} for k, v in (sevs or {}).items()],
                "phase_05_classifications": [{"id": k, "classification": v} for k, v in (cls or {}).items()],
                "final_health_score": score}

    a = run("m1-1", "model-a",
            {"FC-SEC-001": "High", "FC-ERR-001": "Medium"},
            {"FC-SEC-001": DEFECT, "FC-ERR-001": DEFECT}, 93.4)
    b = run("m2-1", "model-b",
            {"FC-SEC-001": "Critical", "FC-ERR-001": "Medium", "FC-DEAD-001": "Low"},
            {"FC-SEC-001": DEFECT, "FC-ERR-001": TRADEOFF}, 91.4)  # sev drift + cls drift + extra finding
    rep = analyze([a, b])
    assert rep["summary"]["findings_with_severity_drift"] == 1, rep
    sd = rep["severity_drift"][0]
    assert sd["finding"] == "FC-SEC-001" and sd["assignments"] == {"m1-1": "High", "m2-1": "Critical"}, sd
    assert rep["summary"]["defect_vs_tradeoff_conflicts"] == 1, rep
    cd = rep["classification_drift"][0]
    assert cd["finding"] == "FC-ERR-001" and cd["defect_vs_tradeoff"] is True, cd
    assert rep["score_variance"][0]["max_delta"] == 2.0, rep["score_variance"]
    assert rep["summary"]["deterministic"] is False

    gap = rep["coverage_gaps"][0]
    assert gap["finding"] == "FC-DEAD-001" and gap["seen_in"] == ["m2-1"], rep["coverage_gaps"]

    # Clean case: identical severities/classifications/scores -> deterministic
    c = run("m1-2", "model-a", {"FC-SEC-001": "High"}, {"FC-SEC-001": DEFECT}, 93.4)
    d = run("m2-2", "model-b", {"FC-SEC-001": "High"}, {"FC-SEC-001": DEFECT}, 93.4)
    rep2 = analyze([c, d])
    assert rep2["summary"]["deterministic"] is True, rep2
    assert rep2["score_variance"][0]["max_delta"] == 0.0

    # Template rows are skipped
    t = dict(c, run_id="TPL", is_template=True, model_id="x")
    assert analyze([t])["summary"]["runs_compared"] == 0

    # End-to-end through the tempfile path
    with tempfile.TemporaryDirectory() as td:
        p = os.path.join(td, "runs.json")
        json.dump({"runs": [a, b]}, open(p, "w"))
        rep3 = load_and_analyze(p)
        assert rep3["summary"]["findings_with_classification_drift"] == 1
    print("compare_eval_runs self-test OK (severity drift, classification drift, "
          "score variance, coverage gaps, clean case, template skip)")


def load_and_analyze(path):
    data = json.load(open(path, encoding="utf-8"))
    runs = data if isinstance(data, list) else data.get("runs", [])
    return analyze(runs)


def main(argv):
    if "--self-test" in argv:
        return self_test()
    path = argv[0] if argv and not argv[0].startswith("--") else "evals/runs.json"
    try:
        rep = load_and_analyze(path)
    except (OSError, json.JSONDecodeError) as e:
        print(f"error: cannot read run log store {path!r}: {e}", file=sys.stderr)
        return 1
    if "--json" in argv:
        print(json.dumps(rep, indent=2))
    else:
        print(f"Run log store: {path} ({rep['summary']['runs_compared']} runs)")
        for g in rep["groups"]:
            print(f"\n[{g['eval']} @ {g['fixture']}] runs={g['runs']} models={g['models']}")
        print("\nSeverity Drift:")
        print("  (none)" if not rep["severity_drift"] else
              "\n".join(f"  - {d['finding']}: {d['assignments']}" for d in rep["severity_drift"]))
        print("\nClassification Drift (Phase 0.5):")
        print("  (none)" if not rep["classification_drift"] else
              "\n".join(f"  - {d['finding']}: {d['assignments']}" +
                        ("  [DEFECT vs TRADE-OFF]" if d["defect_vs_tradeoff"] else "")
                        for d in rep["classification_drift"]))
        print("\nScore Variance:")
        for s in rep["score_variance"]:
            flag = "OK" if s["within_tolerance"] else "OVER TOLERANCE"
            print(f"  - {s['eval']}: max delta {s['max_delta']} ({flag}) {s['scores']}")
        if rep["coverage_gaps"]:
            print("\nCoverage Gaps (finding seen by some runs only):")
            print("\n".join(f"  - {g['finding']} missing from {g['missing_from']}" for g in rep["coverage_gaps"]))
        print(f"\nDeterministic: {rep['summary']['deterministic']}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
