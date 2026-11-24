# FinalCode Workflow Templates

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Reusable workflow templates for common engineering operations |
| Execution Stage | PLANNING |
| Loaded By | Workflow Engine |
| Dependencies | Workflow Engine, Repository Intelligence Engine |
| Outputs | Workflow template with required inputs, stages, verification, rollback, approval, and completion criteria |
| Consumers | Workflow Engine, User |
| Applies To | All engineering operations |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| templateType | string | Yes | User request or auto-detected |
| repositoryProfile | object | Yes | Repository Intelligence Engine |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| workflowTemplate | object | Complete workflow template |
| requiredInputs | array | Required inputs |
| executionStages | array | Execution stages |
| verificationRules | array | Verification rules |
| rollbackPolicy | object | Rollback policy |
| approvalRequirements | array | Approval requirements |
| completionCriteria | array | Completion criteria |

### Preconditions

- Repository Profile must be generated
- Template type must be determined

### Postconditions

- Workflow template is loaded
- All requirements are defined
- Execution plan is ready

## Purpose

Workflow Templates provide reusable templates for common engineering operations. Each template defines required inputs, execution stages, verification rules, rollback policy, approval requirements, and completion criteria.

**Why this matters:** Common operations repeat frequently. Templates ensure consistent execution, reduce planning time, and improve quality by standardizing best practices.

## Available Templates

### Repair Workflow

| Field | Description |
|-------|-------------|
| Required Inputs | Target files, issue description |
| Execution Stages | Discovery, Analysis, Impact Prediction, Execution Planning, Approval Check, Execution, Verification, Regression Validation, Certification, Memory Update, Roadmap Update |
| Verification Rules | TypeScript, Lint, Tests, Build |
| Rollback Policy | Restore original files, re-run verification |
| Approval Requirements | Minor Approval for critical files |
| Completion Criteria | All verifications pass, no regressions |

### Refactor Workflow

| Field | Description |
|-------|-------------|
| Required Inputs | Target files, refactoring goal |
| Execution Stages | Discovery, Analysis, Impact Prediction, Execution Planning, Approval Check, Execution, Verification, Regression Validation, Certification, Memory Update, Roadmap Update |
| Verification Rules | TypeScript, Lint, Tests, Build, Architecture Validation |
| Rollback Policy | Restore original files, re-run verification |
| Approval Requirements | Architecture Approval |
| Completion Criteria | All verifications pass, no behavior changes |

### Certification Workflow

| Field | Description |
|-------|-------------|
| Required Inputs | Repository path |
| Execution Stages | Discovery, Analysis, Certification, Memory Update |
| Verification Rules | None (read-only) |
| Rollback Policy | None (no modifications) |
| Approval Requirements | None |
| Completion Criteria | Certification report generated |

### Production Release Workflow

| Field | Description |
|-------|-------------|
| Required Inputs | Release version, release notes |
| Execution Stages | Discovery, Analysis, Impact Prediction, Execution Planning, Approval Check, Execution, Verification, Regression Validation, Certification, Memory Update, Roadmap Update |
| Verification Rules | TypeScript, Lint, Tests, Build, Security Validation, Performance Validation |
| Rollback Policy | Restore previous version, re-deploy |
| Approval Requirements | Architecture Approval, Security Approval, Business Logic Approval |
| Completion Criteria | All verifications pass, no regressions, security clean |

### Security Hardening Workflow

| Field | Description |
|-------|-------------|
| Required Inputs | Security issue description |
| Execution Stages | Discovery, Analysis, Impact Prediction, Execution Planning, Approval Check, Execution, Verification, Regression Validation, Certification, Memory Update, Roadmap Update |
| Verification Rules | TypeScript, Lint, Tests, Build, Security Validation |
| Rollback Policy | Restore original files, re-run verification |
| Approval Requirements | Security Approval |
| Completion Criteria | Security issue resolved, no new vulnerabilities |

### Performance Optimization Workflow

| Field | Description |
|-------|-------------|
| Required Inputs | Performance issue description |
| Execution Stages | Discovery, Analysis, Impact Prediction, Execution Planning, Approval Check, Execution, Verification, Regression Validation, Certification, Memory Update, Roadmap Update |
| Verification Rules | TypeScript, Lint, Tests, Build, Performance Validation |
| Rollback Policy | Restore original files, re-run verification |
| Approval Requirements | Minor Approval |
| Completion Criteria | Performance improved, no regressions |

