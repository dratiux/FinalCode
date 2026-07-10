# FinalCode Finding Classification

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Defines finding status, classification, IDs, severity, lifecycle, and format |
| Execution Stage | DECISION |
| Loaded By | Decision Engine, Report Engine |
| Dependencies | None (standalone) |
| Outputs | Finding format, classification rules, severity calibration, lifecycle states |
| Consumers | Decision Engine, Report Engine, Explainability Engine |
| Applies To | All audits |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| rawObservations | array | Yes | Evidence collection |
| applicableRules | array | Yes | Rule Registry |
| gateCriteria | object | Yes | Quality Gates |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| findingStatus | string | Confirmed / Needs Verification / Not Verified |
| findingClassification | string | Confirmed Defect / Security Vulnerability / Engineering Recommendation / Architectural Suggestion / Style Recommendation |
| findingId | string | Stable unique identifier (FC-<CATEGORY>-<NUMBER>) |
| severity | string | Critical / High / Medium / Low / Informational |
| lifecycleState | string | Detected / Verified / Fixed / Reopened / Deprecated / Ignored / Accepted Risk |

### Preconditions

- Raw observations must be collected from repository
- Applicable rules must be loaded from Rule Registry
- Gate criteria must be defined

### Postconditions

- Every finding has exactly one status
- Every finding has exactly one classification
- IDs remain stable across re-runs
- Severity reflects actual engineering impact

### Required Evidence

| Evidence | Purpose |
|----------|---------|
| File paths and line numbers | Attach findings to specific locations |
| Build output | Determine pass/fail status |
| Type-check results | Determine type safety issues |
| Lint results | Determine code quality issues |
| Test results | Determine testing coverage |
| Dependency analysis | Determine dependency issues |

### Generated Decisions

| Decision | Rule |
|----------|------|
| Finding status | Evidence verification level |
| Finding classification | Rule matching result |
| Severity | Risk analysis + engineering impact |
| Release impact | Classification + severity + policy |
| Priority | Severity + engineering cost |

### Possible Outcomes

| Outcome | Condition |
|---------|-----------|
| Confirmed Defect | Objective issue with strong evidence |
| Security Vulnerability | Verified security weakness |
| Engineering Recommendation | Improvement suggestion |
| Architectural Suggestion | Alternative approach suggestion |
| Style Recommendation | Cosmetic suggestion |

This document defines how findings are classified, identified, and formatted. It serves as the single source of truth for all finding-related rules.

## Finding Status

Every finding must use exactly one status:

| Status | Meaning |
|---|---|
| Confirmed | Verified through execution, build, type-check, lint, runtime inspection, or objective repository evidence |
| Needs Verification | Evidence exists but FinalCode could not fully verify |
| Not Verified | Insufficient evidence |

## Finding Lifecycle (v2.2.0)

Every finding must track its lifecycle state:

| State | Meaning |
|---|---|
| Detected | Newly identified in this inspection |
| Verified | Confirmed through independent verification |
| Fixed | Resolution applied and verified |
| Reopened | Previously fixed but issue has returned |
| Deprecated | Finding no longer applicable (e.g., code removed) |
| Ignored | Explicitly acknowledged and accepted |
| Accepted Risk | Risk acknowledged but no action planned |

**Rules:**
- Default state for new findings is "Detected"
- When historical reports are available, FinalCode must recognize previously reported findings and update their lifecycle state accordingly
- "Fixed" requires verification that the fix resolves the issue
- "Reopened" is assigned when a previously fixed finding reappears
- "Deprecated" is assigned when the finding's subject no longer exists
- "Ignored" and "Accepted Risk" require explicit user action via OVERRIDES.md

### Lifecycle Transitions

```
Detected → Verified → Fixed
Detected → Verified → Reopened (if previously Fixed)
Detected → Deprecated (if code removed)
Detected → Ignored (if user accepts)
Detected → Accepted Risk (if user acknowledges risk)
```

## Finding Classification

Every finding must be classified into exactly one category:

| Classification | Meaning | Affects certification? |
|---|---|---|
| Confirmed Defect | Objective engineering issue supported by evidence | Yes |
| Security Vulnerability | Verified security weakness or insecure implementation | Yes |
| Engineering Recommendation | Improvement that increases maintainability or scalability (includes OpenCode convention deviations) | No |
| Architectural Suggestion | Alternative architectural approach | No |
| Style Recommendation | Cosmetic or stylistic suggestion | No |

**Rule:** Only **Confirmed Defect** and **Security Vulnerability** may fail a mandatory Quality Gate or block certification.

## Finding IDs

Every finding must have a stable, unique identifier. IDs follow the format `FC-<CATEGORY>-<NUMBER>`:

| Category | Prefix | Example |
|---|---|---|
| Security | SEC | FC-SEC-001 |
| Code Quality | CODE | FC-CODE-003 |
| Performance | PERF | FC-PERF-002 |
| Architecture | ARCH | FC-ARCH-001 |
| Refactor | REF | FC-REF-004 |
| Type Safety | TYPE | FC-TYPE-001 |
| Dead Code | DEAD | FC-DEAD-001 |
| Error Handling | ERR | FC-ERR-001 |
| Testing | TEST | FC-TEST-001 |
| Accessibility | A11Y | FC-A11Y-001 |
| UI Consistency | UI | FC-UI-001 |
| Documentation | DOC | FC-DOC-001 |
| Dependencies | DEP | FC-DEP-001 |
| GitHub Readiness | GH | FC-GH-001 |

**Rules:**
- IDs must remain stable across re-runs
- Never renumber previous IDs
- When a finding is fixed, its ID is recorded in `CHANGE_REPORT.md` with resolution details
- New findings in the same category get the next sequential number

