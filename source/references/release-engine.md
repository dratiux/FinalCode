# FinalCode Release Engine

The Release Engine determines whether a repository is ready for production deployment. It classifies findings by release impact, evaluates deployment context, and produces a justified release decision.

## Release Blocker Engine

The Release Blocker Engine replaces static blocking behavior with rule-based classification.

### Finding Classification

Every finding is classified into exactly one of four release-impact categories:

| Classification | Meaning | Blocks Release? |
|---|---|---|
| Release Blocker | Issue that must be resolved before any production deployment | Always |
| Conditional Blocker | Issue that blocks release only under specific deployment conditions | Only when the blocking condition applies |
| Engineering Recommendation | Improvement that increases quality but must never block release | Never |
| Informational | Observation that does not constitute a defect or improvement | Never |

### Classification Rules

A finding may only become a Release Blocker when **explicit blocking rules are satisfied**:

1. **Finding severity** — Critical severity is a prerequisite for Release Blocker; High severity may become Conditional Blocker
2. **Deployment context** — the current deployment target determines whether a Conditional Blocker actually blocks
3. **Blocking condition documentation** — the report must state the exact condition under which a Conditional Blocker becomes a Release Blocker

### Deployment Context Evaluation

The Release Blocker Engine evaluates deployment context:

| Deployment Target | Typical Impact |
|---|---|
| Single instance | Low — most issues are non-blocking |
| Development | Low — issues are expected |
| Preview | Low — issues are expected |
| Small production | Medium — Critical issues block |
| Multi-instance | High — scaling issues become blockers |
| Horizontal scaling | High — concurrency issues become blockers |
| Distributed Workers | High — consistency issues become blockers |
| Public API under heavy load | High — performance issues become blockers |

### Example — Distributed Rate Limiter

| Deployment Target | Classification |
|---|---|
| Single instance, development, preview, small production | Engineering Recommendation |
| Multi-instance, horizontal scaling, distributed Cloudflare Workers, public API under heavy load | Conditional Blocker |

### Blocking Condition Documentation

When a Conditional Blocker is identified, the report must state:

```
Blocking Conditions:
  FC-PERF-001 — blocks when: multi-instance deployment, horizontal scaling,
                distributed Cloudflare Workers, or public API under heavy load
```

**Rule:** Never block a release unless the blocking condition is explicitly documented in the report.

## Release Decision

### Decision Logic

The Release Decision is derived from:

1. **Quality Gate Status** — all mandatory gates must pass for READY TO SHIP
2. **Release Blockers** — any Release Blocker forces NOT READY
3. **Conditional Blockers** — evaluate against current deployment target
4. **Engineering Recommendations** — never block, but noted in report

### Decision Matrix

| Gates Pass | Release Blockers | Conditional Blockers (applicable) | Decision |
|------------|------------------|-----------------------------------|----------|
| All 13 | 0 | 0 | READY TO SHIP |
| All 13 | 0 | 1+ (not applicable) | READY TO SHIP |
| All 13 | 0 | 1+ (applicable) | READY WITH WARNINGS |
| All 13 | 1+ | any | NOT READY |
| Any fail | any | any | NOT READY |

### Release Decision Summary Format

```
RELEASE DECISION SUMMARY
-------------------------------------------------
Release Decision:  READY TO SHIP | READY WITH WARNINGS | NOT READY

Why:
  <exact reason — which gates pass/fail, which blockers exist, which conditions apply>

What Remains:
  <FC-ID>  <one-line description> (<classification> — <blocking status>)
  ...

Estimated Work Remaining:
  To reach READY TO SHIP (unconditional):  <time estimate>
    - <FC-ID>: <effort> (<what needs to be done>)
    ...
  Current deployment target: <whether READY TO SHIP is achievable without resolving Conditional Blockers>
```

## Release Traceability

Every release decision must be traceable:

```
READY WITH WARNINGS

Generated from:
  13/13 Gates Passed
  0 Release Blockers
  2 Conditional Blockers
  9 Engineering Recommendations
  31 Informational Findings
```

The user should always understand exactly why the certification was produced.

## Exit Code Convention

| Exit Code | Meaning |
|---|---|
| 0 | READY TO SHIP — all mandatory gates PASS |
| 1 | READY WITH WARNINGS — no Critical/High blockers, but Medium/Low or Needs Verification findings remain |
| 2 | NOT READY — one or more mandatory gates FAIL, or unresolved Critical/High findings |
| 3 | NO PROJECT FOUND — Phase 0 could not locate a repository |

**Rule:** Never certify READY TO SHIP unless every mandatory Quality Gate has passed.

## Integration with Other Engines

The Release Engine consumes:

- **Decision Engine** (see `decision-engine.md`) — for finding classification and severity
- **Health Score** (see `health-score.md`) — for policy target comparison
- **Confidence Model** (see `confidence-model.md`) — for Overall Reliability

The Release Engine produces:

- Release Blocker Summary (report section)
- Release Decision Summary (report section)
- Certification status and exit code
- Priority Matrix priorities (P0 for Release Blockers)
