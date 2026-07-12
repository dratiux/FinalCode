# FinalCode Benchmark Suite

## Purpose

The Benchmark Suite validates FinalCode's correctness across known engineering scenarios. Every release must pass all benchmarks to ensure backward compatibility and prevent regressions.

## Philosophy

- **No analysis improvements in benchmark releases** — this infrastructure proves correctness, not capability
- **Golden Reports define expected behavior** — deviations must be explained
- **Regression detection** — every release is compared against the previous one
- **Coverage tracking** — every rule and gate must have validation scenarios

## Directory Structure

```
benchmarks/
├── README.md                           # This file
├── metadata.json                       # Suite-level metadata
├── rule-validation-matrix.json         # Rule validation scenarios
├── coverage.json                       # Coverage tracking
├── regression-dashboard.json           # Regression summary
├── rule-stability.json                 # Rule version tracking
├── benchmarks/
│   ├── react-small/                    # Small React application
│   │   ├── metadata.json               # Benchmark metadata
│   │   ├── description.md              # Repository description
│   │   ├── golden-report.md            # Canonical FinalCode output
│   │   └── expected-findings.json      # Expected findings
│   ├── react-large/                    # Large React application
│   ├── next-production/                # Next.js production application
│   ├── node-api/                       # Node.js API server
│   ├── express-api/                    # Express API server
│   ├── cloudflare-worker/              # Cloudflare Worker
│   ├── typescript-library/             # TypeScript library
│   ├── production-ready/               # Production-ready application
│   └── intentionally-broken/           # Intentionally broken for validation
└── engineering-baselines/              # Engineering baseline definitions
    └── baselines.json                  # Baseline definitions
```

## Benchmark Metadata

Every benchmark declares:

| Field | Description |
|-------|-------------|
| `repositoryType` | Type of repository (application, library, API, worker) |
| `framework` | Primary framework used |
| `language` | Primary language |
| `complexity` | Complexity level (simple, moderate, complex) |
| `repositorySize` | Approximate size (small, medium, large) |
| `purpose` | What this benchmark validates |
| `expectedVerdict` | Expected certification verdict |
| `expectedRisks` | Expected risk areas |
| `difficulty` | Difficulty level (easy, moderate, hard) |

## Golden Reports

Every benchmark includes a golden report representing the canonical FinalCode output for that scenario. Future versions compare against these golden reports.

When results differ from a golden report:

1. Determine if the difference is a regression or an improvement
2. If regression: fix the code before release
3. If improvement: update the golden report with documented justification
4. Never silently change golden reports

## Regression Validation

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

## Rule Validation Matrix

Every engineering rule must define:

| Field | Description |
|-------|-------------|
| `positiveExamples` | Cases that should trigger this rule |
| `negativeExamples` | Cases that should not trigger this rule |
| `falsePositiveExamples` | Known false positive patterns |
| `falseNegativeRisks` | Risks of missing this rule |
| `expectedEvidence` | What evidence should be collected |
| `expectedRecommendation` | What recommendation should be generated |
| `expectedCertificationImpact` | How this rule affects certification |

## Benchmark Coverage

Track coverage across the entire benchmark suite:

| Metric | Description |
|--------|-------------|
| `rulesTested` | Number of rules with validation scenarios |
| `rulesUntested` | Number of rules without validation scenarios |
| `frameworkCoverage` | Percentage of frameworks with benchmarks |
| `gateCoverage` | Percentage of Quality Gates with benchmarks |
| `recommendationCoverage` | Percentage of recommendation types covered |
| `evidenceCoverage` | Percentage of evidence types covered |
| `knowledgeBaseCoverage` | Percentage of knowledge base covered |

## Rule Stability

Every engineering rule exposes:

| Field | Description |
|-------|-------------|
| `currentVersion` | Current version of the rule |
| `firstIntroduced` | Version when first introduced |
| `lastModified` | Version when last modified |
| `stability` | Stability level (experimental, stable, deprecated) |
| `replacementRule` | Rule ID that replaces this rule (if deprecated) |
| `behaviorChanges` | List of behavior changes over versions |

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
