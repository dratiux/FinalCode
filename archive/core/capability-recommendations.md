# FinalCode Capability Recommendations

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Generates recommendations for unused capabilities, higher-value alternatives, missing capabilities, deprecated capabilities, and potential combinations |
| Execution Stage | ANALYSIS |
| Loaded By | Mission Dashboard, Continuous Roadmap |
| Dependencies | Capability Registry, Capability Health, Engineering Memory |
| Outputs | Capability recommendations with explanations |
| Consumers | Mission Dashboard, User |
| Applies To | All engineering operations |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| completedMission | object | Yes | Engineering Mission |
| capabilityHealth | object | Yes | Capability Health |
| engineeringMemory | object | Yes | Engineering Memory |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| recommendations | object | Complete recommendations |
| unusedCapabilities | array | Unused capabilities |
| higherValueAlternatives | array | Higher-value alternatives |
| missingCapabilities | array | Missing capabilities |
| deprecatedCapabilities | array | Deprecated capabilities |
| potentialCombinations | array | Potential combinations |

### Preconditions

- Mission must be completed
- Capability health must be measured
- Engineering memory must be populated

### Postconditions

- Recommendations are generated
- Explanations are provided
- Alternatives are suggested

## Purpose

After every mission, recommend unused capabilities, higher-value alternatives, missing capabilities, deprecated capabilities, and potential capability combinations. Always explain WHY.

**Why this matters:** Recommendations help improve future missions by suggesting better capability usage.

## Recommendation Types

| Type | Description |
|------|-------------|
| Unused capabilities | Capabilities that could have been used |
| Higher-value alternatives | Better capabilities for the task |
| Missing capabilities | Capabilities that don't exist but should |
| Deprecated capabilities | Capabilities that should be replaced |
| Potential combinations | Capabilities that work well together |

## Recommendation Output

```
CAPABILITY RECOMMENDATIONS
==================================================
Mission: Make repository production ready

Unused Capabilities:
  1. architecture-review
     Why: Architecture score is already high (94%)
     Value: Low (would not improve score)
     Recommendation: Skip unless architecture changes

  2. technical-debt-analyzer
     Why: Debt is already low (85%)
     Value: Low (would not improve score)
     Recommendation: Skip unless debt increases

Higher-Value Alternatives:
  1. production-audit (instead of certification)
     Why: More comprehensive for production readiness
     Value: +5% more thorough
     Recommendation: Consider for next release

Missing Capabilities:
  1. deployment-automation
     Why: No automated deployment capability
     Value: High (would improve deployment)
     Recommendation: Consider adding

Deprecated Capabilities:
  1. old-analysis-engine
     Why: Replaced by engineering-review
     Value: None (deprecated)
     Recommendation: Remove from registry

Potential Combinations:
  1. engineering-review + security-audit
     Why: Often used together
     Value: +10% efficiency
     Recommendation: Consider parallel execution

  2. testing-workflow + regression-prediction
     Why: Regression prediction improves test focus
     Value: +8% test effectiveness
     Recommendation: Consider combining

Recommendation Status: ✅ Generated
==================================================
```

## Architecture Explainability

### Responsibilities

- Generate unused capability recommendations
- Generate higher-value alternatives
- Generate missing capability suggestions
- Generate deprecated capability warnings
- Generate combination suggestions
- Explain recommendations

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Recommendation generation
- Alternative suggestion
- Explanation generation

### Consumed Decisions

- Completed Mission (from Engineering Mission)
- Capability Health (from Capability Health)
- Engineering Memory (from Engineering Memory)

### Produced Decisions

- Recommendations
- Alternatives
- Combinations