### Architecture Refactoring Workflow

| Field | Description |
|-------|-------------|
| Required Inputs | Architecture issue description |
| Execution Stages | Discovery, Analysis, Impact Prediction, Execution Planning, Approval Check, Execution, Verification, Regression Validation, Certification, Memory Update, Roadmap Update |
| Verification Rules | TypeScript, Lint, Tests, Build, Architecture Validation |
| Rollback Policy | Restore original files, re-run verification |
| Approval Requirements | Architecture Approval |
| Completion Criteria | Architecture improved, no behavior changes |

### Documentation Workflow

| Field | Description |
|-------|-------------|
| Required Inputs | Documentation target |
| Execution Stages | Discovery, Analysis, Execution Planning, Execution, Verification, Memory Update |
| Verification Rules | Documentation completeness, Accuracy |
| Rollback Policy | Restore original documentation |
| Approval Requirements | None |
| Completion Criteria | Documentation complete and accurate |

### Dependency Upgrade Workflow

| Field | Description |
|-------|-------------|
| Required Inputs | Dependency list |
| Execution Stages | Discovery, Analysis, Impact Prediction, Execution Planning, Approval Check, Execution, Verification, Regression Validation, Certification, Memory Update, Roadmap Update |
| Verification Rules | TypeScript, Lint, Tests, Build, Security Validation |
| Rollback Policy | Restore previous dependency versions |
| Approval Requirements | Security Approval |
| Completion Criteria | Dependencies upgraded, no breaking changes |

### Testing Workflow

| Field | Description |
|-------|-------------|
| Required Inputs | Testing target |
| Execution Stages | Discovery, Analysis, Execution Planning, Execution, Verification, Memory Update |
| Verification Rules | Test coverage, Test pass rate |
| Rollback Policy | Remove added tests |
| Approval Requirements | None |
| Completion Criteria | Tests added and passing |

## Template Output

```
WORKFLOW TEMPLATES
==================================================
Available Templates: 10

1. Repair Workflow
   Required Inputs: Target files, issue description
   Stages: 11
   Verification: TypeScript, Lint, Tests, Build
   Approval: Minor (critical files)
   Rollback: Yes

2. Refactor Workflow
   Required Inputs: Target files, refactoring goal
   Stages: 11
   Verification: TypeScript, Lint, Tests, Build, Architecture
   Approval: Architecture
   Rollback: Yes

3. Certification Workflow
   Required Inputs: Repository path
   Stages: 4
   Verification: None (read-only)
   Approval: None
   Rollback: None

4. Production Release Workflow
   Required Inputs: Release version, release notes
   Stages: 11
   Verification: TypeScript, Lint, Tests, Build, Security, Performance
   Approval: Architecture, Security, Business Logic
   Rollback: Yes

5. Security Hardening Workflow
   Required Inputs: Security issue description
   Stages: 11
   Verification: TypeScript, Lint, Tests, Build, Security
   Approval: Security
   Rollback: Yes

6. Performance Optimization Workflow
   Required Inputs: Performance issue description
   Stages: 11
   Verification: TypeScript, Lint, Tests, Build, Performance
   Approval: Minor
   Rollback: Yes

7. Architecture Refactoring Workflow
   Required Inputs: Architecture issue description
   Stages: 11
   Verification: TypeScript, Lint, Tests, Build, Architecture
   Approval: Architecture
   Rollback: Yes

8. Documentation Workflow
   Required Inputs: Documentation target
   Stages: 6
   Verification: Documentation completeness, Accuracy
   Approval: None
   Rollback: Yes

9. Dependency Upgrade Workflow
   Required Inputs: Dependency list
   Stages: 11
   Verification: TypeScript, Lint, Tests, Build, Security
   Approval: Security
   Rollback: Yes

10. Testing Workflow
    Required Inputs: Testing target
    Stages: 6
    Verification: Test coverage, Test pass rate
    Approval: None
    Rollback: Yes

Template Status: ✅ All templates available
==================================================
```

## Architecture Explainability

### Responsibilities

- Define workflow templates
- Load templates on demand
- Validate template requirements
- Execute template stages

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Template definition
- Template loading
- Template validation

### Consumed Decisions

- Workflow Engine (from Workflow Engine)
- Repository Profile (from Repository Intelligence Engine)

### Produced Decisions

- Workflow template
- Required inputs
- Execution stages
