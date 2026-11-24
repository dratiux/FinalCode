# FinalCode Capability Dashboard

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Displays capabilities used, skipped, selection reasons, health, graph, coverage, engineering value, and unused opportunities |
| Execution Stage | REPORTING |
| Loaded By | All operating modes, Mission Dashboard |
| Dependencies | Capability Registry, Capability Health, Capability Recommendations |
| Outputs | Capability dashboard with complete capability status |
| Consumers | Mission Dashboard, User |
| Applies To | All engineering operations |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| mission | object | Yes | Engineering Mission |
| capabilityHealth | object | Yes | Capability Health |
| recommendations | object | Yes | Capability Recommendations |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| capabilityDashboard | object | Complete capability dashboard |
| capabilitiesUsed | array | Capabilities used |
| capabilitiesSkipped | array | Capabilities skipped |
| selectionReasons | object | Selection reasons |
| capabilityHealth | object | Capability health |
| capabilityGraph | object | Capability graph |
| capabilityCoverage | object | Capability coverage |
| engineeringValue | object | Engineering value |
| unusedOpportunities | array | Unused opportunities |

### Preconditions

- Mission must be completed
- Capability health must be measured
- Recommendations must be generated

### Postconditions

- Dashboard is displayed
- Status is visible
- Opportunities are identified

## Purpose

Every report includes capabilities used, capabilities skipped, selection reasons, capability health, capability graph, capability coverage, engineering value, and unused opportunities.

**Why this matters:** A capability dashboard provides visibility into how capabilities are being used and where improvements can be made.

## Dashboard Output

```
CAPABILITY DASHBOARD
==================================================
Mission: Make repository production ready

Capabilities Used: 6
  1. engineering-review (Analysis)
  2. security-audit (Security)
  3. performance-audit (Performance)
  4. testing-workflow (Testing)
  5. documentation-workflow (Documentation)
  6. certification (Certification)

Capabilities Skipped: 8
  1. architecture-review (Architecture already good)
  2. technical-debt-analyzer (Debt already low)
  3. roadmap-planner (Roadmap exists)
  4. production-audit (Covered by certification)
  5. pr-review (Not a PR)
  6. engineering-memory (Already populated)
  7. continuous-roadmap (Already active)
  8. improvement-forecast (Already generated)

Selection Reasons:
  engineering-review: Primary capability for goal
  security-audit: Required for production
  performance-audit: Important for quality
  testing-workflow: Critical for confidence
  documentation-workflow: Required for maintainability
  certification: Final verification

Capability Health:
  engineering-review: 91/100
  security-audit: 95/100
  performance-audit: 88/100
  testing-workflow: 90/100
  documentation-workflow: 85/100
  certification: 92/100

Capability Coverage: 85%
Engineering Value: +15%
Unused Opportunities: 2

Dashboard Status: ✅ Complete
==================================================
```

## Architecture Explainability

### Responsibilities

- Display capabilities used
- Display capabilities skipped
- Show selection reasons
- Show capability health
- Show capability graph
- Calculate capability coverage
- Calculate engineering value
- Identify unused opportunities

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Dashboard display
- Status reporting
- Opportunity identification

### Consumed Decisions

- Mission (from Engineering Mission)
- Capability Health (from Capability Health)
- Recommendations (from Capability Recommendations)

### Produced Decisions

- Capability dashboard
- Status display
- Opportunity report
