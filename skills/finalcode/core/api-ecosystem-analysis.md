# API Ecosystem Analysis

## Purpose

Analyze APIs across all repositories in an organization to detect duplicate APIs, breaking changes, version inconsistencies, contract drift, missing documentation, and shared schemas.

## Responsibilities

- Discover API endpoints across all repositories
- Detect duplicate or overlapping APIs
- Identify breaking changes between API versions
- Track API version inconsistencies
- Detect contract drift between API spec and implementation
- Identify APIs missing documentation
- Discover shared or reusable API schemas
- Track API ecosystem evolution over time

## Inputs

- Repository code from certification analysis
- API route definitions and configurations
- OpenAPI/Swagger specifications
- API client code across repositories
- Schema definitions and type files
- Repository Relationship Engine data (Shared API relationships)
- Historical API data from previous analyses

## Outputs

- API inventory for the entire organization
- Duplicate API detection report
- Breaking change alerts
- Version inconsistency report
- Contract drift detection
- Documentation gap analysis
- Shared schema discovery
- API ecosystem health score

## Analysis Categories

### Duplicate APIs

APIs that serve the same or overlapping purpose across repositories:

- Duplicate CRUD endpoints for the same entity type
- Duplicate authentication or authorization endpoints
- Overlapping data transformation APIs
- Redundant health check or monitoring endpoints

Evidence: Similar URL patterns, same request/response shapes, same entity names.

### Breaking Changes

Changes that may break API consumers:

- Removed endpoints
- Changed request parameter requirements
- Modified response shape
- Changed authentication requirements
- Removed or deprecated fields

### Version Inconsistencies

Different API versions across repositories:

- Same API at different version levels
- Mixed versioning strategies
- Inconsistent deprecation policies
- Mismatched client and server versions

### Contract Drift

Differences between API specification and actual implementation:

- Spec documents endpoints that don't exist in code
- Code exposes endpoints not documented in spec
- Spec and code disagree on request/response shapes
- Error responses differ from spec

### Missing Documentation

APIs without adequate documentation:

- No OpenAPI/Swagger specification
- Missing endpoint descriptions
- Missing parameter documentation
- Missing error response documentation
- No example requests or responses

### Shared Schemas

Schema definitions that could be shared across repositories:

- Duplicate type definitions for same entity
- Shared enum or constant definitions
- Common error response formats
- Reusable pagination or filtering schemas

## Execution Flow

```
Collect API definitions from all repositories
        |
        v
Parse route definitions, OpenAPI specs, and client code
        |
        v
Build organization API inventory
        |
        v
Cross-reference APIs between repositories:
    ├── Detect duplicates (same route, same entity, same purpose)
    ├── Detect version mismatches
    ├── Compare spec vs. implementation
    └── Identify documentation gaps
        |
        v
Calculate API ecosystem health
        |
        v
Generate report
```

## Graceful Degradation

When only one repository exists:

- API analysis runs on the single repository
- Cross-repository duplicate detection is skipped
- Version inconsistency detection operates within the repository
- Report indicates "Single repository mode"

## Integration Points

- **Organization Registry**: Source repository list
- **Repository Relationship Engine**: Shared API relationships
- **Multi-Repository Analysis**: Cross-repo API patterns
- **Shared Library Discovery**: Shared schema candidates
- **Organization Dashboard**: API health metrics
- **Release Governance**: API version tracking in releases

## Example

```
═══ API ECOSYSTEM ANALYSIS ═══

API Inventory: 47 endpoints across 4 repositories

Duplicate APIs:
  GET /api/users           — Found in api-gateway AND auth-service
  POST /api/auth/login     — Found in auth-service (v1) AND web-app (v2)

Breaking Changes Detected:
  auth-service v2.0 removes POST /api/auth/refresh
  → Impacted: web-app, mobile-app (both depend on this endpoint)

Version Inconsistencies:
  auth-service: v2.0  ←  web-app client: expects v1 response
  Fix: Update web-app client to v2.0 contract

Missing Documentation:
  12 endpoints (26%) lack OpenAPI specs
  Primary gap: data-service (8 undocumented endpoints)

Shared Schema Opportunities:
  User type defined in 3 repositories (api-gateway, auth-service, web-app)
  Error response format defined in 4 repositories
  Pagination parameters defined in 3 repositories

API Ecosystem Health: 68 / 100 (Needs Improvement)
```
