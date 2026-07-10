# FinalCode Policy Engine

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Controls evaluation behavior through configurable policies |
| Execution Stage | INITIALIZATION, POLICY |
| Loaded By | Certification Engine |
| Dependencies | None (standalone) |
| Outputs | Active policy, blocking rules, gate configuration, severity thresholds |
| Consumers | Decision Engine, Report Engine, Certification Engine |
| Applies To | All audits |

The Policy Engine controls how FinalCode evaluates repositories. Policies define severity thresholds, blocking rules, warning thresholds, documentation requirements, security strictness, and testing expectations. Policies are configurable without editing Core logic.

## Policy Schema

Every policy must have:

| Field | Type | Required | Description |
|---|---|---|---|
| `policyId` | string | Yes | Unique identifier (e.g., `POLICY-PRODUCTION`) |
| `version` | string | Yes | Semantic version |
| `name` | string | Yes | Human-readable name |
| `description` | string | Yes | What this policy controls |
| `extends` | string | No | Parent policy ID (inheritance) |
| `blocking` | object | Yes | Blocking rules (see below) |
| `gates` | object | Yes | Enabled gates and thresholds |
| `security` | object | Yes | Security strictness settings |
| `testing` | object | Yes | Testing expectations |
| `documentation` | object | Yes | Documentation requirements |
| `severity` | object | Yes | Severity thresholds |
| `reportSections` | array | Yes | Which report sections to include |
| `minimumScore` | number | Yes | Minimum quality score for certification (0-100) |
| `status` | string | Yes | Active / Deprecated / Experimental |

## Blocking Rules

The `blocking` object defines what blocks certification:

```json
{
  "criticalFindings": true,
  "securityVulnerabilities": true,
  "missingTests": false,
  "missingDocumentation": false,
  "scoreBelowThreshold": true,
  "gateFailure": true,
  "custom": [
    {
      "condition": "finding.classification === 'Security Vulnerability' && finding.severity === 'Critical'",
      "action": "block",
      "message": "Critical security vulnerability blocks certification"
    }
  ]
}
```

## Gate Configuration

The `gates` object defines which gates are enabled and their thresholds:

```json
{
  "architecture": { "enabled": true, "weight": 10, "required": true },
  "codeQuality": { "enabled": true, "weight": 10, "required": true },
  "deadCode": { "enabled": true, "weight": 8, "required": false },
  "dependencies": { "enabled": true, "weight": 8, "required": true },
  "typeSafety": { "enabled": true, "weight": 8, "required": false },
  "errorHandling": { "enabled": true, "weight": 7, "required": false },
  "testing": { "enabled": true, "weight": 10, "required": true },
  "performance": { "enabled": true, "weight": 7, "required": false },
  "security": { "enabled": true, "weight": 10, "required": true },
  "accessibility": { "enabled": true, "weight": 6, "required": false },
  "uiConsistency": { "enabled": true, "weight": 6, "required": false },
  "documentation": { "enabled": true, "weight": 8, "required": false },
  "githubReadiness": { "enabled": true, "weight": 6, "required": false }
}
```

## Security Settings

The `security` object controls security strictness:

```json
{
  "strictMode": false,
  "blockOnCritical": true,
  "blockOnHigh": false,
  "requireEvidence": true,
  "maxVulnerabilities": 0,
  "allowedSeverityLevels": ["Critical", "High", "Medium", "Low", "Informational"],
  "securityGateVersion": "2.0"
}
```

## Testing Expectations

The `testing` object defines testing requirements:

```json
{
  "requireTests": true,
  "minimumCoverage": 60,
  "requireUnitTests": true,
  "requireIntegrationTests": false,
  "requireE2ETests": false,
  "blockOnMissingTests": false,
  "blockOnLowCoverage": false
}
```

## Documentation Requirements

The `documentation` object defines documentation expectations:

```json
{
  "requireREADME": true,
  "requireChangelog": false,
  "requireContributing": false,
  "requireAPIDocs": false,
  "requireArchitectureDocs": false,
  "minimumReadmeLength": 500,
  "requireBadges": false
}
```

## Severity Thresholds

The `severity` object controls severity handling:

```json
{
  "informational": "report",
  "low": "report",
  "medium": "report",
  "high": "warn",
  "critical": "block",
  "customThresholds": {
    "maxHigh": 5,
    "maxMedium": 10
  }
}
```

## Report Sections

The `reportSections` array controls which sections appear in the report:

```json
[
  "dashboard",
  "metadata",
  "coverage",
  "warningAnalysis",
  "releaseBlockerSummary",
  "riskMatrix",
  "gates",
  "findings",
  "security",
  "engineeringPolicy",
  "metrics",
  "confidenceModel",
  "certificationConfidence",
  "runtimeDisclosure",
  "healthScore",
  "executiveSummary",
  "evolution",
  "improvementDelta",
  "baseline",
  "decision",
  "roadmap",
  "readiness",
  "priorityMatrix",
  "releaseDecision",
  "override",
  "prAnalysis",
  "trend",
  "checklist",
  "certification"
]
```

## Built-in Policies

### Default Policy (`POLICY-DEFAULT`)

The default policy is identical to v1.9.0 behavior:

```json
{
  "policyId": "POLICY-DEFAULT",
  "name": "Default",
  "blocking": {
    "criticalFindings": true,
    "securityVulnerabilities": true,
    "missingTests": false,
    "missingDocumentation": false,
    "scoreBelowThreshold": true,
    "gateFailure": true
  },
  "minimumScore": 50
}
```

