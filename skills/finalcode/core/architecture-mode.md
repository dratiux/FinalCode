# FinalCode Architecture Mode

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Reviews architecture instead of code |
| Execution Mode | Architecture |
| Loaded By | Certification Engine |
| Dependencies | Repository Intelligence Engine, Correlation Engine |
| Outputs | Architecture findings, improvement suggestions |
| Consumers | User, Certification Engine |
| Applies To | All audits |

## Overview

Architecture Mode reviews the repository's architecture instead of individual code files. It detects architectural issues like god components, circular dependencies, and weak boundaries, then suggests improvements without rewriting unless approved.

**Why this matters:** Architecture issues are the most expensive to fix later. By detecting them early and suggesting targeted improvements, FinalCode helps prevent architectural decay before it becomes unmanageable.

## Detection Methods

### God Components

Detect components with too many responsibilities:

| Indicator | Detection Method | Threshold |
|-----------|-----------------|-----------|
| File size | Lines of code | > 500 lines |
| Method count | Public methods | > 20 methods |
| Import count | Dependencies | > 15 imports |
| Export count | Exports | > 10 exports |
| Responsibility count | Logical responsibilities | > 3 responsibilities |

**Scoring:**
- 0 responsibilities: 100 points
- 1 responsibility: 90 points
- 2 responsibilities: 75 points
- 3 responsibilities: 60 points
- 4+ responsibilities: 40 points

### God Services

Detect services with too many methods:

| Indicator | Detection Method | Threshold |
|-----------|-----------------|-----------|
| Method count | Public methods | > 30 methods |
| File size | Lines of code | > 1000 lines |
| Dependency count | Injected dependencies | > 10 dependencies |
| Responsibility count | Logical responsibilities | > 5 responsibilities |

### Circular Dependencies

Detect dependencies that form cycles:

| Detection Method | Description |
|-----------------|-------------|
| Import graph analysis | Build import graph, detect cycles |
| Module dependency analysis | Analyze module dependencies |
| Package dependency analysis | Analyze package dependencies |

**Scoring:**
- 0 cycles: 100 points
- 1-2 cycles: 70 points
- 3-5 cycles: 40 points
- 6+ cycles: 20 points

### Large Files

Detect files exceeding size thresholds:

| Threshold | Score |
|-----------|-------|
| < 200 lines | 100 points |
| 200-500 lines | 80 points |
| 500-1000 lines | 60 points |
| 1000-2000 lines | 40 points |
| > 2000 lines | 20 points |

### Feature Leakage

Detect features leaking across boundaries:

| Detection Method | Description |
|-----------------|-------------|
| Import analysis | Imports from wrong layers |
| Responsibility analysis | Mixed responsibilities |
| Boundary analysis | Cross-boundary access |

### Shared Logic

Detect logic duplicated across modules:

| Detection Method | Description |
|-----------------|-------------|
| Code similarity | Similar code patterns |
| Function similarity | Similar function signatures |
| Logic similarity | Similar business logic |

### Duplicate Responsibilities

Detect multiple components doing the same thing:

| Detection Method | Description |
|-----------------|-------------|
| API similarity | Similar API surfaces |
| Responsibility overlap | Overlapping responsibilities |
| Implementation similarity | Similar implementations |

### Weak Boundaries

Detect missing or weak module boundaries:

| Detection Method | Description |
|-----------------|-------------|
| Layer analysis | Missing layer separation |
| Module analysis | Missing module boundaries |
| Boundary analysis | Weak boundaries |

### Missing Abstractions

Detect missing required abstractions:

| Detection Method | Description |
|-----------------|-------------|
| Pattern analysis | Missing design patterns |
| Abstraction analysis | Missing abstractions |
| Interface analysis | Missing interfaces |

## Output Format

```
ARCHITECTURE REVIEW
==================================================
Architecture Score: 92/100
Grade: A

God Components: 0 detected
  - No god components found

God Services: 0 detected
  - No god services found

Circular Dependencies: 0 detected
  - No circular dependencies found

Large Files: 2 detected
  - src/components/DataGrid.tsx: 650 lines (threshold: 500)
  - src/services/api.ts: 580 lines (threshold: 500)

Feature Leakage: 0 detected
  - No feature leakage found

Shared Logic: 3 duplications detected
  - src/utils/format.ts: formatCurrency() duplicated in src/utils/helpers.ts
  - src/utils/validate.ts: validateEmail() duplicated in src/utils/validators.ts
  - src/utils/date.ts: formatDate() duplicated in src/utils/dateUtils.ts

Duplicate Responsibilities: 0 detected
  - No duplicate responsibilities found

Weak Boundaries: 0 detected
  - No weak boundaries found

Missing Abstractions: 0 detected
  - No missing abstractions found

Recommendations:
  1. Extract DataGrid into smaller components
  2. Extract api.ts into smaller services
  3. Consolidate shared utilities

Expected Improvement:
  Current Score: 92
  After Recommendations: 96
==================================================
```

## Improvement Suggestions

When architectural issues are detected, suggest improvements:

### Refactoring Suggestions

| Issue | Suggestion | Priority |
|-------|-----------|----------|
| God Component | Extract responsibilities into smaller components | High |
| God Service | Split service into smaller services | High |
| Circular Dependency | Break cycle with dependency inversion | High |
| Large File | Extract functionality into separate files | Medium |
| Feature Leakage | Enforce boundary rules | Medium |
| Shared Logic | Extract shared logic into utilities | Low |
| Duplicate Responsibilities | Consolidate into single responsibility | Low |
| Weak Boundaries | Add boundary enforcement | Medium |
| Missing Abstractions | Add interfaces, abstract classes | Low |

### Refactoring Plan

```
REFACTORING PLAN
==================================================
Phase 1: Critical (Must Fix)
  - Break circular dependency between module-a and module-b
  - Extract god component into 3 smaller components
  - Estimated effort: 4 hours
  - Expected improvement: +10 architecture score

Phase 2: Important (Should Fix)
  - Consolidate shared utilities
  - Add boundary enforcement
  - Estimated effort: 2 hours
  - Expected improvement: +5 architecture score

Phase 3: Nice to Have
  - Add missing interfaces
  - Improve documentation
  - Estimated effort: 1 hour
  - Expected improvement: +2 architecture score

Total Estimated Effort: 7 hours
Total Expected Improvement: +17 architecture score
==================================================
```

## Architecture Explainability

### Responsibilities

- Detect architectural issues
- Suggest improvements
- Generate refactoring plan
- Estimate effort and improvement

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Issue detection
- Improvement suggestion
- Refactoring plan generation
- Effort estimation

### Consumed Decisions

- Repository Profile (from Repository Intelligence Engine)
- Correlated findings (from Correlation Engine)

### Produced Decisions

- Architecture findings
- Improvement suggestions
- Refactoring plan
