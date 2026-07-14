# Team Engineering Insights

## Purpose

Provide engineering metrics grouped by team. Track quality trends, review quality, regression frequency, decision quality, release quality, architecture quality, and learning adoption at the team level to give engineering managers and team leads actionable insight into their team's performance.

## Responsibilities

- Group repository data by detected team ownership
- Calculate team-level engineering metrics
- Track quality trends per team over time
- Measure review quality and code review effectiveness
- Monitor regression frequency by team
- Assess decision quality from Decision Validation
- Evaluate release quality and stability
- Track architecture quality per team
- Measure learning adoption from Engineering Learning System

## Inputs

- Organization Registry records with team assignments
- Per-repository certification results
- Finding data from certification pipeline
- Decision records from Decision Engine and Decision Validation
- Review data (if available from PR analysis)
- Release data from Release Governance
- Learning data from Engineering Learning System
- Trend data from Historical Trend Analysis

## Outputs

- Team-level quality dashboard
- Quality trend per team
- Review quality metrics
- Regression frequency report
- Decision quality assessment
- Release quality summary
- Architecture quality rating
- Learning adoption score
- Cross-team comparison

## Team Metrics

### Quality Trends

Track how team quality changes over time:

| Team | Current Health | 30-day Trend | 90-day Trend |
|---|---|---|---|
| Platform | 92 | +3 | +8 |
| Backend | 84 | -2 | +4 |
| Frontend | 78 | +5 | +12 |

### Review Quality

Measure code review effectiveness:

- Review coverage (fraction of PRs reviewed)
- Review depth (comments per PR)
- Review turnaround time
- Defect escape rate (bugs found post-merge)

### Regression Frequency

Track regressions introduced by team:

| Team | Regressions (30d) | Regressions (90d) | Trend |
|---|---|---|---|
| Platform | 1 | 5 | Improving |
| Backend | 4 | 15 | Stable |
| Frontend | 2 | 8 | Worsening |

### Decision Quality

Assess engineering decisions from Decision Validation:

- Intentional vs. accidental decision ratio
- Decision confidence distribution
- Trade-off acceptance rate
- Decision reversal frequency

### Release Quality

Evaluate release stability by team:

- Release success rate
- Rollback frequency
- Hotfix count per release
- Time to recover from incidents

### Architecture Quality

Track architecture health by team:

- Architecture score trend
- Modularity improvement
- Dependency management quality
- Technical debt accumulation rate

### Learning Adoption

Measure adoption of learning from Engineering Learning System:

- Learning recommendation acceptance rate
- Workflow optimization adoption
- Capability utilization improvement
- Decision improvement rate

## Cross-Team Comparison

| Dimension | Platform | Backend | Frontend | Organization |
|---|---|---|---|---|
| Health Score | 92 | 84 | 78 | 85 |
| Security Rating | A | A- | B+ | A- |
| Test Coverage | 85% | 72% | 68% | 75% |
| Regression Rate | 1/mo | 4/mo | 2/mo | 2.3/mo |
| Review Coverage | 95% | 80% | 75% | 83% |

## Graceful Degradation

When only one repository exists:

- Team-level insights show the single team
- Cross-team comparison is not available
- Report indicates "Single team mode"

## Integration Points

- **Organization Registry**: Repository-to-team mapping
- **Engineering Organization Dashboard**: Team data integration
- **Organization Roadmap**: Team-level priorities
- **Release Governance**: Release quality data
- **Decision Timeline**: Decision history per team
- **Engineering Learning System**: Learning adoption metrics
- **Executive Reporting**: Team-level executive summaries

## Example

```
═══ TEAM ENGINEERING INSIGHTS ═══

Team: Platform (2 repositories)
  Health:       92  ↑ (+3 this month)
  Security:     A
  Test Coverage: 85%
  Regressions:  1 this month
  Review Coverage: 95%

  Top Improvement: Standardize CI/CD pipeline (ROI: 82)

Team: Backend (3 repositories)
  Health:       84  ↓ (-2 this month)
  Security:     A-
  Test Coverage: 72%
  Regressions:  4 this month
  Review Coverage: 80%

  Top Improvement: Increase test coverage in data-service (ROI: 76)

Recommendation: Backend team would benefit from shared testing
infrastructure and review process improvements.
```
