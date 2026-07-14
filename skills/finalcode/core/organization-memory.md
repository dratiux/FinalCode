# Organization Memory

## Purpose

Persist organizational knowledge across all repositories and analyses. Remember past incidents, architectural decisions, historical regressions, migration history, deprecated repositories, and platform evolution so that FinalCode benefits from accumulated organizational experience.

## Responsibilities

- Store organization-wide engineering knowledge
- Persist past incidents and their resolutions
- Record architectural decisions that affect multiple repositories
- Track historical regressions and their root causes
- Document migration history across the organization
- Mark deprecated repositories and their replacement recommendations
- Track platform evolution over time
- Provide knowledge retrieval for all organization-level features

## Inputs

- Decision records from Decision Timeline (per-repository)
- Engineering decisions from Engineering Decision Engine
- Past incident records (from CHANGELOG, incident reports)
- Migration plans and execution records
- Deprecation notices and migration paths
- Architecture Decision Records (ADRs)
- Organization Registry evolution data

## Outputs

- Organization knowledge base
- Incident history with resolutions
- Architectural decision library
- Regression history and patterns
- Migration timeline
- Deprecated repository index
- Platform evolution timeline

## Stored Knowledge Categories

### Past Incidents

Records of significant incidents across the organization:

| Incident | Date | Affected | Root Cause | Resolution | Prevented By |
|---|---|---|---|---|---|
| Auth service outage | 2026-06-15 | web-app, mobile-app | Missing rate limiting | Deployed rate limiter | Dependency scan now blocks similar issues |
| Data corruption | 2026-05-20 | data-service | Missing validation | Added input validation | Shared validation middleware recommended |

### Architectural Decisions

Organization-level architectural decisions:

| Decision | Date | Scope | Rationale | Status |
|---|---|---|---|---|
| Adopt microservices | 2026-01-10 | All services | Team scaling, independent deploys | Active |
| Use TypeScript | 2026-03-01 | All new projects | Type safety, developer productivity | Active |

### Historical Regressions

Recurring regression patterns:

| Pattern | First Seen | Last Seen | Repositories Affected | Mitigation |
|---|---|---|---|---|
| Missing input validation on new endpoints | 2026-02-10 | 2026-06-20 | api-gateway, data-service | Add validation to repository template |
| Dependency version mismatch | 2026-03-15 | 2026-07-01 | auth-service, web-app | Implement Dependabot across all repos |

### Migration History

Track major migrations across the organization:

| Migration | From | To | Completed | Duration | Repositories |
|---|---|---|---|---|---|
| State management | Redux | Zustand | 2026-04-15 | 3 months | web-app, admin-panel |
| API framework | Express | Fastify | 2026-06-01 | 2 months | api-gateway, auth-service |

### Deprecated Repositories

Index of deprecated or archived repositories:

| Repository | Deprecated | Replacement | Migration Path | Status |
|---|---|---|---|---|
| legacy-auth | 2026-05-01 | auth-service | Migrate to new auth service | In Progress |
| old-admin-panel | 2026-04-01 | admin-panel-v2 | Use new admin panel | Completed |

### Platform Evolution

Track how the engineering platform evolves:

| Date | Change | Impact | Decision Driver |
|---|---|---|---|
| 2026-01-10 | Adopted microservices architecture | All new services structured as independent deploys | Team scaling |
| 2026-03-01 | Standardized on TypeScript | All new projects use TypeScript by default | Consistency |

## Knowledge Retrieval

Organization Memory provides a query interface for retrieving relevant past knowledge:

- Given a current finding, find similar past incidents
- Given a repository, find its deprecation or migration history
- Given an architecture decision, find related past decisions
- Given a regression pattern, find previous occurrences and resolutions

## Graceful Degradation

When only one repository exists:

- Organization Memory stores knowledge relevant to that single repository
- Cross-repository incident correlation is limited
- Report indicates "Single repository mode"

## Integration Points

- **Organization Registry**: Repository evolution data
- **Decision Timeline**: Per-repository decision records
- **Engineering Decision Engine**: Decision validation across org
- **Multi-Repository Analysis**: Incident correlation
- **Organization Dashboard**: Knowledge metrics display
- **Organization Roadmap**: Historical context for planning
- **Repository Intelligence Engine**: Repository-level knowledge

## Example

```
═══ ORGANIZATION MEMORY ═══

Knowledge Entries: 47
  - Incidents: 12
  - Architecture Decisions: 8
  - Regression Patterns: 6
  - Migration Records: 5
  - Deprecated Repos: 3
  - Platform Changes: 13

Recent Additions:
  - Incident: Auth service rate limiting failure (2026-07-10)
  - Decision: Adopt OpenAPI 3.1 for all new APIs (2026-07-08)
  - Migration: web-app state management to Zustand (2026-07-05)

Knowledge Used This Analysis:
  - Matched 2 findings to past incidents
  - Retrieved 1 relevant architecture decision
  - Identified 1 recurring regression pattern
```
