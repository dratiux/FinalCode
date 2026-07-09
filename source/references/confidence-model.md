# FinalCode Confidence Model

The Confidence Model measures how much of the repository's production readiness was actually verified versus assumed. It provides multiple metrics to give a complete picture of audit confidence.

## Confidence Model 2.0

The original Confidence Model replaced the single confidence number with six explained metrics.

### Metrics

| Metric | Meaning |
|---|---|
| Analysis Confidence | Confidence in the analytical correctness of findings |
| Evidence Coverage | Share of findings backed by concrete evidence |
| Verification Coverage | Share of fixes/claims actually verified |
| Runtime Coverage | Share of runtime behavior actually observed |
| Repository Coverage | Share of the repo actually inspected |
| Overall Reliability | Weighted synthesis — the certification confidence basis |

### Calculation

Each metric is calculated as:

```
Metric = (verified items / total items) × 100%
```

### Explanation Requirements

Each metric must state **why** it has that value. Never present a bare percentage without the reason.

| Metric | Why it has that value |
|---|---|
| Analysis Confidence | Based on how deterministic/verifiable the checks were |
| Evidence Coverage | Count of evidenced vs total findings |
| Verification Coverage | Build/lint/test/lint executed and passed? |
| Runtime Coverage | Runtime exec available? DB/production reachable? |
| Repository Coverage | From Repository Coverage % |
| Overall Reliability | Weighted synthesis of the above |

**Confidence Justification Format (v2.2.0):**

Every confidence score must always include an explanation:

```
Analysis Confidence: 93%

Reason:
  Repository structure completely analyzed.
  No circular dependencies detected.
  Dependency graph verified.
  Configuration files available.
```

**Rule:** Never present a confidence score without the reason. The reason must explain what evidence supports the score and what evidence is missing.

### Overall Reliability

Overall Reliability is the weighted synthesis of all metrics. It is used as the certification confidence basis.

**Weights:**
- Analysis Confidence: 20%
- Evidence Coverage: 25%
- Verification Coverage: 25%
- Runtime Coverage: 15%
- Repository Coverage: 15%

**Rule:** The certification references **Overall Reliability**, never a single arbitrary confidence number.

## Certification Confidence Model

The Certification Confidence Model extends Confidence Model 2.0 with five source-specific metrics.

### Metrics

| Metric | What It Measures |
|---|---|
| Static Analysis Confidence | Confidence from lint, type-check, and static analysis tools |
| Testing Confidence | Confidence from unit, integration, and E2E test results and coverage |
| Runtime Confidence | Confidence from actual runtime execution, load testing, and production observation |
| Documentation Confidence | Confidence from documentation completeness and accuracy |
| Deployment Confidence | Confidence from build success, CI configuration, and deployment readiness |

### Calculation

Each metric is calculated from its source:

```
Static Analysis Confidence = (passed checks / total checks) × 100%
Testing Confidence = (test coverage × test pass rate) × 100%
Runtime Confidence = (runtime observations / total runtime behavior) × 100%
Documentation Confidence = (documented items / total items) × 100%
Deployment Confidence = (deployment checks passed / total deployment checks) × 100%
```

### Overall Reliability (Certification)

The Certification Confidence Model uses different weights:

| Metric | Weight |
|---|---|
| Static Analysis Confidence | 25% |
| Testing Confidence | 30% |
| Runtime Confidence | 15% |
| Documentation Confidence | 15% |
| Deployment Confidence | 15% |

**Note:** Testing gets the highest weight because it provides the most direct evidence of correctness.

### Profile Overrides

The weights may be overridden by project profile:

| Profile | Runtime Weight | Testing Weight |
|---|---|---|
| API | 25% | 25% |
| CLI | 10% | 35% |
| Library | 5% | 40% |
| Web Application | 20% | 25% |
| Mobile | 15% | 30% |

### Explanation Requirements

The report must clearly state:

```
Overall Reliability is NOT a probability. It represents evidence completeness —
how much of the repository's production readiness was actually verified versus assumed.
```

**Rule:** Never present Overall Reliability as "85% chance of no bugs" or similar.

## Confidence Model Format

```
CONFIDENCE MODEL 2.0
-------------------------------------------------
Analysis Confidence:      XX%  (why: based on how deterministic/verifiable the checks were)
Evidence Coverage:        XX%  (why: N of M findings backed by concrete evidence)
Verification Coverage:    XX%  (why: build/lint/test executed and passed? or Not Configured)
Runtime Coverage:         XX%  (why: runtime exec available? DB/production reachable?)
Repository Coverage:      XX%  (why: from Repository Coverage %)
Overall Reliability:      XX%  (weighted synthesis of the above — certification confidence basis)

(Each metric states its reason; never present a bare percentage without the why.)

-------------------------------------------------
CERTIFICATION CONFIDENCE MODEL
-------------------------------------------------
Static Analysis Confidence:    XX%  (why: lint + type check results)
Testing Confidence:            XX%  (why: unit/integration/E2E test results and coverage)
Runtime Confidence:            XX%  (why: runtime execution, load testing, production observation)
Documentation Confidence:      XX%  (why: documentation completeness and accuracy)
Deployment Confidence:         XX%  (why: build success, CI configuration, deployment readiness)

Overall Reliability:           XX%  (weighted: Static 25%, Testing 30%, Runtime 15%, Docs 15%, Deploy 15%)

Overall Reliability is NOT a probability. It represents evidence completeness — how much of the
repository's production readiness was actually verified versus assumed.
```

## Integration with Other Engines

The Confidence Model consumes:

- **Repository Coverage** — what was inspected
- **Gate execution results** — what passed/failed
- **Test results** — coverage and pass rates
- **Runtime observations** — if available

The Confidence Model produces:

- Confidence Model 2.0 (report section)
- Certification Confidence Model (report section)
- Overall Reliability (used by Release Engine and Certification)
