# Context-Aware Health Score

## Purpose

Replace the single repository health score with a multi-dimensional health assessment that respects the active certification profile. Different project types have different health priorities.

## Health Dimensions

### Engineering Quality

Measures code quality, architecture, dependency management, and technical debt. Weight varies by profile: higher for libraries and SDKs, lower for landing pages.

### Production Readiness

Measures deployment configuration, error handling, monitoring, and operational readiness. Weight varies by profile: higher for SaaS and Enterprise, ignored for Experimental.

### Repository Maturity

Measures documentation, CI/CD, testing infrastructure, and project conventions. Weight varies by profile: higher for Open Source, lower for Internal Tools.

### Documentation Quality

Measures README completeness, API documentation, changelog, and architectural documentation. Weight varies by profile: higher for Open Source and Libraries, lower for Experimental.

### Operational Readiness

Measures logging, monitoring, alerting, backup, and disaster recovery. Weight varies by profile: only relevant for production systems.

### Security Readiness

Measures security configuration, vulnerability management, authentication, and authorization. Weight varies by profile: higher for Enterprise and API, lower for static websites.

### Maintainability

Measures code organization, module boundaries, dependency quality, and refactoring potential. Weight varies by profile: relevant for all long-lived projects.

### Certification Score

The combined certification score calculated from all applicable gates weighted by the active certification profile.

## Health Score Calculation

The overall health score is calculated as:

```
Overall Health = Σ(dimension_score × dimension_weight) / Σ(dimension_weights)
```

Where dimension weights are determined by the active certification profile.

### Example: SaaS Profile

| Dimension | Weight | Score | Weighted |
|---|---|---|---|
| Engineering Quality | 20% | 85 | 17.0 |
| Production Readiness | 20% | 90 | 18.0 |
| Repository Maturity | 10% | 75 | 7.5 |
| Documentation Quality | 10% | 80 | 8.0 |
| Operational Readiness | 15% | 85 | 12.75 |
| Security Readiness | 15% | 95 | 14.25 |
| Maintainability | 10% | 80 | 8.0 |
| Overall | 100% | — | 85.5 |

### Example: Brand Website Profile

| Dimension | Weight | Score | Weighted |
|---|---|---|---|
| Engineering Quality | 30% | 85 | 25.5 |
| Production Readiness | 5% | 90 | 4.5 |
| Repository Maturity | 15% | 75 | 11.25 |
| Documentation Quality | 25% | 80 | 20.0 |
| Operational Readiness | 0% | — | 0.0 |
| Security Readiness | 10% | 95 | 9.5 |
| Maintainability | 15% | 80 | 12.0 |
| Overall | 100% | — | 82.75 |

### Example: Experimental Profile

| Dimension | Weight | Score | Weighted |
|---|---|---|---|
| Engineering Quality | 40% | 70 | 28.0 |
| Production Readiness | 0% | — | 0.0 |
| Repository Maturity | 10% | 50 | 5.0 |
| Documentation Quality | 10% | 60 | 6.0 |
| Operational Readiness | 0% | — | 0.0 |
| Security Readiness | 20% | 80 | 16.0 |
| Maintainability | 20% | 65 | 13.0 |
| Overall | 100% | — | 68.0 |

## Overall Verdict

The overall verdict is determined by:

1. All mandatory gates must PASS
2. Overall health score must meet the profile minimum threshold
3. No release blockers from mandatory gates
4. Profile-specific requirements must be satisfied

## Integration

The Context-Aware Health Score replaces the existing single health score. It is calculated after all gate evaluations are complete and is included in the certification report.
