# FinalCode Technical Debt Analyzer

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Classifies and prioritizes technical debt |
| Execution Mode | Technical Debt Analysis |
| Loaded By | Certification Engine |
| Dependencies | Decision Engine, Correlation Engine |
| Outputs | Debt classification, cost estimates, priority |
| Consumers | User, Certification Engine |
| Applies To | All audits |

## Overview

Technical Debt Analyzer classifies technical debt into categories, estimates the cost to fix, assesses future impact, and prioritizes remediation. This enables teams to systematically address technical debt.

**Why this matters:** Technical debt is inevitable. The key is to understand it, classify it, and prioritize it. Technical Debt Analyzer provides the intelligence needed to make informed decisions about debt remediation.

## Debt Categories

### Architecture Debt

| Indicator | Description | Cost to Fix |
|-----------|-------------|-------------|
| God components | Components with too many responsibilities | High |
| Circular dependencies | Dependencies that form cycles | High |
| Weak boundaries | Missing module boundaries | Medium |
| Missing abstractions | Missing required abstractions | Medium |
| Tight coupling | Modules too tightly coupled | High |

### Security Debt

| Indicator | Description | Cost to Fix |
|-----------|-------------|-------------|
| Outdated dependencies | Dependencies with known vulnerabilities | Low |
| Missing security headers | Security headers not configured | Low |
| Weak authentication | Authentication implementation gaps | Medium |
| Missing input validation | Input validation gaps | Medium |
| Hardcoded secrets | Secrets in source code | Low |

### Performance Debt

| Indicator | Description | Cost to Fix |
|-----------|-------------|-------------|
| Unoptimized queries | Database queries not optimized | Medium |
| Missing caching | Caching not implemented | Medium |
| Large bundles | Bundle size above threshold | Medium |
| Missing compression | Compression not enabled | Low |
| Missing lazy loading | Lazy loading not implemented | Low |

### Testing Debt

| Indicator | Description | Cost to Fix |
|-----------|-------------|-------------|
| Low test coverage | Test coverage below threshold | Medium |
| Missing integration tests | Integration tests missing | Medium |
| Missing E2E tests | E2E tests missing | High |
| Flaky tests | Tests that sometimes fail | Medium |
| Missing test documentation | Test documentation missing | Low |

### Documentation Debt

| Indicator | Description | Cost to Fix |
|-----------|-------------|-------------|
| Missing README | README missing or incomplete | Low |
| Missing API docs | API documentation missing | Low |
| Missing JSDoc | JSDoc comments missing | Low |
| Missing CHANGELOG | CHANGELOG missing | Low |
| Missing architecture docs | Architecture documentation missing | Medium |

### Typing Debt

| Indicator | Description | Cost to Fix |
|-----------|-------------|-------------|
| `any` types | TypeScript `any` usage | Low |
| Missing types | Missing type definitions | Low |
| Weak types | Types too permissive | Medium |
| Missing interfaces | Missing interfaces | Low |
| Type assertions | Type assertions bypassing type checking | Low |

### Code Style Debt

| Indicator | Description | Cost to Fix |
|-----------|-------------|-------------|
| Inconsistent formatting | Code formatting inconsistent | Low |
| Inconsistent naming | Naming conventions inconsistent | Low |
| Dead code | Unused code | Low |
| Unused imports | Unused imports | Low |
| Magic numbers | Hardcoded numbers | Low |

### Maintainability Debt

| Indicator | Description | Cost to Fix |
|-----------|-------------|-------------|
| Complex functions | Functions too complex | Medium |
| Large files | Files too large | Medium |
| Duplicated code | Code duplicated across files | Medium |
| Missing error handling | Error handling gaps | Medium |
| Missing logging | Logging gaps | Low |

## Cost Estimation

### Time Estimation

| Cost Level | Description | Time Range |
|------------|-------------|------------|
| Very Low | Quick fix | < 15 min |
| Low | Simple fix | 15 min - 1 hour |
| Medium | Moderate effort | 1 - 4 hours |
| High | Significant effort | 4 - 8 hours |
| Very High | Major effort | > 8 hours |

