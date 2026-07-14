# Release Governance

## Purpose

Track releases across all repositories in the organization. Analyze release cadence, release stability, rollback frequency, blocked releases, and cross-project compatibility to provide visibility into the organization's release health.

## Responsibilities

- Track release events across all registered repositories
- Monitor release cadence and frequency per repository
- Analyze release stability (success rate, rollback frequency)
- Detect blocked releases and their causes
- Track cross-project compatibility during releases
- Generate release health reports
- Alert on release anomalies

## Inputs

- Release history from git tags and changelogs
- CI/CD pipeline results
- Deployment records
- Repository Registry data
- API Ecosystem Analysis data for compatibility checks
- Dependency Graph v2 data for dependency-aware releases

## Outputs

- Organization release dashboard
- Per-repository release cadence report
- Release stability metrics
- Rollback analysis
- Blocked release tracking
- Cross-project compatibility report
- Release health score

## Release Metrics

### Release Cadence

Track how often each repository releases:

| Repository | Avg Interval | Last Release | Releases (90d) |
|---|---|---|---|
| api-gateway | 14 days | 2026-07-10 | 6 |
| auth-service | 21 days | 2026-07-08 | 4 |
| web-app | 7 days | 2026-07-12 | 12 |

### Release Stability

Measure how stable releases are:

- Release success rate (percentage of releases that deploy successfully)
- Rollback rate (percentage of releases that were rolled back)
- Hotfix rate (percentage of releases that required immediate fixes)
- Time to stabilize (avg time from first attempt to successful deploy)

### Rollback Analysis

Analyze why releases were rolled back:

| Cause | Count | Primary Repository |
|---|---|---|
| Breaking API change | 3 | api-gateway |
| Performance regression | 2 | data-service |
| Database migration issue | 1 | auth-service |
| Configuration error | 1 | web-app |

### Blocked Releases

Track releases that are currently blocked:

| Repository | Blocking Issue | Since | Impact |
|---|---|---|---|
| legacy-service | Architecture gate FAIL | 2026-07-01 | Cannot deploy |
| data-service | Missing security review | 2026-07-10 | Delayed 2 days |

### Cross-Project Compatibility

Track compatibility between interdependent releases:

- Coordinated version bumps across repositories
- Breaking change notifications to dependent repos
- Compatible version matrix
- Shared dependency upgrade coordination

## Release Health Score

The release health score is calculated per repository and aggregated:

```
Release Health = (Success Rate × 0.3) + (Stability × 0.3) + (Cadence Consistency × 0.2) + (Rollback Avoidance × 0.2)
```

Range: 0-100

## Execution Flow

```
Collect release data from all repositories
        |
        v
Parse git tags, changelogs, and CI/CD records
        |
        v
Calculate per-repository release metrics
        |
        v
Detect release anomalies (too frequent, too sparse, frequent rollbacks)
        |
        v
Check cross-project compatibility for recent releases
        |
        v
Calculate release health scores
        |
        v
Generate release governance report
```

## Graceful Degradation

When only one repository exists:

- Release governance covers the single repository
- Cross-project compatibility analysis is skipped
- Report indicates "Single repository mode"

## Integration Points

- **Organization Registry**: Repository list for release tracking
- **Multi-Repository Analysis**: Cross-repo release coordination
- **API Ecosystem Analysis**: API compatibility during releases
- **Dependency Graph v2**: Dependency-aware release planning
- **Organization Dashboard**: Release health metrics
- **Team Engineering Insights**: Team-level release quality
- **Organization Memory**: Release history storage

## Example

```
═══ RELEASE GOVERNANCE ═══

Organization Release Health: 78 / 100

Repository Release Health:
  api-gateway:     85  (6 releases, 0 rollbacks)
  auth-service:    82  (4 releases, 0 rollbacks)
  web-app:         72  (12 releases, 2 rollbacks)
  data-service:    70  (3 releases, 1 rollback)
  legacy-service:  45  (1 release, blocked)

Release Cadence:
  Overall: 8 releases/week across 5 repositories
  Fastest: web-app (every 7 days)
  Slowest: legacy-service (no releases in 60 days)

Rollback Analysis (Last 30 Days):
  3 rollbacks total
  Primary cause: Breaking API changes (2 of 3)

Blocked Releases:
  legacy-service: Architecture gate failure (blocked 14 days)
  → Required: Architecture review before next release

Cross-Project Compatibility:
  Last release window (2026-07-10):
  → api-gateway v2.1 and auth-service v1.8: Compatible ✓
  → web-app v3.2 requires auth-service ≥ v1.7: Satisfied ✓
```