## Severity Calibration

Severity must reflect actual engineering impact. Never assume Engineering Recommendations are Low.

| Severity | Meaning |
|---|---|
| Critical | Immediate security risk, data loss, or complete functionality failure |
| High | Significant defect or security weakness requiring prompt attention |
| Medium | Moderate impact on maintainability, correctness, or security |
| Low | Minor issue with limited impact |
| Informational | Noteworthy observation that does not constitute a defect |

**Rule:** Every severity must include justification explaining why that level was chosen based on actual engineering impact.

## Smart Finding Classification (Occurrence Classifier)

For findings that occur many times across a repository, classify each instance:

| Class | Meaning | Expanded in report? |
|---|---|---|
| Safe | Occurs in a context with no realistic failure path | No — summarized as a count |
| Needs Review | Plausible risk but context-dependent; a human should glance at it | Yes — listed compactly |
| Unsafe | Realistic failure, security, or correctness path | Yes — full Finding Format |

**Rule:** Only **Unsafe** and **Needs Review** instances are expanded in the report. **Safe** instances are collapsed into a single line:

```
Type Safety: 42 safe `any` usages collapsed (e.g. FC-TYPE-001 ×42 safe occurrences)
```

## Engineering Category

Every finding receives an engineering-oriented category:

| Category | Meaning |
|---|---|
| Quick Win | Low effort, high impact — do first |
| Safe Refactor | Low risk improvement |
| Architecture Decision | Requires architectural choice |
| Infrastructure Decision | Requires infrastructure choice |
| Human Decision Required | Cannot be automated |
| Breaking Change | Changes public API or behavior |
| Technical Debt | Accumulated shortcuts |
| Maintainability | Improves code maintainability |
| Documentation | Improves documentation |
| Developer Experience | Improves developer workflow |

## Finding Impact Analysis

Every finding must contain an Impact Analysis:

| Field | Values |
|---|---|
| Engineering Cost | Low / Medium / High |
| Estimated Fix Time | 5 minutes / 30 minutes / 2 hours / Half day / Multiple days |
| Risk if Ignored | Developer productivity / Security / Performance / Maintainability / Release / None |

**Rule:** When a finding is a Release Blocker or Conditional Blocker, "Release" must appear in the Risk if Ignored field.

## Release Blocker Classification

Every finding is classified by release impact:

| Classification | Meaning | Blocks Release? |
|---|---|---|
| Release Blocker | Must be resolved before any production deployment | Always |
| Conditional Blocker | Blocks only under specific deployment conditions | Only when condition applies |
| Engineering Recommendation | Improves quality but never blocks release | Never |
| Informational | Observation, not a defect | Never |

See `release-engine.md` for the full Release Blocker Engine logic.

## Finding Format

Each individual finding must include:

- **FinalCode ID** (per Finding IDs)
- **Classification** (per Finding Classification)
- **Severity** (per Severity Calibration)
- **Status** (per Finding Status)
- **Category**
- **Release Blocker Classification** (per Release Blocker Engine)
- **Engineering Category** (per Smart Finding Classification)
- **Estimated Effort** (5 minutes / 30 minutes / 2 hours / Half day / Multiple days)
- **Engineering Cost** (Low / Medium / High)
- **Risk if Ignored** (Developer productivity / Security / Performance / Maintainability / Release / None)
- **Confidence**
- **Evidence**
- **Affected Files**
- **Root Cause** (never leave blank)
- **Root Cause Classification**
- **Preventive Recommendation** (never leave blank)
- **Impact**
- **Recommended Fix** (with Priority, Estimated Effort, Expected Impact, Prerequisites, Verification Method)
- **Verification Method**
- **Decision Analysis** (required when non-automatable)
- **Smart Finding Classification** (required when high-frequency)
- **Deployment Intelligence** (required for infrastructure findings)
- **Explainability Block** (see `explainability.md`)

**Security Vulnerabilities additionally include:** CVE Category (if applicable), Attack Vector.

**UI Consistency Gate findings** use the UI Evidence Requirements format instead.

## Root Cause Intelligence

Every finding must include a Root Cause Classification and Preventive Recommendation.

### Root Cause Classification (exactly one)

| Classification | Meaning |
|---|---|
| Human Error | Mistake in implementation or logic |
| Architecture | Structural design issue |
| Dependency | Issue caused by third-party package |
| Configuration | Incorrect or missing configuration |
| Framework | Issue inherent to or caused by the framework |
| External Library | Issue in an external library |
| Build System | Build pipeline or tooling issue |
| Security Misconfiguration | Insecure default or misconfigured setting |
| Technical Debt | Accumulated shortcuts or deferred improvements |
| Legacy Code | Outdated code that needs modernization |

**Rule:** Preventive Recommendation must explain how to prevent recurrence. Never leave blank.

## Recommendation Classification (v2.2.0)

Recommendations must be categorized independently of Severity and Priority:

| Category | Meaning |
|---|---|
| Bug Fix | Corrects incorrect behavior |
| Refactor | Improves code structure without behavior change |
| Architecture | Requires architectural decision |
| Performance | Improves performance characteristics |
| Security | Addresses security concern |
| Documentation | Improves documentation |
| Developer Experience | Improves developer workflow |
| Infrastructure | Requires infrastructure change |
| Testing | Improves test coverage or quality |
| Technical Debt | Addresses accumulated shortcuts |

**Rules:**
- Every finding must have exactly one Recommendation Classification
- Recommendation Classification is independent of Severity and Priority
- A Critical severity finding can have a "Documentation" recommendation if the documentation gap creates a security risk