### Future Impact Assessment

| Impact | Description | Example |
|--------|-------------|---------|
| None | No future impact | Dead code |
| Low | Minor future impact | Unused imports |
| Medium | Moderate future impact | Missing tests |
| High | Significant future impact | Architecture issues |
| Critical | Critical future impact | Security issues |

## Priority Matrix

| Priority | Cost | Impact | Action |
|----------|------|--------|--------|
| P0 | Any | Critical | Fix immediately |
| P1 | Low | High | Fix in current sprint |
| P2 | Medium | High | Fix in next sprint |
| P3 | High | Medium | Fix when convenient |
| P4 | Very High | Low | Consider fixing |

## Output Format

```
TECHNICAL DEBT ANALYSIS
==================================================
Total Debt Items: 45
Overall Debt Level: Medium

Architecture Debt: 8 items
  - God components: 2 (Cost: High, Impact: High)
  - Circular dependencies: 0
  - Weak boundaries: 3 (Cost: Medium, Impact: Medium)
  - Missing abstractions: 3 (Cost: Medium, Impact: Medium)

Security Debt: 12 items
  - Outdated dependencies: 5 (Cost: Low, Impact: High)
  - Missing security headers: 3 (Cost: Low, Impact: Medium)
  - Weak authentication: 2 (Cost: Medium, Impact: High)
  - Missing input validation: 2 (Cost: Medium, Impact: Medium)

Performance Debt: 8 items
  - Unoptimized queries: 2 (Cost: Medium, Impact: Medium)
  - Missing caching: 3 (Cost: Medium, Impact: Medium)
  - Large bundles: 2 (Cost: Medium, Impact: Low)
  - Missing compression: 1 (Cost: Low, Impact: Low)

Testing Debt: 7 items
  - Low test coverage: 3 (Cost: Medium, Impact: High)
  - Missing integration tests: 2 (Cost: Medium, Impact: Medium)
  - Missing E2E tests: 2 (Cost: High, Impact: Medium)

Documentation Debt: 5 items
  - Missing README: 1 (Cost: Low, Impact: Low)
  - Missing API docs: 2 (Cost: Low, Impact: Low)
  - Missing JSDoc: 2 (Cost: Low, Impact: Low)

Typing Debt: 3 items
  - `any` types: 2 (Cost: Low, Impact: Low)
  - Missing types: 1 (Cost: Low, Impact: Low)

Code Style Debt: 2 items
  - Dead code: 1 (Cost: Low, Impact: Low)
  - Unused imports: 1 (Cost: Low, Impact: Low)

Maintainability Debt: 0 items

Priority Summary:
  P0: 2 items (Critical)
  P1: 8 items (High)
  P2: 15 items (Medium)
  P3: 12 items (Low)
  P4: 8 items (Very Low)

Cost Summary:
  Very Low: 5 items (2 hours)
  Low: 15 items (15 hours)
  Medium: 18 items (54 hours)
  High: 5 items (30 hours)
  Very High: 2 items (20 hours)

Total Estimated Cost: 121 hours

Remediation Plan:
  Phase 1 (P0): Fix critical security issues (2 hours)
  Phase 2 (P1): Fix high-priority issues (15 hours)
  Phase 3 (P2): Fix medium-priority issues (54 hours)
  Phase 4 (P3): Fix low-priority issues (30 hours)
  Phase 5 (P4): Consider fixing very low issues (20 hours)

Expected Impact:
  Current Debt Level: Medium
  After Phase 1: Low
  After Phase 2: Very Low
  After Phase 3: Minimal
  After Phase 4: Minimal
  After Phase 5: Minimal
==================================================
```

## Architecture Explainability

### Responsibilities

- Classify technical debt
- Estimate cost to fix
- Assess future impact
- Prioritize remediation

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Debt classification
- Cost estimation
- Impact assessment
- Priority assignment

### Consumed Decisions

- Classified findings (from Decision Engine)
- Correlated findings (from Correlation Engine)

### Produced Decisions

- Debt classification
- Cost estimates
- Impact assessments
- Priority assignments
