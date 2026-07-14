# Platform Standardization

## Purpose

Recommend engineering standardization across the organization. Identify opportunities to create shared templates, configurations, and workflows that reduce duplication and improve consistency across all repositories.

## Responsibilities

- Audit all repositories for configuration inconsistencies
- Detect divergent tooling and configuration patterns
- Recommend shared templates and configurations
- Prioritize standardization by engineering impact
- Track standardization adoption progress
- Estimate engineering savings from standardization

## Inputs

- Organization Registry records
- Per-repository configuration files
- Build and CI/CD configurations from all repositories
- Linting and formatting configurations
- TypeScript, ESLint, Prettier, and other tool configurations
- Documentation structure and templates
- Release workflow definitions
- Security policy configurations

## Outputs

- Standardization opportunity report
- Shared template recommendations
- Configuration unification priorities
- Engineering savings estimates
- Standardization roadmap
- Adoption tracking metrics

## Standardization Categories

### Repository Templates

Standardized repository scaffolding:

- Recommended directory structure
- Required configuration files
- Standard README template
- Standard issue and PR templates
- Standard license and security files

### Shared ESLint Configs

Unified linting rules across all repositories:

- Shared ESLint configuration package
- Consistent rule severity levels
- Repository-specific overrides allowed
- Automated linting in CI/CD

### Shared TypeScript Configs

Unified TypeScript configuration:

- Shared tsconfig.json base
- Consistent strictness settings
- Repository-specific paths and projects
- Standard build target

### Shared CI Pipelines

Unified CI/CD workflow templates:

- Shared GitHub Actions workflow templates
- Standard build, lint, test, deploy steps
- Consistent environment management
- Standard artifact publishing

### Shared Documentation

Unified documentation standards:

- Standard README sections
- Shared API documentation template
- Consistent changelog format
- Standard architecture decision record format

### Shared Release Workflows

Unified release processes:

- Standard versioning scheme
- Shared release checklist
- Consistent changelog generation
- Standard release notes format

### Shared Security Policies

Unified security configurations:

- Standard dependency scanning configuration
- Shared secret detection rules
- Consistent security headers policy
- Standard vulnerability response workflow

## Opportunity Record Schema

| Field | Type | Description |
|---|---|---|
| opportunity_id | string | Unique identifier |
| category | string | Template, ESLint, TypeScript, CI, Documentation, Release, Security |
| current_divergence | string | Description of current inconsistency |
| recommended_unification | string | Description of recommended shared solution |
| affected_repositories | array | Repositories that would benefit |
| engineering_savings | string | Estimated hours saved per year |
| implementation_effort | string | Effort to implement (hours) |
| priority | string | P0, P1, P2, P3 |
| roi_score | number | ROI score (0-100) |

## Execution Flow

```
Collect configuration files from all repositories
        |
        v
Compare configurations across repositories
        |
        v
Detect divergence patterns
        |
        v
For each divergence:
    ├── Determine recommended unification approach
    ├── Calculate engineering savings
    └── Estimate implementation effort
        |
        v
Rank opportunities by ROI
        |
        v
Generate standardization recommendations
```

## Graceful Degradation

When only one repository exists:

- Standardization analysis runs within the single repository
- Cross-repository divergence detection is skipped
- Report recommends internal consistency improvements
- Report indicates "Single repository mode"

## Integration Points

- **Organization Registry**: Repository list for comparison
- **Shared Library Discovery**: Coordinates sharing recommendations
- **Organization Roadmap**: Includes standardization as roadmap items
- **Organization Dashboard**: Displays standardization progress
- **Executive Reporting**: Standardization savings for leadership

## Example

```
═══ PLATFORM STANDARDIZATION ═══

Divergence Detected: ESLint configurations differ across 3 repositories
  api-gateway:    extends eslint-config-standard
  auth-service:   extends eslint-config-airbnb
  web-app:        custom ESLint rules (no base config)

Recommended: Create @internal/eslint-config
  Engineering savings: 60 hours/year
  Implementation effort: 8 hours
  ROI: 85

Standardization Opportunities (ranked by ROI):
  1. Shared ESLint config          ROI: 85  Effort: 8 hrs
  2. Shared TypeScript config      ROI: 80  Effort: 4 hrs
  3. CI pipeline templates         ROI: 78  Effort: 16 hrs
  4. Repository template           ROI: 72  Effort: 12 hrs
  5. Documentation templates       ROI: 68  Effort: 6 hrs
  6. Release workflow templates    ROI: 65  Effort: 10 hrs
```
