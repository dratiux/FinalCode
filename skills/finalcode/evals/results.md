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

## Multi-model determinism matrix (v5.3.0)

Run logs live in [runs.json](runs.json) (schema: `evals/evals.json` → `run_log_schema`).
Compare with `python3 scripts/compare_eval_runs.py evals/runs.json` — it reports
**Severity Drift**, **Classification Drift** (Phase 0.5), and **Score Variance** per eval group.
Zero drift is the release bar for the next model matrix; the baseline below already
demonstrates all three signal types.

Required columns per trial: `model_id`, `provider`, `run_index`, `detected_findings`,
`assigned_severities`, `phase_05_classifications`, `final_health_score`.
Classifications use Phase 0.5 categories (see `core/decision-engine.md`, Phase 0.5); the
baseline findings files used the report-level `classification` field
(Security Vulnerability / Confirmed Defect), recorded here as `Confirmed Defect`.

### Baseline runs (2026-09-14, author-simulated fresh-agent trials, single model family)

model_id / provider were **not recorded** in the baseline; columns below are `—` until re-trialed.

| Eval | Run | model_id | provider | run_index | detected_findings (id → locations) | assigned_severities | phase_05_classifications | final_health_score |
|---|---|---|---|---|---|---|---|---|
| inspect-tiny-app | inspect-1 | — | — | 1 | FC-SEC-001→config.py,app.py; FC-SEC-002→config.py; FC-DEAD-001→app.py; FC-ERR-001→app.py; FC-TEST-001→tiny-app | SEC-001 **High**, SEC-002 Med, DEAD-001 Low, ERR-001 Med, TEST-001 Med | all Confirmed Defect | 93.4 / A |
| inspect-tiny-app | inspect-2 | — | — | 2 | FC-SEC-001→config.py:1,app.py:1/10; FC-SEC-002→config.py:3; FC-ERR-001→app.py:9-12; FC-DEAD-001→app.py:4-5; FC-TEST-001→tiny-app/ | SEC-001 **Critical**, SEC-002 Med, ERR-001 Med, DEAD-001 Low, TEST-001 Med | all Confirmed Defect | 91.4 / A |
| repair-tiny-app | repair-1 | — | — | 3 | FC-SEC-001→config.py:2,app.py:1/10; FC-SEC-002→config.py:3; FC-DEAD-001→app.py:4; FC-ERR-001→app.py:11/12 (post-repair: 1 remaining) | SEC-001 Critical, SEC-002 High, DEAD-001 Low, ERR-001 Med | all Confirmed Defect | 98.8 / A+ (pre-repair 90.8) |

**Baseline drift (from `compare_eval_runs.py`):**

| Signal | Result | Detail |
|---|---|---|
| Severity Drift | ⚠️ 1 | FC-SEC-001: High (inspect-1) vs Critical (inspect-2) — the motivating example for the secrets severity anchor |
| Classification Drift (Phase 0.5) | ✅ 0 | no Intentional/Accepted Trade-off records existed in the baseline to conflict |
| Score Variance | ⚠️ 2.0 | 93.4 vs 91.4 on inspect-tiny-app (driven entirely by the SEC-001 severity drift) |
| Coverage Gaps | ℹ️ | FC-TEST-001 absent from repair runs (grouped separately, so no cross-model gap flag) |

### New model trials (fill before next release)

One row per trial; append the matching run object to `runs.json` first, then run the
comparator. Benchmarks: cloudflare-worker, express-api, intentionally-broken, next-production,
node-api, production-ready, react-large, react-small, typescript-library.

| Eval | Run | model_id | provider | run_index | detected_findings | assigned_severities | phase_05_classifications | final_health_score | Drift notes |
|---|---|---|---|---|---|---|---|---|---|
| inspect-tiny-app | (new) | claude-sonnet-4 | anthropic | 1 | | | | | |
| inspect-tiny-app | (new) | gpt-5 | openai | 1 | | | | | |
| inspect-tiny-app | (new) | qwen-max | alibaba | 1 | | | | | |
| inspect-tiny-app | (new) | <model> | <provider> | 2 | | | | | |

> Acceptance for release: `compare_eval_runs.py` must report **zero** Severity Drift and
> zero Classification Drift, and Score Variance ≤ 0.0, across all model columns.
> Any drift is a release-blocking review item (fix with an anchor rule, not a tolerance).
