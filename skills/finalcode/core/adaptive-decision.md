# FinalCode Adaptive Decision Engine

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Continuously reevaluates strategy after every workflow and adapts to new information |
| Execution Stage | EXECUTION |
| Loaded By | Workflow Orchestration, Objective Tracking |
| Dependencies | Planning Engine, Workflow Engine, Approval Gate |
| Outputs | Adaptive decisions with re-planning and recovery |
| Consumers | Workflow Orchestration, User |
| Applies To | All engineering operations |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| executionStrategy | object | Yes | Planning Engine |
| workflowResult | object | Yes | Workflow Engine |
| verificationResult | object | Yes | Workflow Verification |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| adaptiveDecision | object | Complete adaptive decision |
| shouldReplan | boolean | Whether to re-plan |
| recoveryWorkflow | object | Recovery workflow if needed |
| newApprovalGates | array | New approval gates if needed |
| updatedStrategy | object | Updated execution strategy |

### Preconditions

- Execution strategy must exist
- Workflow must complete
- Verification must complete

### Postconditions

- Strategy is reevaluated
- Adaptations are made
- Recovery is planned if needed

## Purpose

The Adaptive Decision Engine continuously reevaluates after every workflow. If new blockers appear, it re-plans automatically. If verification fails, it generates a recovery workflow. If architecture changes, it inserts approval gates automatically.

**Why this matters:** Engineering is unpredictable. The Adaptive Decision Engine ensures FinalCode adapts to new information rather than blindly following an outdated plan.

## Adaptation Triggers

### Trigger 1: New Blockers

| Trigger | Response |
|---------|----------|
| Dependency issue | Re-plan to address dependency |
| File conflict | Re-plan to resolve conflict |
| Resource constraint | Re-plan with adjusted timeline |
| Approval delay | Re-plan with adjusted schedule |

### Trigger 2: Verification Failure

| Trigger | Response |
|---------|----------|
| TypeScript error | Generate repair workflow |
| Lint error | Generate repair workflow |
| Test failure | Generate repair workflow |
| Build failure | Generate repair workflow |

### Trigger 3: Architecture Change

| Trigger | Response |
|---------|----------|
| New dependency | Insert dependency approval gate |
| Module change | Insert architecture approval gate |
| API change | Insert API approval gate |
| Security change | Insert security approval gate |

### Trigger 4: Risk Change

| Trigger | Response |
|---------|----------|
| Increased risk | Add verification steps |
| Decreased risk | Optimize execution |
| New risk | Add risk mitigation |

## Adaptation Output

```
ADAPTIVE DECISION ENGINE
==================================================
Workflow Completed: Security Audit
Verification: Failed (1 vulnerability found)

Adaptation Analysis:
  Trigger: Verification Failure
  Failure Type: Security Vulnerability
  Severity: High
  Impact: Blocks production readiness

Adaptive Decision:
  Should Replan: Yes
  Recovery Required: Yes
  New Approval Gates: 1

Recovery Workflow:
  Type: Security Hardening
  Priority: Critical
  Estimated Effort: 1h
  Required Approvals: Security Approval

Updated Strategy:
  Phase 1: Engineering Review ✅
  Phase 1.5: Security Hardening (NEW)
  Phase 2: Performance Audit + Testing
  Phase 3: Documentation
  Phase 4: Certification

Timeline Impact:
  Original: 5h
  Updated: 6h
  Delay: +1h

Approval Gates:
  New: Security Approval (for Security Hardening)

Adaptation Status: ✅ Strategy updated
==================================================
```

## Architecture Explainability

### Responsibilities

- Monitor workflow results
- Detect adaptation triggers
- Generate recovery workflows
- Insert new approval gates
- Update execution strategy

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Adaptation detection
- Recovery planning
- Strategy updating

### Consumed Decisions

- Execution Strategy (from Planning Engine)
- Workflow Result (from Workflow Engine)
- Verification Result (from Workflow Verification)

### Produced Decisions

- Adaptive decision
- Recovery workflow
- Updated strategy
