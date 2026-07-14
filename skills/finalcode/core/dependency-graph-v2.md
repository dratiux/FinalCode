# Dependency Graph v2

## Purpose

Generate an organization-level dependency graph that includes both internal and external packages, detects circular dependencies, identifies critical dependency chains, calculates upgrade priorities, and tracks risk propagation across the dependency network.

## Responsibilities

- Build a complete dependency graph for the entire organization
- Include internal packages (cross-repository) and external packages
- Detect circular dependencies within and across repositories
- Identify critical dependency chains (paths that affect many repositories)
- Calculate upgrade priorities based on impact analysis
- Track risk propagation through the dependency network
- Monitor dependency graph evolution over time

## Inputs

- Package manager configurations from all repositories (package.json, Cargo.toml, requirements.txt, etc.)
- Lockfiles for pinned dependency versions
- Import/export statements from code analysis
- Repository Relationship Engine data
- Internal package registry data (if available)

## Outputs

- Organization-wide dependency graph
- Circular dependency detection report
- Critical dependency chain identification
- Upgrade priority matrix
- Risk propagation map
- Dependency health summary
- Dependency evolution timeline

## Graph Components

### Nodes

Each node represents a package or repository:

| Node Type | Description | Examples |
|---|---|---|
| Repository | A registered repository in the organization | api-gateway, auth-service |
| Internal Package | A package maintained within the organization | @internal/validation, @internal/types |
| External Package | A third-party dependency | express, react, lodash |

### Edges

Each edge represents a dependency relationship:

| Edge Type | Description |
|---|---|
| Depends On | Node A depends on Node B |
| Dev Depends On | Node A depends on Node B for development only |
| Optional Depends On | Node A optionally depends on Node B |
| Peer Depends On | Node A and Node B are peers |

## Critical Dependency Chains

Chains of dependencies where a failure or vulnerability in one package affects many downstream repositories:

```
lodash@4.17.20 (Vulnerable)
    → @internal/shared-utils
        → auth-service
        → api-gateway
        → web-app
        → mobile-backend
```

Risk propagation impact: 4 repositories affected by a single vulnerable upstream dependency.

## Upgrade Priorities

Priorities for upgrading dependencies based on impact analysis:

| Priority | Criteria |
|---|---|
| P0 (Immediate) | Critical vulnerability affecting production repositories |
| P1 (Short Term) | High severity vulnerability or breaking change incoming |
| P2 (Medium Term) | Deprecated dependency or minor vulnerability |
| P3 (Long Term) | Version lag, no security impact |

## Execution Flow

```
Collect dependency data from all repositories
        |
        v
Parse package manifests and lockfiles
        |
        v
Resolve internal dependencies via Repository Relationship Engine
        |
        v
Build unified dependency graph
        |
        v
Detect circular dependencies
        |
        v
Identify critical chains (wide impact paths)
        |
        v
Calculate upgrade priorities
        |
        v
Map risk propagation
        |
        v
Generate dependency graph report
```

## Graceful Degradation

When only one repository exists:

- Dependency graph covers only the single repository
- Cross-repository edges are not present
- Critical chain detection operates within the repository
- Report indicates "Single repository mode"

## Integration Points

- **Organization Registry**: Repository list for graph construction
- **Repository Relationship Engine**: Internal dependency relationships
- **Multi-Repository Analysis**: Cross-repo dependency patterns
- **Shared Library Discovery**: Shared dependency detection
- **Organization Dashboard**: Dependency health metrics
- **Release Governance**: Dependency version tracking in releases
- **Organization Memory**: Dependency graph history

## Example

```
═══ ORGANIZATION DEPENDENCY GRAPH ═══

Nodes: 142 (4 repositories, 3 internal packages, 135 external packages)
Edges: 487

Internal Dependencies:
  api-gateway → @internal/types, @internal/validation
  auth-service → @internal/types
  web-app → @internal/ui-components
  data-service → @internal/validation

Circular Dependencies: 1 detected
  @internal/validation ↔ @internal/types
  → Impact: Upgrade coordination required, 2 repos affected

Critical Chains:
  1. express@4.18.2 → api-gateway → auth-service → web-app
     (3 repos affected if express has vulnerability)

Upgrade Priorities:
  P0: axios@0.21.1 → P0 vulnerability (CVE-2021-3749)
      → Upgrade all 3 repos: api-gateway, auth-service, web-app
  P1: lodash@4.17.20 → Deprecated, upgrade recommended
  P2: moment@2.29.1 → Use date-fns or native Date instead

Dependency Health: 82 / 100 (Good)
  - 2 deprecated packages
  - 0 circular dependencies across repos
  - 1 critical chain identified
```
