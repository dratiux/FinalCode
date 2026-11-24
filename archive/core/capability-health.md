# FinalCode Capability Health

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Measures capability health including usage, success rate, verification, execution time, regression prevention, and engineering impact |
| Execution Stage | ANALYSIS |
| Loaded By | All operating modes, Capability Dashboard |
| Dependencies | Capability Registry, Engineering Memory |
| Outputs | Capability health scores |
| Consumers | Capability Dashboard, User |
| Applies To | All engineering operations |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| capabilityId | string | Yes | Capability Registry |
| usageHistory | array | Yes | Engineering Memory |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| capabilityHealth | object | Complete capability health |
| usageFrequency | number | Usage frequency |
| successRate | number | Success rate |
| verificationPassRate | number | Verification pass rate |
| averageExecutionTime | number | Average execution time |
| regressionPrevention | number | Regression prevention rate |
| engineeringImpact | number | Engineering impact |
| healthScore | number | Overall health score |

### Preconditions

- Capability must be registered
- Usage history must be available

### Postconditions

- Health is measured
- Score is calculated
- Health is tracked

## Purpose

Measure capability health including usage frequency, success rate, verification pass rate, average execution time, regression prevention, engineering impact, and confidence. Generate a health score for every capability.

**Why this matters:** Health scores help identify underperforming capabilities and guide improvement efforts.

## Health Metrics

| Metric | Weight | Description |
|--------|--------|-------------|
| Usage Frequency | 20% | How often used |
| Success Rate | 25% | How often successful |
| Verification Pass Rate | 20% | How often verification passes |
| Average Execution Time | 15% | How long it takes |
| Regression Prevention | 10% | How often prevents regressions |
| Engineering Impact | 10% | Impact on engineering quality |

## Health Output

```
CAPABILITY HEALTH
==================================================
Capability: engineering-review

Health Metrics:
  Usage Frequency: 85% (used in 85% of missions)
  Success Rate: 92% (succeeded 92% of time)
  Verification Pass Rate: 95% (passed 95% of time)
  Average Execution Time: 45 seconds
  Regression Prevention: 88% (prevented 88% of regressions)
  Engineering Impact: 90% (high impact)

Health Score: 91/100

Health Status: ✅ Healthy

Health History:
  v4.0.0: 88%
  v4.1.0: 89%
  v4.2.0: 91%

Health Trend: ↑ Improving
==================================================
```

## Architecture Explainability

### Responsibilities

- Measure usage frequency
- Calculate success rate
- Calculate verification pass rate
- Track execution time
- Calculate regression prevention
- Calculate engineering impact
- Generate health score

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Health measurement
- Score calculation
- Health tracking

### Consumed Decisions

- Capability (from Capability Registry)
- Usage History (from Engineering Memory)

### Produced Decisions

- Capability health
- Health score
- Health trend
