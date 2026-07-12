# FinalCode Benchmark Suite

## Purpose

The Benchmark Suite validates FinalCode's correctness across known engineering scenarios. Every release must pass all benchmarks to ensure backward compatibility and prevent regressions.

## Quick Start

### Run Validation

```bash
python benchmarks/scripts/validate-regression.py
```

### View Results

```bash
cat benchmarks/validation-results.json
```

## Benchmark Structure

Each benchmark contains:

- `metadata.json` — Benchmark metadata (framework, complexity, expected verdict)
- `description.md` — Repository description
- `golden-report.md` — Canonical FinalCode output
- `expected-findings.json` — Expected findings and quality gate results

## Running Benchmarks

### Manual Validation

1. Run FinalCode on each benchmark repository
2. Compare output against golden report
3. Report any differences

### Automated Validation

```bash
python benchmarks/scripts/validate-regression.py
```

This validates:
- All benchmark metadata exists
- All expected findings exist
- All golden reports exist
- Regression dashboard is valid
- Coverage tracking is valid
- Rule stability is valid
- Rule validation matrix is valid

## Regression Detection

For every benchmark, compare:

| Metric | Previous Release | Current Release | Delta |
|--------|-----------------|-----------------|-------|
| Finding count | — | — | — |
| Severity distribution | — | — | — |
| Priority distribution | — | — | — |
| Quality Gate results | — | — | — |
| Certification verdict | — | — | — |
| Health Score | — | — | — |
| Recommendations | — | — | — |

Unexpected differences must be reported and explained.

## Coverage Tracking

Track coverage across the entire benchmark suite:

| Metric | Current | Target |
|--------|---------|--------|
| Rules Tested | 8 | 100% |
| Framework Coverage | 43% | 100% |
| Gate Coverage | 100% | 100% |
| Recommendation Coverage | 60% | 100% |
| Evidence Coverage | 75% | 100% |
| Knowledge Base Coverage | 57% | 100% |

## Golden Reports

Every benchmark includes a golden report representing the canonical FinalCode output for that scenario. Future versions compare against these golden reports.

When results differ from a golden report:

1. Determine if the difference is a regression or an improvement
2. If regression: fix the code before release
3. If improvement: update the golden report with documented justification
4. Never silently change golden reports

## Release Validation Checklist

Every FinalCode release must validate:

- Existing benchmarks still pass
- No unexpected regressions
- Existing reports remain compatible
- Rule stability maintained
- Certification unchanged unless intentional
- Golden reports updated only with documented justification

Release notes must explicitly list:

- Improved Benchmarks
- Changed Benchmarks
- Regressed Benchmarks
- New Benchmarks

## Engineering Baselines

Define expected behavior for different project types:

| Baseline | Expected Findings | Expected Quality | Expected Certification |
|----------|------------------|------------------|----------------------|
| Small React Project | Low | High | READY TO SHIP |
| Large Enterprise Project | Medium | Medium | READY WITH WARNINGS |
| Backend API | Low-Medium | High | READY TO SHIP |
| Cloudflare Worker | Low | High | READY TO SHIP |
| TypeScript Library | Low | High | READY TO SHIP |
| Prototype | High | Low | NOT READY |
| Production Application | Low | High | READY TO SHIP |
