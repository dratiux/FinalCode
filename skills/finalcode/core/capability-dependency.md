# FinalCode Capability Dependency Graph

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Builds and manages dependency graph between capabilities |
| Execution Stage | PLANNING |
| Loaded By | Capability Selection Engine, Capability Composition |
| Dependencies | Capability Registry |
| Outputs | Capability dependency graph with analysis |
| Consumers | Capability Selection Engine, User |
| Applies To | All engineering operations |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| capabilities | array | Yes | Capability Registry |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| dependencyGraph | object | Complete dependency graph |
| missingDependencies | array | Missing dependencies |
| circularDependencies | array | Circular dependencies |
| unusedCapabilities | array | Unused capabilities |
| duplicateCapabilities | array | Duplicate capabilities |
| brokenChains | array | Broken capability chains |

### Preconditions

- Capabilities must be registered
- Dependencies must be defined

### Postconditions

- Dependency graph is built
- Issues are detected
- Graph is validated

## Purpose

Build a graph between capabilities. Detect missing dependencies, circular dependencies, unused capabilities, duplicate capabilities, and broken capability chains.

**Why this matters:** Dependency issues cause runtime failures. Detecting them early prevents errors.

## Dependency Analysis

| Analysis | Description |
|----------|-------------|
| Missing dependencies | Required but not available |
| Circular dependencies | Dependencies that loop |
| Unused capabilities | Registered but never used |
| Duplicate capabilities | Multiple capabilities for same purpose |
| Broken chains | Interrupted dependency chains |

## Graph Output

```
CAPABILITY DEPENDENCY GRAPH
==================================================
Capabilities: 42
Dependencies: 87

Dependency Graph:
  engineering-review → [security-audit, performance-audit]
  security-audit → [vulnerability-scan]
  performance-audit → [performance-optimization]
  testing-workflow → [test-coverage]
  certification → [engineering-review, security-audit, performance-audit, testing-workflow]

Analysis:
  Missing Dependencies: 0
  Circular Dependencies: 0
  Unused Capabilities: 2
    1. old-analysis-engine (deprecated)
    2. legacy-security-check (deprecated)
  Duplicate Capabilities: 0
  Broken Chains: 0

Graph Status: ✅ Healthy
==================================================
```

## Architecture Explainability

### Responsibilities

- Build dependency graph
- Detect missing dependencies
- Detect circular dependencies
- Detect unused capabilities
- Detect duplicate capabilities
- Detect broken chains

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Graph construction
- Issue detection
- Graph validation

### Consumed Decisions

- Capabilities (from Capability Registry)

### Produced Decisions

- Dependency graph
- Detected issues
- Validation results
