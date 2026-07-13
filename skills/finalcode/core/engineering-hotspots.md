# FinalCode Engineering Hotspots

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Detects unstable areas with highest maintenance cost |
| Execution Stage | ANALYSIS |
| Loaded By | All operating modes, Continuous Engineering Intelligence |
| Dependencies | Repository Intelligence Engine, Engineering Graph |
| Outputs | Hotspot ranking with risk and cost |
| Consumers | Report Engine, Continuous Risk Monitoring, User |
| Applies To | All audits |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| repositoryProfile | object | Yes | Repository Intelligence Engine |
| engineeringGraph | object | Yes | Engineering Graph |
| gitHistory | object | Yes | Git History Analysis |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| engineeringHotspots | object | Complete hotspot analysis |
| hotspotRanking | array | Ranked list of hotspots |
| hotspotMetrics | object | Metrics for each hotspot |

### Preconditions

- Repository Profile must be generated
- Engineering Graph must be built
- Git history must be analyzed

### Postconditions

- Hotspots are identified
- Ranking is generated
- Metrics are calculated

## Purpose

Engineering Hotspots detect unstable areas that require the most attention. By measuring modification frequency, repair frequency, failure rate, complexity, regression frequency, and maintenance cost, FinalCode identifies where engineering effort should be focused.

**Why this matters:** Not all code is equal. Some files are modified frequently, others rarely. Hotspots highlight the files that matter most for engineering quality and risk.

## Hotspot Metrics

### Modification Frequency

| Metric | Description |
|--------|-------------|
| Total modifications | Number of times modified |
| Recent modifications | Modifications in last 30 days |
| Modification rate | Modifications per month |
| Modification trend | Increasing, stable, decreasing |

### Repair Frequency

| Metric | Description |
|--------|-------------|
| Total repairs | Number of times repaired |
| Recent repairs | Repairs in last 30 days |
| Repair rate | Repairs per month |
| Repair trend | Increasing, stable, decreasing |

### Failure Rate

| Metric | Description |
|--------|-------------|
| Total failures | Number of test failures |
| Recent failures | Failures in last 30 days |
| Failure rate | Failures per month |
| Failure trend | Increasing, stable, decreasing |

### Complexity

| Metric | Description |
|--------|-------------|
| Cyclomatic complexity | Code complexity |
| Cognitive complexity | Human complexity |
| Complexity trend | Increasing, stable, decreasing |

### Regression Frequency

| Metric | Description |
|--------|-------------|
| Total regressions | Number of regressions |
| Recent regressions | Regressions in last 30 days |
| Regression rate | Regressions per month |
| Regression trend | Increasing, stable, decreasing |

### Maintenance Cost

| Metric | Description |
|--------|-------------|
| Time to fix | Average time to fix issues |
| Effort to fix | Average effort to fix issues |
| Cost trend | Increasing, stable, decreasing |

## Hotspot Ranking

### Scoring Formula

```
Hotspot Score = (Modification Frequency × 0.25) +
                (Repair Frequency × 0.25) +
                (Failure Rate × 0.20) +
                (Complexity × 0.15) +
                (Regression Frequency × 0.10) +
                (Maintenance Cost × 0.05)
```

### Risk Levels

| Risk Level | Score Range | Description |
|------------|-------------|-------------|
| Critical | 80-100 | Requires immediate attention |
| High | 60-79 | Requires attention soon |
| Medium | 40-59 | Monitor regularly |
| Low | 20-39 | Normal maintenance |
| Minimal | 0-19 | Low maintenance |

## Hotspot Output

```
ENGINEERING HOTSPOTS
==================================================
Overall Status: 5 hotspots identified

Hotspot Ranking:
  1. src/services/userService.ts (Score: 92, Risk: Critical)
     Modifications: 45 (12 this month)
     Repairs: 12 (3 this month)
     Failures: 8 (2 this month)
     Complexity: 85
     Regressions: 5 (1 this month)
     Maintenance Cost: High

  2. src/routes/api.ts (Score: 85, Risk: Critical)
     Modifications: 38 (8 this month)
     Repairs: 10 (2 this month)
     Failures: 6 (1 this month)
     Complexity: 78
     Regressions: 4 (0 this month)
     Maintenance Cost: High

  3. src/middleware/auth.ts (Score: 72, Risk: High)
     Modifications: 32 (6 this month)
     Repairs: 8 (1 this month)
     Failures: 5 (1 this month)
     Complexity: 65
     Regressions: 3 (0 this month)
     Maintenance Cost: Medium

  4. src/utils/helpers.ts (Score: 65, Risk: High)
     Modifications: 28 (5 this month)
     Repairs: 7 (1 this month)
     Failures: 4 (0 this month)
     Complexity: 58
     Regressions: 2 (0 this month)
     Maintenance Cost: Medium

  5. src/config/settings.ts (Score: 58, Risk: Medium)
     Modifications: 25 (4 this month)
     Repairs: 5 (0 this month)
     Failures: 3 (0 this month)
     Complexity: 52
     Regressions: 2 (0 this month)
     Maintenance Cost: Low

Recommendations:
  1. Refactor src/services/userService.ts to reduce complexity
  2. Add comprehensive tests for src/routes/api.ts
  3. Simplify src/middleware/auth.ts logic
  4. Extract common patterns from src/utils/helpers.ts
  5. Document configuration in src/config/settings.ts

Hotspot Status: ⚠️ Active monitoring recommended
==================================================
```

## Architecture Explainability

### Responsibilities

- Detect modification frequency
- Detect repair frequency
- Detect failure rate
- Measure complexity
- Detect regression frequency
- Calculate maintenance cost
- Rank hotspots

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Hotspot detection
- Ranking calculation
- Risk assessment

### Consumed Decisions

- Repository Profile (from Repository Intelligence Engine)
- Engineering Graph (from Engineering Graph Engine)
- Git History (from Git History Analysis)

### Produced Decisions

- Hotspot ranking
- Hotspot metrics
- Risk levels
