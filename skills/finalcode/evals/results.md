# Eval results

## Iteration 1 (2026-09-14, v5.1.0 release candidate)

| Eval | Result | Evidence |
|---|---|---|
| 1 score-is-deterministic | PASS | `health_score.py` → 95.9 / A+ / Excellent; `--self-test` OK |
| 2 validator-catches-bad-findings | PASS | `--self-test` OK (4 errors: bad id, bad severity, duplicate, grade mismatch) |
| 3 inspect-tiny-app | PASS | 3 findings validate clean; score 95.8/A+ via script; verdict NOT READY (High blocks); secret only as [REDACTED]; fixture unmodified |
