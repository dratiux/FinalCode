# Multi-Repository Analysis

## Purpose

Analyze multiple repositories together to detect cross-repository findings, shared risks, duplicate implementations, common architectural patterns, shared technical debt, and organization-wide quality trends.

## Responsibilities

- Accept a set of repositories for simultaneous analysis
- Execute individual repository analysis for each member
- Aggregate findings across repositories into cross-repository findings
- Detect patterns that span multiple repositories
- Identify shared risks and organization-wide issues
- Calculate organization-level quality metrics

## Inputs

- List of repository identifiers from Organization Registry
- Per-repository analysis results from certification pipeline
- Repository relationship data from Repository Relationship Engine
- Organization Registry records

## Outputs

- Cross-repository findings
- Shared risk assessment
- Duplicate implementation report
- Common architectural pattern analysis
- Shared technical debt inventory
- Organization-wide quality score
- Per-repository comparison matrix

## Execution Flow

```
Receive repository list
        |
        v
Query Organization Registry for all repositories
        |
        v
For each repository:
    ├── Run single-repository certification pipeline
    └── Collect results
        |
        v
Aggregate individual results
        |
        v
Detect cross-repository patterns:
    ├── Duplicate code across repos
    ├── Shared dependencies
    ├── Common architecture patterns
    ├── Consistent security gaps
    └── Shared technical debt categories
        |
        v
Calculate organization-wide quality metrics
        |
        v
Generate cross-repository findings
```

## Cross-Repository Finding Categories

### Shared Risks

Risks that affect multiple repositories simultaneously:

- Shared vulnerable dependency across repositories
- Common security misconfiguration pattern
- Consistent testing gaps across the organization
- Widespread documentation deficiencies

### Duplicate Implementations

Detected when similar functionality exists in multiple repositories:

- Duplicate utility functions or classes
- Reimplemented authentication or authorization logic
- Copied API client libraries
- Repeated configuration patterns

### Common Architectural Patterns

Patterns that appear consistently across repositories:

- Similar module organization
- Common error handling approaches
- Uniform testing strategies
- Shared deployment patterns

### Shared Technical Debt

Technical debt categories that appear across multiple repositories:

- Widespread type safety gaps
- Consistent error handling gaps
- Common performance anti-patterns
- Uniform documentation debt

## Organization-Wide Quality Score

The organization-wide quality score is calculated as:

```
Org Quality Score = Σ(repository_health × repository_weight) / Σ(repository_weights)
```

Where repository weight is determined by:
- Repository criticality (production services weighted higher)
- Repository size (larger repos weighted higher)
- Number of dependencies (more depended-upon repos weighted higher)

## Graceful Degradation

When only one repository is registered in the Organization Registry:

- Multi-repository analysis returns "Single repository mode — insufficient data for cross-repository analysis"
- Cross-repository findings are not generated
- Organization-wide quality score equals the single repository's health score
- All organization features indicate single-repository mode

## Integration Points

- **Organization Registry**: Provides repository list and metadata
- **Repository Relationship Engine**: Provides relationship data for pattern detection
- **Shared Library Discovery**: Uses cross-repository analysis to detect candidates
- **Engineering Organization Dashboard**: Consumes aggregated quality metrics
- **Organization Roadmap**: Uses findings for priority planning
- **Organization Benchmark**: Uses comparison data for rankings

## Examples

### Cross-Repository Finding

```
Repository A: Missing input validation on /api/users
Repository B: Missing input validation on /api/auth
Repository C: Missing input validation on /api/data

Cross-Repository Finding: 3 repositories share missing input validation
Shared Risk: API security gap across the organization
Recommended Action: Create shared input validation middleware
```

### Organization Quality Score

```
Repository          Health   Weight   Contribution
──────────────────────────────────────────────────
FinalCode-core      96       1.0      96.0
FinalCode-plugins   88       0.7      61.6
FinalCode-docs      92       0.5      46.0
──────────────────────────────────────────────────
Organization Score  92.3
```
