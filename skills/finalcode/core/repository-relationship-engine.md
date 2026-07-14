# Repository Relationship Engine

## Purpose

Build and manage relationships between repositories in an organization. Understanding how repositories relate to each other is essential for impact analysis, dependency management, and organization-wide planning.

## Responsibilities

- Detect relationships between repositories automatically
- Classify relationship types with evidence
- Build a directed relationship graph across all known repositories
- Update relationships as repositories change
- Support impact analysis by tracing relationship chains
- Provide relationship data to all organization-level features

## Inputs

- Organization Registry records
- Dependency analysis from Dependency Graph analysis
- Import/export statements from code analysis
- Configuration files referencing other repositories
- CI/CD configuration referencing deployment targets
- Shared service configurations

## Outputs

- Relationship graph for the entire organization
- Per-repository relationship list
- Impact analysis chains
- Relationship health indicators
- Changes in relationship topology over time

## Relationship Types

### Consumes

Repository A consumes an API or service provided by Repository B.

Evidence: API client code, HTTP requests to known endpoints, service configuration.

### Depends On

Repository A depends on Repository B as a package or module dependency.

Evidence: Package manager dependencies (package.json, requirements.txt, Cargo.toml) referencing internal packages.

### Owns

Repository A owns or maintains Repository B as a sub-project or related project.

Evidence: Shared ownership in CODEOWNERS, same team in repository metadata, co-located in monorepo.

### Imports

Repository A imports code, types, or schemas from Repository B.

Evidence: Import statements referencing internal packages, shared type definitions.

### Publishes

Repository A publishes a package, SDK, or library that Repository B consumes.

Evidence: Package registry publication, version tags, changelog entries.

### Shares Library

Repository A and Repository B both use the same shared library.

Evidence: Both repositories declare the same internal package as a dependency.

### Shared Deployment

Repository A and Repository B are deployed together as part of the same service.

Evidence: Shared CI/CD pipeline, deployment manifest, Docker Compose or Kubernetes configuration.

### Shared Database

Repository A and Repository B access the same database or data store.

Evidence: Connection strings, database configuration, ORM models referencing shared schemas.

### Shared API

Repository A and Repository B expose or consume the same API surface.

Evidence: API documentation references, shared OpenAPI specs, client libraries targeting the same endpoints.

## Relationship Record Schema

| Field | Type | Description |
|---|---|---|
| source_repository_id | string | The originating repository |
| target_repository_id | string | The target repository |
| relationship_type | string | One of the defined relationship types |
| direction | string | Unidirectional or Bidirectional |
| evidence | array | Supporting evidence (file paths, configurations) |
| confidence | string | Very High, High, Medium, Low, Unknown |
| first_detected | date | When this relationship was first observed |
| last_verified | date | When this relationship was last confirmed |
| status | string | Active, Stale, Broken |

## Execution Flow

```
For each repository in Organization Registry:
    |
    ├── Scan imports and dependencies
    ├── Scan configuration files
    ├── Scan CI/CD configuration
    ├── Scan API references and client code
    └── Collect evidence
        |
        v
Cross-reference against other repositories
        |
        v
Match evidence to relationship types
        |
        v
Assign confidence based on evidence strength
        |
        v
Register or update relationship in graph
        |
        v
Mark previously detected but now absent relationships as Stale
```

## Graceful Degradation

When only one repository exists:

- Relationship graph contains only self-references
- All relationship queries return "Single repository — no external relationships detected"
- Impact analysis operates only within the single repository

## Integration Points

- **Organization Registry**: Source and target repositories for relationships
- **Multi-Repository Analysis**: Uses relationship data for cross-repo pattern detection
- **Dependency Graph v2**: Shares dependency detection logic
- **Shared Library Discovery**: Uses Consumes and Imports relationships
- **API Ecosystem Analysis**: Uses Shared API relationship
- **Organization Dashboard**: Displays relationship topology
- **Organization Memory**: Stores historical relationship changes

## Examples

### Detected Relationships

```
Repository A (api-gateway)
    ├── Consumes → Repository B (auth-service) — evidence: HTTP client to /auth/*
    ├── Depends On → Repository C (shared-lib) — evidence: package.json dependency
    └── Imports → Repository D (types) — evidence: import from @internal/types

Repository B (auth-service)
    └── Publishes → Repository A (api-gateway) — evidence: API endpoint documentation
```
