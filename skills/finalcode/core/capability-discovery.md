# FinalCode Capability Discovery Engine

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Automatically discovers available, compatible, required, optional, deprecated, and unavailable capabilities before every mission |
| Execution Stage | PLANNING |
| Loaded By | Goal-Oriented Planning, Planning Engine |
| Dependencies | Capability Registry, Capability Categories |
| Outputs | Discovery report with capability availability |
| Consumers | Capability Selection Engine, User |
| Applies To | All engineering operations |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| goal | object | Yes | Goal-Oriented Planning |
| repositoryProfile | object | Yes | Repository Intelligence Engine |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| discoveryReport | object | Complete discovery report |
| availableCapabilities | array | Available capabilities |
| compatibleCapabilities | array | Compatible capabilities |
| requiredCapabilities | array | Required capabilities |
| optionalCapabilities | array | Optional capabilities |
| deprecatedCapabilities | array | Deprecated capabilities |
| unavailableCapabilities | array | Unavailable capabilities |

### Preconditions

- Goal must be defined
- Repository Profile must be generated
- Capability Registry must be populated

### Postconditions

- Capabilities are discovered
- Availability is determined
- Discovery report is generated

## Purpose

Before every mission, automatically discover available capabilities, compatible capabilities, required capabilities, optional capabilities, deprecated capabilities, and unavailable capabilities. Generate a discovery report.

**Why this matters:** Manual capability discovery is error-prone and incomplete. Automatic discovery ensures all relevant capabilities are considered.

## Discovery Methods

| Method | Description |
|--------|-------------|
| Goal analysis | Analyze goal to determine required capabilities |
| Repository analysis | Analyze repository to determine compatible capabilities |
| Dependency analysis | Analyze dependencies to determine required capabilities |
| Policy analysis | Analyze policies to determine allowed capabilities |
| History analysis | Analyze history to determine useful capabilities |

## Discovery Output

```
CAPABILITY DISCOVERY ENGINE
==================================================
Goal: Make repository production ready

Discovery Report:
  Available Capabilities: 42
  Compatible Capabilities: 38
  Required Capabilities: 6
  Optional Capabilities: 12
  Deprecated Capabilities: 1
  Unavailable Capabilities: 4

Required Capabilities:
  1. engineering-review (Analysis)
  2. security-audit (Security)
  3. performance-audit (Performance)
  4. testing-workflow (Testing)
  5. documentation-workflow (Documentation)
  6. certification (Certification)

Optional Capabilities:
  1. dependency-impact (Analysis)
  2. architecture-review (Architecture)
  3. technical-debt-analyzer (Analysis)
  4. roadmap-planner (Planning)
  5. production-audit (Certification)
  6. pr-review (Review)
  7. engineering-memory (Memory)
  8. continuous-roadmap (Continuous)
  9. engineering-timeline (Continuous)
  10. trend-analysis (Continuous)
  11. release-evolution (Deployment)
  12. improvement-forecast (Continuous)

Deprecated Capabilities:
  1. old-analysis-engine (Analysis) - Deprecated in v4.0.0

Unavailable Capabilities:
  1. database-migration (Database) - No database detected
  2. mobile-testing (Testing) - No mobile framework
  3. cloud-deploy (Deployment) - No cloud config
  4. container-security (Security) - No containers

Discovery Status: ✅ Complete
==================================================
```

## Architecture Explainability

### Responsibilities

- Discover available capabilities
- Determine compatibility
- Identify required capabilities
- Identify optional capabilities
- Detect deprecated capabilities
- Detect unavailable capabilities

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Capability discovery
- Compatibility determination
- Requirement identification

### Consumed Decisions

- Goal (from Goal-Oriented Planning)
- Repository Profile (from Repository Intelligence Engine)

### Produced Decisions

- Discovery report
- Available capabilities
- Required capabilities
