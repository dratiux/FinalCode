# Eval results

## Iteration 1 (2026-09-14, v5.1.0 release candidate)

| Eval | Result | Evidence |
|---|---|---|
| 1 score-is-deterministic | PASS | `health_score.py` → 95.9 / A+ / Excellent; `--self-test` OK |
| 2 validator-catches-bad-findings | PASS | `--self-test` OK (4 errors: bad id, bad severity, duplicate, grade mismatch) |
| 3 inspect-tiny-app | PASS | 3 findings validate clean; score 95.8/A+ via script; verdict NOT READY (High blocks); secret only as [REDACTED]; fixture unmodified |

## Iteration 2 (2026-09-14, fresh-agent trial, 3 parallel runs)

Baseline (author simulation): 3 findings (SEC High, ERR Medium, DEAD Low), 95.8/A+, NOT READY.

| Run | Findings | Score | Verdict | Notes |
|---|---|---|---|---|
| inspect-1 | 5 (SEC-001 High, SEC-002 Med, DEAD Low, ERR Med, TEST Med) | 93.4/A | NOT READY (2) | scripts used, redacted; flagged `.finalcode/` writes vs read-only contradiction |
| inspect-2 | 5 (SEC-001 **Critical**, SEC-002 Med, ERR Med, DEAD Low, TEST Med) | 91.4/A | NOT READY (2) | scripts used, redacted; found examples.md grade bug (64→D, should be C), dead-code weight gap |
| repair-1 (copy) | 4 pre (SEC Critical+High, DEAD, ERR) → 1 remaining | 90.8/A → 98.8/A+ | NOT READY → READY WITH WARNINGS | fixed 3 with py_compile+grep+import verification; correctly refused ERR-001 (failure-contract change needs human); original fixture untouched |

Headline: scoring is deterministic **given severities**, but severity calibration varies across agents (SEC High vs Critical) — fixed with a secrets severity anchor. 5 evidence-driven fixes applied: examples.md grade, secrets anchor, dead-code folding in scorer, read-only artifact rule, Not-Configured verification rule.
