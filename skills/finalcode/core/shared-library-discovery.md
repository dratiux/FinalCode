# Shared Library Discovery

## Purpose

Detect duplicated code and reusable components across repositories. Identify candidates for shared packages, utilities, UI systems, design tokens, SDKs, and infrastructure to reduce duplication and improve consistency.

## Responsibilities

- Scan multiple repositories for duplicated code patterns
- Detect reusable components and utilities
- Recommend extraction candidates for shared packages
- Estimate engineering savings from sharing
- Prioritize extraction by ROI
- Track extraction progress over time

## Inputs

- List of repositories from Organization Registry
- Code content from repository analysis
- Dependency information from dependency analysis
- Import/export statements
- Configuration and build files
- Repository Relationship Engine data

## Outputs

- Duplicate code report across repositories
- Shared library candidate list with priority
- Engineering savings estimates per candidate
- Extraction plan with dependencies
- Sharing opportunity heatmap

## Detection Categories

### Shared Packages

Code that should be extracted into a shared package:

- Duplicate utility functions (string formatting, date handling, validation)
- Duplicate helper classes (database access, caching, logging)
- Duplicate middleware (authentication, rate limiting, error handling)
- Duplicate configuration loading patterns

### Shared Utilities

Code that should become a shared utility library:

- Duplicate math or calculation functions
- Duplicate data transformation logic
- Duplicate file handling patterns
- Duplicate network utilities

### Shared UI Systems

UI components that should be consolidated:

- Duplicate button, form, or input components
- Duplicate layout components
- Duplicate page templates
- Duplicate theme or style definitions

### Shared Design Tokens

Design tokens that should be shared:

- Duplicate color definitions
- Duplicate spacing values
- Duplicate typography settings
- Duplicate breakpoint definitions

### Shared SDKs

Client libraries that should be consolidated:

- Duplicate API client implementations
- Duplicate authentication helpers
- Duplicate data fetching patterns
- Duplicate error handling for external services

### Shared Infrastructure

Infrastructure code that should be shared:

- Duplicate CI/CD pipeline definitions
- Duplicate Docker configurations
- Duplicate deployment scripts
- Duplicate monitoring configurations

## Candidate Record Schema

| Field | Type | Description |
|---|---|---|
| candidate_id | string | Unique identifier |
| category | string | Package, Utility, UI, Token, SDK, Infrastructure |
| source_repositories | array | Repositories where duplication was found |
| estimated_lines | number | Total duplicated lines of code |
| estimated_savings | string | Engineering hours saved per year |
| extraction_effort | string | Effort to extract (hours) |
| priority | string | P0, P1, P2, P3 |
| roi_score | number | ROI score (0-100) |
| dependencies | array | Other candidates this depends on |
| status | string | Identified, In Progress, Extracted, Deferred |

## Execution Flow

```
Collect code from all registered repositories
        |
        v
Run duplication detection across repositories
        |
        v
Group duplicated code by category
        |
        v
Filter out intentional duplication (different purposes)
        |
        v
Calculate engineering savings for each candidate
        |
        v
Rank candidates by ROI
        |
        v
Generate extraction recommendations
```

## Graceful Degradation

When only one repository exists:

- Duplicate detection runs within the single repository (intra-repo duplication)
- Cross-repository candidates are not generated
- Report indicates "Single repository mode — cross-repo duplication not applicable"

## Integration Points

- **Organization Registry**: Source repository list
- **Multi-Repository Analysis**: Provides cross-repo code access
- **Repository Relationship Engine**: Validates relationship context for sharing
- **Organization Roadmap**: Includes extraction as roadmap items
- **Platform Standardization**: Coordinates with standardization recommendations
- **Organization Dashboard**: Displays duplication metrics

## Examples

### Shared Library Recommendation

```
Candidate: Shared validation middleware
Category: Shared Package
Found in: api-gateway, auth-service, data-service
Duplicated lines: 340
Estimated savings: 120 hours/year
Extraction effort: 16 hours
ROI: 88
Priority: P1

Recommendation: Extract common validation patterns into
@internal/validation-middleware package.
```

### Duplicate Report Summary

```
Repository Pairs with Duplication:
  api-gateway ↔ auth-service  — 3 duplicated utilities (240 lines)
  auth-service ↔ data-service — 1 duplicated helper (85 lines)
  all three repositories      — 1 duplicated config (120 lines)

Total duplication: 445 lines across 3 repositories
Estimated savings from extraction: 180 hours/year
```
