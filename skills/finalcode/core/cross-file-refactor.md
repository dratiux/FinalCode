# FinalCode Cross-file Refactoring Engine

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Supports safe multi-file refactors with automatic updates |
| Execution Stage | EXECUTION (during repair/refactor) |
| Loaded By | Repair Mode, Refactor Mode |
| Dependencies | Dependency Impact Analysis, Change Impact Prediction, Engineering Graph |
| Outputs | Refactored files with updated imports, validated dependencies |
| Consumers | User, Certification Engine |
| Applies To | All multi-file refactors |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| refactorType | string | Yes | User request |
| sourceFiles | array | Yes | User request |
| targetLocation | string | No | User request |
| impactReport | object | Yes | Dependency Impact Analysis |
| changeRisk | object | Yes | Change Impact Prediction |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| refactoredFiles | array | Files that were refactored |
| updatedImports | array | Imports that were updated |
| validationResults | object | Dependency validation results |
| success | boolean | Whether refactor succeeded |
| confidence | number | Confidence in refactor (0-100%) |

### Preconditions

- Impact report must be generated
- Change risk must be predicted
- Source files must be identified
- Confidence must be above threshold (70%)

### Postconditions

- Files are refactored
- Imports are updated
- Dependencies are validated
- Confidence is recalculated

## Purpose

Cross-file Refactoring Engine supports safe multi-file refactors by automatically renaming symbols, extracting shared logic, moving modules, splitting large files, merging duplicated utilities, updating imports automatically, and validating every dependency afterwards.

**Why this matters:** Multi-file refactors are risky because they can break dependencies across the codebase. By automating the refactoring process and validating dependencies, FinalCode ensures refactors are safe and complete.

## Refactor Types

### Rename Symbol

Rename a symbol across all files:

| Step | Description |
|------|-------------|
| 1. Identify all usages | Find all files that use the symbol |
| 2. Create rename plan | Plan all renames |
| 3. Execute renames | Rename symbol in all files |
| 4. Update imports | Update all import statements |
| 5. Validate | Verify no broken references |

### Extract Shared Logic

Extract duplicated logic into a shared module:

| Step | Description |
|------|-------------|
| 1. Identify duplication | Find duplicated code patterns |
| 2. Create extraction plan | Plan extraction into shared module |
| 3. Create shared module | Create new module with extracted logic |
| 4. Update consumers | Update all files to use shared module |
| 5. Validate | Verify no broken references |

### Move Module

Move a module to a new location:

| Step | Description |
|------|-------------|
| 1. Identify all imports | Find all files that import the module |
| 2. Create move plan | Plan all moves |
| 3. Move module | Move module to new location |
| 4. Update imports | Update all import paths |
| 5. Validate | Verify no broken references |

### Split Large File

Split a large file into smaller files:

| Step | Description |
|------|-------------|
| 1. Analyze file structure | Identify logical sections |
| 2. Create split plan | Plan file splits |
| 3. Create new files | Create new files with sections |
| 4. Update imports | Update all import statements |
| 5. Validate | Verify no broken references |

### Merge Duplicated Utilities

Merge duplicated utility functions:

| Step | Description |
|------|-------------|
| 1. Identify duplication | Find duplicated utility functions |
| 2. Create merge plan | Plan merging into single utility |
| 3. Create merged utility | Create single utility function |
| 4. Update consumers | Update all files to use merged utility |
| 5. Validate | Verify no broken references |

## Confidence Management

### Confidence Thresholds

| Threshold | Action |
|-----------|--------|
| > 90% | Proceed with refactor |
| 70-90% | Proceed with caution |
| 50-70% | Request user approval |
| < 50% | Stop and report |

### Confidence Calculation

```
Confidence = Base Confidence
  + Impact Analysis Bonus (+10% if impact analysis complete)
  + Risk Assessment Bonus (+10% if risk assessed)
  + Import Analysis Bonus (+5% if all imports identified)
  + Test Coverage Bonus (+5% if tests exist)
  - Dynamic Import Penalty (-10% if dynamic imports detected)
  - Missing Information Penalty (-10% if file contents unknown)
  - Complexity Penalty (-5% if refactor is complex)
```

### Confidence Monitoring

Monitor confidence throughout refactor:

| Stage | Confidence Check |
|-------|-----------------|
| Before refactor | Check initial confidence |
| During refactor | Monitor confidence changes |
| After refactor | Verify final confidence |
| If confidence drops | Stop immediately |

## Validation Pipeline

After refactoring, validate:

### Import Validation

| Check | Description |
|-------|-------------|
| All imports resolve | Every import statement resolves to a valid file |
| No circular imports | No circular import dependencies |
| Import paths correct | All import paths are correct |

### Type Validation

| Check | Description |
|-------|-------------|
| TypeScript compiles | TypeScript compilation succeeds |
| No type errors | No type errors introduced |
| Types consistent | Types remain consistent |

### Test Validation

| Check | Description |
|-------|-------------|
| Tests pass | All existing tests pass |
| No test breaks | No tests broken by refactor |
| Coverage maintained | Test coverage maintained |

### Build Validation

| Check | Description |
|-------|-------------|
| Build succeeds | Build completes successfully |
| No build errors | No build errors introduced |
| Bundle size acceptable | Bundle size within threshold |

## Output Format

```
CROSS-FILE REFACTOR
==================================================
Refactor Type: Rename Symbol
Target: UserService.getUser
New Name: UserService.findUser

Confidence: 95%
Risk: Low

Impact Summary:
  Files affected: 8
  Direct dependencies: 3
  Indirect dependencies: 5

Execution Plan:
  1. Rename in src/services/userService.ts
  2. Update import in src/routes/users.ts
  3. Update import in src/routes/auth.ts
  4. Update import in src/services/authService.ts
  5. Update import in src/middleware/auth.ts
  6. Update import in src/services/userService.test.ts
  7. Update import in src/routes/users.test.ts
  8. Update import in src/routes/auth.test.ts

Validation Results:
  ✓ All imports resolve
  ✓ No circular imports
  ✓ TypeScript compiles
  ✓ No type errors
  ✓ Tests pass
  ✓ Build succeeds

Refactor Complete:
  Files modified: 8
  Imports updated: 8
  Validation passed: ✓
  Confidence: 95%
==================================================
```

## Architecture Explainability

### Responsibilities

- Execute multi-file refactors
- Update imports automatically
- Validate dependencies
- Monitor confidence
- Stop if confidence drops

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Refactor execution
- Import updates
- Validation execution
- Confidence monitoring

### Consumed Decisions

- Impact report (from Dependency Impact Analysis)
- Change risk (from Change Impact Prediction)
- Engineering Graph (from Engineering Graph Engine)

### Produced Decisions

- Refactored files
- Updated imports
- Validation results
- Final confidence
