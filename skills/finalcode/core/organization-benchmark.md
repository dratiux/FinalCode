# Organization Benchmark

## Purpose

Compare repositories internally across multiple dimensions to rank them by architecture, quality, security, performance, maintainability, testing, documentation, and operational readiness. Provide relative rankings and identify top performers and areas needing improvement.

## Responsibilities

- Define benchmark dimensions and scoring criteria
- Score each repository across all benchmark dimensions
- Rank repositories within the organization
- Identify top performers in each dimension
- Detect underperforming repositories requiring attention
- Track benchmark evolution over time
- Provide dimension-level breakdowns for targeted improvement

## Inputs

- Per-repository health scores from Context-Aware Health Score
- Architecture scores from Architecture Gate
- Quality scores from Code Quality Gate
- Security ratings from Security Gate
- Performance scores from Performance Gate
- Maintainability scores from Maintainability assessment
- Testing scores from Testing Gate
- Documentation scores from Documentation Gate
- Operational readiness from Production Audit

## Outputs

- Organization benchmark ranking
- Per-dimension ranking tables
- Top performer identification
- Improvement opportunity analysis
- Benchmark trend tracking
- Composite organization score

## Benchmark Dimensions

### Architecture

Evaluation criteria:

- Module organization and separation of concerns
- Dependency management quality
- Design pattern usage
- Architecture documentation
- Scalability assessment

### Quality

Evaluation criteria:

- Code complexity metrics
- Code duplication percentage
- Naming convention consistency
- Code style adherence
- Static analysis results

### Security

Evaluation criteria:

- Security Gate 2.0 rating
- Vulnerability count
- Dependency security posture
- Security configuration completeness
- Security testing coverage

### Performance

Evaluation criteria:

- Bundle size and optimization
- Database query efficiency
- Caching strategy
- Load time metrics
- Resource usage patterns

### Maintainability

Evaluation criteria:

- Technical debt estimate
- Module cohesion and coupling
- Testability
- Code readability
- Documentation coverage

### Testing

Evaluation criteria:

- Test coverage percentage
- Test types present (unit, integration, E2E)
- Test reliability and flakiness
- CI/CD test automation
- Test data management

### Documentation

Evaluation criteria:

- README completeness
- API documentation coverage
- Architecture documentation
- Setup and onboarding documentation
- Changelog maintenance

### Operational Readiness

Evaluation criteria:

- Monitoring and alerting configuration
- Logging completeness
- Error handling coverage
- Deployment automation
- Disaster recovery planning

## Ranking Methodology

Each dimension is scored 0-100. The composite rank is the average of all dimension scores.

```
Composite Score = (Architecture + Quality + Security + Performance + Maintainability + Testing + Documentation + Operational Readiness) / 8
```

### Dimension Weights

All dimensions are equally weighted for benchmarking. Teams may apply custom weights for specific evaluations.

## Benchmark Output

### Repository Ranking Table

| Rank | Repository | Composite | Arch | Qual | Sec | Perf | Maint | Test | Doc | Ops |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | api-gateway | 91 | 94 | 92 | 95 | 88 | 90 | 85 | 93 | 89 |
| 2 | auth-service | 85 | 88 | 86 | 90 | 82 | 84 | 80 | 88 | 84 |
| 3 | web-app | 74 | 72 | 76 | 70 | 78 | 74 | 68 | 80 | 72 |
| 4 | legacy-service | 58 | 45 | 60 | 55 | 62 | 50 | 45 | 65 | 60 |

### Dimension Leaders

| Dimension | Top Repository | Score |
|---|---|---|
| Architecture | api-gateway | 94 |
| Quality | api-gateway | 92 |
| Security | api-gateway | 95 |
| Performance | web-app | 78 |
| Maintainability | api-gateway | 90 |
| Testing | api-gateway | 85 |
| Documentation | api-gateway | 93 |
| Operational Readiness | api-gateway | 89 |

## Graceful Degradation

When only one repository exists:

- Benchmark shows ranking of the single repository as "Only repository — baseline established"
- Dimension scores are recorded for future comparison
- Report indicates "Single repository mode — rank data available when additional repositories are added"

## Integration Points

- **Organization Registry**: Repository list for comparison
- **Engineering Organization Dashboard**: Displays benchmark rankings
- **Organization Roadmap**: Uses benchmark gaps for planning
- **Executive Reporting**: Benchmark summary for leadership
- **Organization Memory**: Stores benchmark history

## Example

```
═══ ORGANIZATION BENCHMARK ═══

Organization Average: 77 / 100

Repository Rankings:
  1. api-gateway     91  ★ Excellent
  2. auth-service    85  ★ Good
  3. web-app         74  − Fair
  4. legacy-service  58  ▼ Needs Improvement

Top Performer: api-gateway
  Leads in: Architecture, Quality, Security, Maintainability,
            Testing, Documentation, Operational Readiness

Improvement Opportunities:
  legacy-service: Architecture (45), Testing (45)
  web-app: Security (70), Testing (68)
```
