# FinalCode Dependency Impact Analysis

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Analyzes dependency impact before every repair or refactor |
| Execution Stage | PRE-CHANGE (before any modification) |
| Loaded By | All operating modes |
| Dependencies | Engineering Graph, Repository Intelligence Engine |
| Outputs | Impact report with affected files, regression risk, confidence |
| Consumers | Decision Engine, All operating modes |
| Applies To | All repairs and refactors |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| targetFile | string | Yes | User request |
| targetSymbol | string | No | User request |
| changeType | string | Yes | Change classification |
| engineeringGraph | object | Yes | Engineering Graph |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| impactReport | object | Complete impact analysis |
| affectedFiles | array | Files that may be affected |
| affectedTests | array | Tests that may need updating |
| affectedRoutes | array | Routes that may be affected |
| affectedAPIs | array | APIs that may be affected |
| regressionRisk | string | Risk level (Very Low to Critical) |
| confidence | number | Confidence in analysis (0-100%) |

### Preconditions

- Engineering Graph must be built
- Target file must be identified
- Change type must be classified

### Postconditions

- Impact report is generated
- Affected files are identified
- Regression risk is estimated
- Confidence is calculated

## Purpose

Dependency Impact Analysis builds a project dependency graph before every repair or refactor. It determines direct dependencies, indirect dependencies, imported modules, exported symbols, affected files, affected tests, affected routes, and affected APIs. This enables impact-aware changes.

**Why this matters:** Without understanding dependencies, changes can cause unexpected regressions. By analyzing impact before modification, FinalCode ensures every change is aware of its consequences.

## Analysis Methods

### Direct Dependencies

Identify files that directly import the target:

| Detection Method | Description |
|-----------------|-------------|
| Import analysis | Files that import from target |
| Re-export analysis | Files that re-export from target |
| Type imports | Files that import types from target |

### Indirect Dependencies

Identify files that transitively depend on the target:

| Detection Method | Description |
|-----------------|-------------|
| Transitive analysis | Files that import from direct dependencies |
| Deep dependency analysis | Files that depend on indirect dependencies |
| Dependency depth | Maximum dependency depth |

### Imported Modules

Identify what the target imports:

| Detection Method | Description |
|-----------------|-------------|
| Import statement analysis | Parse import statements |
| Dynamic import analysis | Parse dynamic imports |
| Require analysis | Parse require statements |

### Exported Symbols

Identify what the target exports:

| Detection Method | Description |
|-----------------|-------------|
| Export statement analysis | Parse export statements |
| Default export analysis | Parse default exports |
| Named export analysis | Parse named exports |
| Type exports | Parse type exports |

### Affected Files

Identify all files that may be affected:

| Detection Method | Description |
|-----------------|-------------|
| Import chain analysis | Follow import chains |
| Type dependency analysis | Follow type dependencies |
| Runtime dependency analysis | Follow runtime dependencies |

### Affected Tests

Identify tests that may need updating:

| Detection Method | Description |
|-----------------|-------------|
| Test import analysis | Tests that import the target |
| Test coverage analysis | Tests that cover the target |
| Test dependency analysis | Tests that depend on affected files |

### Affected Routes

Identify routes that may be affected:

| Detection Method | Description |
|-----------------|-------------|
| Route import analysis | Routes that import the target |
| Route handler analysis | Routes that use affected handlers |
| Route middleware analysis | Routes that use affected middleware |

### Affected APIs

Identify APIs that may be affected:

| Detection Method | Description |
|-----------------|-------------|
| API handler analysis | APIs that use affected handlers |
| API type analysis | APIs that use affected types |
| API schema analysis | APIs that use affected schemas |

## Impact Report Format

```
DEPENDENCY IMPACT ANALYSIS
==================================================
Target: src/services/userService.ts
Change Type: Modify function signature

Impact Summary:
  Files affected: 12
    Direct: 4
    Indirect: 8
  Tests affected: 3
  Routes affected: 2
  APIs affected: 5

Direct Dependencies (4 files):
  1. src/routes/users.ts (imports UserService)
  2. src/routes/auth.ts (imports UserService)
  3. src/services/authService.ts (imports UserService)
  4. src/middleware/auth.ts (imports UserService)

Indirect Dependencies (8 files):
  1. src/app.ts (imports users.ts)
  2. src/server.ts (imports app.ts)
  3. src/routes/index.ts (imports users.ts, auth.ts)
  4. src/services/userService.test.ts (imports UserService)
  5. src/services/authService.test.ts (imports AuthService)
  6. src/middleware/auth.test.ts (imports auth middleware)
  7. src/types/user.ts (imports UserService types)
  8. src/types/auth.ts (imports AuthService types)

Imported Modules (6 modules):
  1. src/types/user.ts (User type)
  2. src/types/auth.ts (Auth type)
  3. src/config/database.ts (database connection)
  4. src/utils/errors.ts (error utilities)
  5. src/utils/validation.ts (validation utilities)
  6. src/utils/logger.ts (logging utilities)

Exported Symbols (3 symbols):
  1. UserService (class)
  2. UserServiceType (type)
  3. createUser, updateUser, deleteUser (functions)

Affected Tests (3 tests):
  1. src/services/userService.test.ts
  2. src/routes/users.test.ts
  3. src/routes/auth.test.ts

Affected Routes (2 routes):
  1. /api/users (GET, POST, PUT, DELETE)
  2. /api/auth/login (POST)

Affected APIs (5 APIs):
  1. GET /api/users
  2. POST /api/users
  3. PUT /api/users/:id
  4. DELETE /api/users/:id
  5. POST /api/auth/login

Regression Risk: Low
Confidence: 96%
==================================================
```

## Risk Assessment

### Risk Levels

| Risk Level | Description | Criteria |
|------------|-------------|----------|
| Very Low | No risk of regression | < 3 files affected, no tests, no APIs |
| Low | Minimal risk | 3-10 files affected, tests exist, no breaking changes |
| Medium | Some risk | 10-20 files affected, tests missing, minor breaking changes |
| High | Significant risk | 20-50 files affected, tests failing, breaking changes |
| Very High | Major risk | > 50 files affected, critical tests failing, major breaking changes |

### Confidence Calculation

```
Confidence = Base Confidence
  + File Coverage Bonus (+5% if all affected files identified)
  + Test Coverage Bonus (+5% if all affected tests identified)
  + Import Analysis Bonus (+5% if all imports analyzed)
  - Uncertainty Penalty (-10% if dynamic imports detected)
  - Missing Information Penalty (-5% if file contents unknown)
```

## Architecture Explainability

### Responsibilities

- Build dependency graph
- Identify direct and indirect dependencies
- Identify affected files, tests, routes, APIs
- Estimate regression risk
- Calculate confidence

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Dependency analysis
- Impact identification
- Risk estimation
- Confidence calculation

### Consumed Decisions

- Engineering Graph (from Engineering Graph Engine)
- Repository Profile (from Repository Intelligence Engine)

### Produced Decisions

- Impact report
- Affected files list
- Regression risk level
- Confidence score
