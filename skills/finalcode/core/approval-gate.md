# FinalCode Approval Gate

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Determines approval requirements before workflow execution |
| Execution Stage | PLANNING |
| Loaded By | Workflow Engine |
| Dependencies | Repository Intelligence Engine, Engineering Memory |
| Outputs | Approval requirement with type and level |
| Consumers | Workflow Engine, User |
| Applies To | All engineering operations |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| workflowType | string | Yes | Workflow Engine |
| targetFiles | array | Yes | User request |
| repositoryProfile | object | Yes | Repository Intelligence Engine |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| approvalRequired | boolean | Whether approval is required |
| approvalType | string | Type of approval required |
| approvalLevel | string | Level of approval |
| approvalReason | string | Reason for approval requirement |

### Preconditions

- Repository Profile must be generated
- Workflow type must be determined
- Target files must be identified

### Postconditions

- Approval requirement is determined
- Approval type is specified
- Workflow waits for approval if required

## Purpose

The Approval Gate determines whether developer approval is required before continuing. It checks the type of change, affected files, risk level, and other factors to determine the appropriate approval level.

**Why this matters:** Not all changes require approval. But some changes—especially security, architecture, and database changes—require careful review. The Approval Gate ensures appropriate oversight without blocking routine operations.

## Approval Types

### No Approval Needed

| Criteria | Description |
|----------|-------------|
| Documentation only | Documentation changes |
| Low risk | Low-risk changes |
| Automated tests | Adding automated tests |
| Minor fixes | Minor bug fixes |

### Minor Approval

| Criteria | Description |
|----------|-------------|
| Code quality | Code quality improvements |
| Performance | Performance optimizations |
| Refactoring | Non-breaking refactoring |
| Configuration | Configuration changes |

### Architecture Approval

| Criteria | Description |
|----------|-------------|
| Architecture changes | Major architecture changes |
| Pattern changes | Architectural pattern changes |
| Module restructuring | Module restructuring |
| API changes | API design changes |

### Security Approval

| Criteria | Description |
|----------|-------------|
| Security fixes | Security vulnerability fixes |
| Authentication | Authentication changes |
| Authorization | Authorization changes |
| Cryptography | Cryptographic changes |

### Business Logic Approval

| Criteria | Description |
|----------|-------------|
| Core business logic | Core business logic changes |
| Data models | Data model changes |
| Workflows | Business workflow changes |
| Rules | Business rule changes |

### Database Approval

| Criteria | Description |
|----------|-------------|
| Schema changes | Database schema changes |
| Migrations | Database migrations |
| Data transformations | Data transformations |
| Index changes | Index changes |

## Approval Decision

### Decision Matrix

| Change Type | Risk Level | Files Affected | Approval |
|-------------|------------|----------------|----------|
| Documentation | Any | Any | No Approval |
| Tests | Low | Any | No Approval |
| Configuration | Low | Few | No Approval |
| Code Quality | Low | Few | Minor Approval |
| Performance | Medium | Few | Minor Approval |
| Architecture | Any | Many | Architecture Approval |
| Security | Any | Any | Security Approval |
| Business Logic | Any | Any | Business Logic Approval |
| Database | Any | Any | Database Approval |

## Approval Output

```
APPROVAL GATE
==================================================
Workflow: Refactor
Target Files: 5 files

Approval Analysis:
  Change Type: Code Refactoring
  Risk Level: Medium
  Files Affected: 5 files
  Architecture Impact: Low
  Security Impact: None
  Database Impact: None

Decision: Minor Approval Required

Reason: Refactoring affects multiple files and may impact
        code organization. Requires developer review.

Approval Details:
  Type: Minor Approval
  Level: Developer Review
  Required By: Lead Developer
  Deadline: Before execution

Waiting for approval...
==================================================
```

## Architecture Explainability

### Responsibilities

- Determine approval requirements
- Check change type and risk
- Evaluate file impact
- Wait for approval if required

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Approval determination
- Approval type selection
- Approval waiting

### Consumed Decisions

- Workflow type (from Workflow Engine)
- Target files (from User request)
- Repository Profile (from Repository Intelligence Engine)

### Produced Decisions

- Approval requirement
- Approval type
- Approval level
