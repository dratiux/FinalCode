# FinalCode Workflow Recovery

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Handles workflow failures with analysis and safe recovery |
| Execution Stage | RECOVERY |
| Loaded By | Workflow Engine |
| Dependencies | Workflow Engine, Rollback Planning |
| Outputs | Recovery plan with analysis, root cause, and next action |
| Consumers | Workflow Engine, User |
| Applies To | All engineering operations |

## Reference Contract

| Input | Type | Required | Source |
|-------|------|----------|--------|
| workflowType | string | Yes | Workflow Engine |
| failurePoint | string | Yes | Workflow Engine |
| errorDetails | object | Yes | Workflow Engine |
| rollbackPlan | object | Yes | Rollback Planning |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| recoveryPlan | object | Complete recovery plan |
| failureAnalysis | object | Failure analysis |
| rootCause | string | Root cause identification |
| safeRecovery | object | Safe recovery steps |
| remainingWork | array | Remaining work items |
| recommendedNextAction | string | Recommended next action |

### Preconditions

- Workflow must have failed
- Rollback plan must be available
- Error details must be captured

### Postconditions

- Failure is analyzed
- Root cause is identified
- Recovery plan is created
- Workflow stops immediately

## Purpose

Workflow Recovery handles workflow failures. If execution fails, it stops immediately and generates failure analysis, root cause, safe recovery, remaining work, and recommended next action. Never continue after a failed verification.

**Why this matters:** Failures happen. A structured recovery process ensures you can recover quickly and safely without introducing additional issues.

## Recovery Components

### Failure Analysis

| Component | Description |
|-----------|-------------|
| Failure point | Where the failure occurred |
| Error type | Type of error |
| Error message | Error message |
| Stack trace | Stack trace (if available) |
| Context | Context at failure point |

### Root Cause Identification

| Method | Description |
|--------|-------------|
| Error analysis | Analyze error details |
| Context analysis | Analyze context at failure |
| Dependency analysis | Analyze dependencies |
| History analysis | Analyze similar past failures |

### Safe Recovery

| Step | Description |
|------|-------------|
| Stop immediately | Halt all execution |
| Assess damage | Assess any damage caused |
| Rollback changes | Rollback if necessary |
| Verify state | Verify current state |
| Document failure | Document failure details |

### Remaining Work

| Component | Description |
|-----------|-------------|
| Completed work | What was completed |
| Partially completed | What was partially completed |
| Not started | What was not started |
| Dependencies | Dependencies affected |

### Recommended Next Action

| Component | Description |
|-----------|-------------|
| Immediate action | What to do now |
| Short-term action | What to do next |
| Long-term action | What to do in future |
| Prevention | How to prevent recurrence |

## Recovery Output

```
WORKFLOW RECOVERY
==================================================
Workflow: Refactor
Status: Failed

Failure Analysis:
  Failure Point: Verification (TypeScript)
  Error Type: TypeScript Compilation Error
  Error Message: Cannot find module './utils'
  Stack Trace: Available
  Context: During file modification

Root Cause:
  The refactoring removed a dependency without updating
  all imports. The module './utils' is still imported
  in 3 files but was deleted during refactoring.

Safe Recovery:
  1. Stop immediately ✅
  2. Assess damage: No permanent damage
  3. Rollback changes: Rolling back 3 files
  4. Verify state: Verifying file restoration
  5. Document failure: Documenting failure details

Remaining Work:
  Completed: 60% of refactoring
  Partially Completed: 20%
  Not Started: 20%

Recommended Next Action:
  Immediate: Complete rollback and verify restoration
  Short-term: Update imports before removing modules
  Long-term: Add import dependency checking to verification
  Prevention: Add pre-refactoring dependency analysis

Recovery Plan Status: ✅ Ready to execute
==================================================
```

## Architecture Explainability

### Responsibilities

- Stop execution immediately
- Analyze failure
- Identify root cause
- Create recovery plan
- Execute safe recovery

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Failure detection
- Root cause analysis
- Recovery plan creation

### Consumed Decisions

- Workflow type (from Workflow Engine)
- Failure point (from Workflow Engine)
- Rollback plan (from Rollback Planning)

### Produced Decisions

- Recovery plan
- Root cause
- Next action
