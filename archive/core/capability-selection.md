# FinalCode Capability Selection Engine

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Automatically selects the best capabilities based on goal, repository state, risk, policies, history, and requirements |
| Execution Stage | PLANNING |
| Loaded By | Planning Engine, Goal-Oriented Planning |
| Dependencies | Capability Discovery Engine, Policy Engine, Engineering Memory |
| Outputs | Selected capabilities with reasoning |
| Consumers | Workflow Orchestration, User |
| Applies To | All engineering operations |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| discoveryReport | object | Yes | Capability Discovery Engine |
| goal | object | Yes | Goal-Oriented Planning |
| activePolicies | array | Yes | Policy Engine |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| selectedCapabilities | array | Selected capabilities |
| selectionReasoning | object | Reasoning for each selection |
| executionGraph | object | Execution graph |
| alternatives | array | Alternative capabilities |

### Preconditions

- Discovery report must be generated
- Goal must be defined
- Active policies must be loaded

### Postconditions

- Capabilities are selected
- Reasoning is documented
- Execution graph is built

## Purpose

Instead of manually selecting workflows, evaluate goal, repository state, risk, policies, previous engineering history, approval requirements, and verification requirements. Automatically choose the best capabilities. Every selection must include reasoning.

**Why this matters:** Manual selection is subjective and inconsistent. Automatic selection ensures optimal capability choice based on evidence.

## Selection Criteria

| Criterion | Weight | Description |
|-----------|--------|-------------|
| Goal alignment | 30% | How well capability aligns with goal |
| Repository fit | 25% | How well capability fits repository |
| Risk level | 20% | Acceptable risk level |
| Policy compliance | 15% | Policy compliance |
| Historical success | 10% | Past success rate |

## Selection Output

```
CAPABILITY SELECTION ENGINE
==================================================
Goal: Make repository production ready

Selected Capabilities:
  1. engineering-review (Analysis)
     Reason: Primary capability for production readiness
     Confidence: 95%
     Risk: Low

  2. security-audit (Security)
     Reason: Required for production readiness
     Confidence: 98%
     Risk: Low

  3. performance-audit (Performance)
     Reason: Important for production quality
     Confidence: 90%
     Risk: Low

  4. testing-workflow (Testing)
     Reason: Critical for production confidence
     Confidence: 92%
     Risk: Low

  5. documentation-workflow (Documentation)
     Reason: Required for maintainability
     Confidence: 88%
     Risk: Low

  6. certification (Certification)
     Reason: Final production verification
     Confidence: 95%
     Risk: Low

Execution Graph:
  Phase 1: [engineering-review] → [security-audit]
  Phase 2: [performance-audit] → [testing-workflow]
  Phase 3: [documentation-workflow]
  Phase 4: [certification]

Alternatives Considered:
  1. architecture-review (Not selected: architecture already good)
  2. technical-debt-analyzer (Not selected: debt is low)
  3. roadmap-planner (Not selected: roadmap exists)

Selection Status: ✅ Complete
==================================================
```

## Architecture Explainability

### Responsibilities

- Evaluate capabilities
- Select best capabilities
- Document selection reasoning
- Build execution graph

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Capability evaluation
- Capability selection
- Reasoning documentation

### Consumed Decisions

- Discovery Report (from Capability Discovery Engine)
- Goal (from Goal-Oriented Planning)
- Active Policies (from Policy Engine)

### Produced Decisions

- Selected capabilities
- Selection reasoning
- Execution graph