### Production Policy (`POLICY-PRODUCTION`)

Strict policy for production systems:

```json
{
  "policyId": "POLICY-PRODUCTION",
  "name": "Production",
  "extends": "POLICY-DEFAULT",
  "blocking": {
    "criticalFindings": true,
    "securityVulnerabilities": true,
    "missingTests": true,
    "missingDocumentation": true,
    "scoreBelowThreshold": true,
    "gateFailure": true
  },
  "minimumScore": 80,
  "security": { "strictMode": true, "blockOnCritical": true, "blockOnHigh": true },
  "testing": { "requireTests": true, "minimumCoverage": 80, "blockOnMissingTests": true }
}
```

### Enterprise Policy (`POLICY-ENTERPRISE`)

Enterprise-grade policy:

```json
{
  "policyId": "POLICY-ENTERPRISE",
  "name": "Enterprise",
  "extends": "POLICY-PRODUCTION",
  "documentation": { "requireREADME": true, "requireChangelog": true, "requireContributing": true, "requireArchitectureDocs": true },
  "minimumScore": 85
}
```

### Startup Policy (`POLICY-STARTUP`)

Relaxed policy for rapid development:

```json
{
  "policyId": "POLICY-STARTUP",
  "name": "Startup",
  "extends": "POLICY-DEFAULT",
  "blocking": { "criticalFindings": true, "securityVulnerabilities": true, "missingTests": false },
  "minimumScore": 40
}
```

### Open Source Policy (`POLICY-OPENSOURCE`)

Policy for open source projects:

```json
{
  "policyId": "POLICY-OPENSOURCE",
  "name": "Open Source",
  "extends": "POLICY-DEFAULT",
  "documentation": { "requireREADME": true, "requireChangelog": true, "requireContributing": true, "requireLicense": true },
  "githubReadiness": { "requireBadges": true, "requireIssueTemplates": true }
}
```

### Educational Policy (`POLICY-EDUCATIONAL`)

Policy for learning projects:

```json
{
  "policyId": "POLICY-EDUCATIONAL",
  "name": "Educational",
  "extends": "POLICY-DEFAULT",
  "blocking": { "criticalFindings": false, "securityVulnerabilities": false },
  "minimumScore": 30
}
```

### Minimal Policy (`POLICY-MINIMAL`)

Bare minimum checks:

```json
{
  "policyId": "POLICY-MINIMAL",
  "name": "Minimal",
  "gates": {
    "architecture": { "enabled": true, "required": true },
    "security": { "enabled": true, "required": true },
    "testing": { "enabled": false },
    "documentation": { "enabled": false },
    "githubReadiness": { "enabled": false }
  },
  "minimumScore": 20
}
```

### Strict Policy (`POLICY-STRICT`)

Maximum strictness:

```json
{
  "policyId": "POLICY-STRICT",
  "name": "Strict",
  "extends": "POLICY-PRODUCTION",
  "gates": {
    "architecture": { "weight": 12, "required": true },
    "codeQuality": { "weight": 12, "required": true },
    "testing": { "weight": 12, "required": true },
    "security": { "weight": 12, "required": true }
  },
  "minimumScore": 95,
  "security": { "strictMode": true, "blockOnCritical": true, "blockOnHigh": true, "blockOnMedium": true }
}
```

## Policy Inheritance

Policies can extend other policies. When extending:

1. Load parent policy
2. Apply child overrides
3. Merge arrays (child overrides parent)
4. Deep merge objects (child overrides parent keys)

Example: `POLICY-PRODUCTION` extends `POLICY-DEFAULT` and overrides `blocking` and `minimumScore`.

## Policy Selection

The active policy is selected by:

1. Explicit configuration (`policy: "POLICY-PRODUCTION"`)
2. Project profile (some profiles set a default policy)
3. Command-line flag (`--policy POLICY-ENTERPRISE`)
4. Default (`POLICY-DEFAULT`)

## Validation

The Policy Engine validates policies before execution:

1. No duplicate `policyId` values
2. All `extends` references point to valid policies
3. No circular inheritance
4. All `gates` references are valid Quality Gate names
5. `minimumScore` is between 0 and 100
6. `blocking` actions are valid (`block`, `warn`, `report`)

If validation fails, execution must stop with an error identifying the invalid policy.

## Architecture Explainability

### Responsibilities

- Load and validate policies
- Apply policy inheritance
- Provide blocking rules
- Provide gate configuration
- Provide severity thresholds

### Non-Responsibilities

- Classifying findings (Decision Engine)
- Generating the report (Report Engine)
- Determining certification status (Certification Engine)
- Storing rules (Rule Registry)
- Calculating Health Score (Health Score Engine)

### Owned Decisions

- Policy selection
- Policy inheritance merging
- Policy validation
- Blocking rule application

### Consumed Decisions

- Configuration (from Configuration System)
- Profile selection (from Framework Profiles)

### Produced Decisions

- Active policy
- Blocking rules
- Gate configuration
- Severity thresholds

## Repository Discoverability

### Related Documents

- `core/certification-engine.md` — uses policy for certification
- `core/decision-engine.md` — uses blocking rules for decisions
- `references/configuration.md` — provides configuration schema
- `plugins/profiles.md` — may set default policy

### Used By

- Certification Engine (for policy evaluation)
- Decision Engine (for blocking rules)
- Report Engine (for policy display)

### Depends On

- Configuration System (for policy selection)
- Framework Profiles (for profile-based policy)
