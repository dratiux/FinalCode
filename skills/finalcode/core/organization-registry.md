# Organization Registry

## Purpose

Maintain an inventory of every repository known to FinalCode. The Organization Registry is the central directory that enables all multi-repository analysis, cross-repository relationships, and organization-scale engineering intelligence.

## Responsibilities

- Register new repositories when they are first analyzed
- Store and update metadata for every known repository
- Track repository health, maturity, and engineering history over time
- Provide a unified query interface for all organization-level features
- Detect when the same repository is analyzed from different contexts
- Support both single-repository and multi-repository modes transparently

## Inputs

- Repository metadata from Project Classification Engine
- Repository health scores from Context-Aware Health Score
- Engineering maturity assessments from Repository Maturity Model
- Dependency information from Dependency Graph analysis
- Historical certification data from Context Memory

## Outputs

- Complete repository inventory for the organization
- Per-repository metadata records
- Organization-wide health aggregates
- Repository discovery notifications for new/unregistered repositories

## Repository Record Schema

Every registered repository stores the following fields:

| Field | Type | Description |
|---|---|---|
| repository_id | string | Unique identifier (format: ORG-REPO-{N}) |
| name | string | Repository name |
| full_path | string | Full filesystem path or remote URL |
| purpose | string | Detected project type (e.g., SaaS, Library, API) |
| owner | string | Detected owner or responsible entity |
| team | string | Detected team name (if identifiable) |
| technology_stack | object | Languages, frameworks, runtime, tools |
| architecture | string | Detected architecture style |
| runtime | string | Runtime environment |
| deployment | string | Deployment target |
| maturity | string | Engineering maturity level |
| health | number | Current health score (0-100) |
| health_history | array | Historical health scores with timestamps |
| dependencies | array | Internal and external dependencies |
| related_repositories | array | Related repository IDs with relationship types |
| first_analyzed | date | Date of first FinalCode analysis |
| last_analyzed | date | Date of most recent FinalCode analysis |
| analysis_count | number | Total number of analyses performed |
| certification_history | array | Historical certification verdicts |
| tags | array | User-defined or auto-detected tags |

## Execution Flow

```
Repository analyzed
        |
        v
Check Organization Registry
    ├── Not registered → Create new record
    ├── Already registered → Update existing record
    └── Registry empty → Initialize with first repository
        |
        v
Populate fields from Project Classification Engine
        |
        v
Update health history from current analysis
        |
        v
Return repository record to caller
```

## Integration Points

- **Project Classification Engine**: Provides repository type, architecture, stack, maturity
- **Context-Aware Health Score**: Provides health scores for history tracking
- **Repository Relationship Engine**: Populates related_repositories
- **Multi-Repository Analysis**: Queries registry for cross-repo comparisons
- **Engineering Organization Dashboard**: Reads registry for aggregate metrics
- **Context Memory**: Shares historical data storage patterns
- **Organization Memory**: Stores long-term organizational knowledge

## Examples

### Registering a Repository

When a new repository is analyzed for the first time:

```
Repository: FinalCode
Purpose: Open Source Framework
Architecture: Specification
Health: 96
First analyzed: 2026-07-14
→ Organization Registry creates record ORG-REPO-001
```

### Single vs. Multi-Repository Mode

If the registry contains only one repository, all organization features return single-repository results or gracefully indicate "insufficient data for comparison."

If the registry contains multiple repositories, organization features activate fully with cross-repository comparisons.
