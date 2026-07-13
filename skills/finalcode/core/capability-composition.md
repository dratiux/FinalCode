# FinalCode Capability Composition

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Dynamically composes multiple capabilities into unified engineering operations |
| Execution Stage | EXECUTION |
| Loaded By | Workflow Orchestration, Planning Engine |
| Dependencies | Capability Selection Engine, Capability Dependency Graph |
| Outputs | Composed capability execution |
| Consumers | Workflow Orchestration, User |
| Applies To | All engineering operations |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| selectedCapabilities | array | Yes | Capability Selection Engine |
| dependencyGraph | object | Yes | Capability Dependency Graph |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| composedExecution | object | Composed capability execution |
| executionPlan | array | Execution plan |
| parallelGroups | array | Parallel execution groups |
| sequentialGroups | array | Sequential execution groups |

### Preconditions

- Capabilities must be selected
- Dependency graph must be built

### Postconditions

- Capabilities are composed
- Execution plan is created
- Groups are defined

## Purpose

Allow multiple capabilities to compose dynamically. Composition should be automatic whenever beneficial. This enables efficient execution of complex engineering operations.

**Why this matters:** Some operations require multiple capabilities working together. Automatic composition ensures optimal execution.

## Composition Patterns

| Pattern | Description |
|---------|-------------|
| Sequential | Capabilities execute in sequence |
| Parallel | Capabilities execute simultaneously |
| Mixed | Combination of sequential and parallel |
| Conditional | Execution depends on conditions |

## Composition Output

```
CAPABILITY COMPOSITION
==================================================
Mission: Make repository production ready

Composed Capabilities: 6

Execution Plan:
  Phase 1 (Parallel):
    - engineering-review (Analysis)
    - security-audit (Security)
  Phase 2 (Parallel):
    - performance-audit (Performance)
    - testing-workflow (Testing)
  Phase 3 (Sequential):
    - documentation-workflow (Documentation)
  Phase 4 (Sequential):
    - certification (Certification)

Parallel Groups: 2
Sequential Groups: 2

Estimated Duration: 5 hours
Expected Gain: +15%

Composition Status: ✅ Ready
==================================================
```

## Architecture Explainability

### Responsibilities

- Compose capabilities dynamically
- Create execution plan
- Define parallel groups
- Define sequential groups

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Capability composition
- Execution planning
- Group definition

### Consumed Decisions

- Selected Capabilities (from Capability Selection Engine)
- Dependency Graph (from Capability Dependency Graph)

### Produced Decisions

- Composed execution
- Execution plan
- Execution groups
