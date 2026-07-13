# FinalCode Workflow Verification

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Defines mandatory verification for every workflow |
| Execution Stage | VERIFICATION |
| Loaded By | Workflow Engine |
| Dependencies | Workflow Engine, Repository Intelligence Engine |
| Outputs | Verification results with pass/fail status |
| Consumers | Workflow Engine, User |
| Applies To | All engineering operations |

## Reference Contract

| Input | Type | Required | Source |
|-------|------|----------|--------|
| workflowType | string | Yes | Workflow Engine |
| targetFiles | array | Yes | User request |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| verificationResults | object | Complete verification results |
| typescriptResult | object | TypeScript verification |
| lintResult | object | Lint verification |
| testsResult | object | Tests verification |
| buildResult | object | Build verification |
| securityResult | object | Security verification |
| performanceResult | object | Performance verification |
| architectureResult | object | Architecture verification |
| overallResult | string | Overall verification result |

### Preconditions

- Workflow must be executed
- Files must be modified

### Postconditions

- Verification is complete
- Results are recorded
- Workflow cannot complete until verification passes

## Purpose

Workflow Verification defines mandatory verification for every workflow. No workflow completes before verification passes. This ensures quality and prevents regressions.

**Why this matters:** Verification is the safety net that catches issues before they reach production. Mandatory verification ensures every change is validated.

## Verification Types

### TypeScript Verification

| Check | Description |
|-------|-------------|
| Compilation | TypeScript compiles successfully |
| Type errors | No type errors |
| Strict mode | Strict mode compliance |

### Lint Verification

| Check | Description |
|-------|-------------|
| ESLint | No ESLint errors |
| Prettier | Code formatting correct |
| Style guide | Style guide compliance |

### Unit Tests Verification

| Check | Description |
|-------|-------------|
| Test execution | All tests execute |
| Test pass rate | All tests pass |
| Test coverage | Coverage maintained |

### Integration Tests Verification

| Check | Description |
|-------|-------------|
| Test execution | All tests execute |
| Test pass rate | All tests pass |
| API compatibility | API compatibility maintained |

### Build Verification

| Check | Description |
|-------|-------------|
| Build success | Build completes successfully |
| Build warnings | No build warnings |
| Output size | Output size acceptable |

### Security Verification

| Check | Description |
|-------|-------------|
| Vulnerability scan | No vulnerabilities |
| Secret scan | No secrets exposed |
| Permission check | Permissions correct |

### Performance Verification

| Check | Description |
|-------|-------------|
| Bundle size | Bundle size acceptable |
| Load time | Load time acceptable |
| Memory usage | Memory usage acceptable |

### Architecture Verification

| Check | Description |
|-------|-------------|
| Dependency analysis | No circular dependencies |
| Module coupling | Coupling within limits |
| Pattern compliance | Pattern compliance |

## Verification Output

```
WORKFLOW VERIFICATION
==================================================
Workflow: Refactor
Status: Passed

TypeScript: ✅ Passed
  Compilation: Success
  Type errors: 0
  Strict mode: Compliant

Lint: ✅ Passed
  ESLint: 0 errors
  Prettier: Formatted
  Style guide: Compliant

Unit Tests: ✅ Passed
  Executed: 47 tests
  Passed: 47 tests
  Failed: 0 tests
  Coverage: 87%

Integration Tests: ✅ Passed
  Executed: 12 tests
  Passed: 12 tests
  Failed: 0 tests

Build: ✅ Passed
  Build success: Yes
  Build warnings: 0
  Output size: 1.2MB

Security: ✅ Passed
  Vulnerability scan: Clean
  Secret scan: Clean
  Permission check: Correct

Performance: ✅ Passed
  Bundle size: 1.2MB (acceptable)
  Load time: 1.2s (acceptable)
  Memory usage: 45MB (acceptable)

Architecture: ✅ Passed
  Circular dependencies: 0
  Module coupling: Within limits
  Pattern compliance: Compliant

Overall Result: ✅ All verifications passed

Workflow can proceed to completion
==================================================
```

## Architecture Explainability

### Responsibilities

- Run TypeScript verification
- Run Lint verification
- Run Tests verification
- Run Build verification
- Run Security verification
- Run Performance verification
- Run Architecture verification

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Verification execution
- Result recording
- Pass/fail determination

### Consumed Decisions

- Workflow type (from Workflow Engine)
- Target files (from User request)

### Produced Decisions

- Verification results
- Overall verification status
