# FinalCode Decision Engine

The Decision Engine is the core reasoning system that transforms raw repository observations into actionable engineering decisions. Every finding passes through a formal pipeline that ensures consistency, traceability, and explainability.

## Decision Pipeline

Every finding must pass through the following pipeline in order:

```
Evidence Collection
       ↓
Rule Matching
       ↓
Risk Analysis
       ↓
Classification
       ↓
Severity Calibration
       ↓
Release Impact Assessment
       ↓
Report Generation
```

### Pipeline Stages

#### 1. Evidence Collection

Gather objective evidence from the repository:

- File paths and line numbers
- Build output (pass/fail, warnings)
- Type-check results (errors, warnings)
- Lint results (violations, categories)
- Test results (pass/fail, coverage)
- Dependency analysis (versions, vulnerabilities)
- Runtime observations (if available)
- Static analysis output

**Rule:** Never proceed without evidence. If evidence is insufficient, classify as "Needs Verification" and stop.

#### 2. Rule Matching

Match evidence against applicable rules:

- Quality Gate criteria (13 gates)
- Security Gate 2.0 checklist (14 categories)
- Configuration policy (if present)
- Plugin rules (if active)
- Project profile requirements

**Rule:** Each finding must match at least one rule. If no rule matches, the observation is not a finding.

#### 3. Risk Analysis

Evaluate the engineering risk:

- **Impact Scope:** How much of the system is affected?
- **Probability:** How likely is this to cause a problem?
- **Reversibility:** Can this be easily fixed later?
- **Dependency Risk:** Does this affect other components?
- **User Impact:** Does this affect end users?

**Risk Level Calculation:**

| Impact | Probability | Risk Level |
|--------|-------------|------------|
| High | High | Critical |
| High | Medium | High |
| High | Low | Medium |
| Medium | High | High |
| Medium | Medium | Medium |
| Medium | Low | Low |
| Low | High | Medium |
| Low | Medium | Low |
| Low | Low | Informational |

#### 4. Classification

Classify the finding into exactly one category:

| Classification | Meaning | Affects Certification |
|---|---|---|
| Confirmed Defect | Objective engineering issue supported by evidence | Yes |
| Security Vulnerability | Verified security weakness or insecure implementation | Yes |
| Engineering Recommendation | Improvement that increases maintainability or scalability | No |
| Architectural Suggestion | Alternative architectural approach | No |
| Style Recommendation | Cosmetic or stylistic suggestion | No |

**Rule:** Only Confirmed Defect and Security Vulnerability may fail a mandatory Quality Gate or block certification.

#### 5. Severity Calibration

Assign severity based on actual engineering impact:

| Severity | Meaning |
|---|---|
| Critical | Immediate security risk, data loss, or complete functionality failure |
| High | Significant defect or security weakness requiring prompt attention |
| Medium | Moderate impact on maintainability, correctness, or security |
| Low | Minor issue with limited impact |
| Informational | Noteworthy observation that does not constitute a defect |

**Rule:** Every severity must include justification explaining why that level was chosen based on actual engineering impact.

#### 6. Release Impact Assessment

Determine release impact using the Release Blocker Engine:

| Classification | Release Impact |
|---|---|
| Release Blocker | Always blocks release |
| Conditional Blocker | Blocks only when specific conditions apply |
| Engineering Recommendation | Never blocks release |
| Informational | Never blocks release |

**Rule:** Never block a release unless the blocking condition is explicitly documented.

#### 7. Report Generation

Generate the finding entry in the report:

- Apply Explainability Engine (see `explainability.md`)
- Apply Finding Format (see `finding-classification.md`)
- Apply Priority Matrix (P0-P3)
- Apply Engineering Cost and Risk if Ignored

## Decision Rules (Single Source)

All decision rules must exist in one place. The following systems consume the same decision model:

- Report generation
- Health Score calculation
- Grade assignment
- Certification decision
- Priority Matrix generation
- Release Blocker assessment

**Rule:** No duplicated evaluation logic. When a rule changes, it changes in one place only.

## Traceability

Every decision must be traceable back to:

1. The evidence that triggered it
2. The rule that matched
3. The risk analysis that determined severity
4. The classification that categorized it
5. the release impact assessment that determined blocking

**Example Traceability:**

```
Finding: FC-SEC-001
Evidence: Hardcoded API key in src/config.ts:42
Rule: Security Gate 2.0 — Secrets Management
Risk Analysis: High impact (security exposure), High probability (exploitable)
Classification: Security Vulnerability
Severity: Critical (immediate security risk)
Release Impact: Release Blocker (always blocks)
Priority: P0
```

## Consistency Validation

Before emitting any finding, validate:

1. Severity matches risk analysis
2. Classification matches rule matching
3. Release impact matches classification and severity
4. Priority matches severity and engineering cost
5. No contradictory statements

If validation fails, correct the inconsistency or flag it explicitly.
