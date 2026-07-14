# Recommendation ROI

## Purpose

Every recommendation includes a return on investment calculation. Highest ROI recommendations appear first in reports so teams can prioritize work that delivers the most engineering value per unit of effort.

## ROI Dimensions

### Engineering Gain

The expected improvement in engineering quality:

- **Code Quality**: Readability, maintainability, consistency
- **Security**: Vulnerability reduction, attack surface reduction
- **Performance**: Speed, efficiency, resource usage
- **Reliability**: Error handling, fault tolerance
- **Testability**: Coverage, automation potential
- **Developer Experience**: Development speed, tooling

Each dimension is rated: Critical, Significant, Moderate, Minor, or None.

### Risk

The risk associated with the recommendation:

- **Breaking Change Risk**: High, Medium, Low
- **Implementation Risk**: High, Medium, Low
- **Regression Risk**: High, Medium, Low

### Complexity

The technical complexity of implementing the recommendation:

- **Simple**: Single file change, well-understood pattern
- **Moderate**: Multiple files, established pattern
- **Complex**: Multiple modules, new patterns, coordination required
- **Major**: Architecture-level change, cross-team coordination

### Estimated Time

Estimated implementation time:

- 5 minutes
- 30 minutes
- 2 hours
- Half day
- Multiple days

### Expected Health Improvement

The expected improvement in the overall health score if implemented. Expressed as a range (e.g., +2-5 points).

### Priority

Priority is calculated from ROI dimensions:

- **P0 (Immediate)**: High gain, low risk, low complexity, quick implementation
- **P1 (Short Term)**: High gain, acceptable risk, moderate complexity
- **P2 (Medium Term)**: Moderate gain, manageable risk
- **P3 (Long Term)**: Low gain or high complexity or high risk

### Return On Investment

ROI is a calculated score from 0-100 based on:

```
ROI = (Engineering Gain Weight × 0.4) + (Risk Avoidance × 0.2) + (Time Efficiency × 0.2) + (Health Impact × 0.2)
```

Where each dimension is normalized to 0-100 and weighted by importance.

## ROI Calculation Example

| Recommendation | Gain | Risk | Complexity | Time | Health | ROI |
|---|---|---|---|---|---|---|
| Add input validation | Critical | Low | Simple | 2 hours | +5 | 92 |
| Extract shared utility | Significant | Low | Simple | 30 min | +2 | 85 |
| Add E2E tests | Critical | Medium | Complex | 3 days | +8 | 65 |
| Refactor module boundaries | Moderate | High | Major | 5 days | +4 | 35 |

## Report Integration

Recommendations are sorted by ROI descending in the report. The ROI score is displayed alongside each recommendation. The report includes an "ROI Summary" section showing the distribution of recommendations by ROI tier.

## Integration

Recommendation ROI is calculated by the Engineering Decision Engine after observation classification. It is included in every recommendation finding and displayed in the certification report.
