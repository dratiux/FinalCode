# FinalCode Rule Registry

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Centralized source of truth for all engineering rules |
| Execution Stage | INITIALIZATION, ANALYSIS |
| Loaded By | Certification Engine, Decision Engine |
| Dependencies | None (standalone) |
| Outputs | Active rules, rule lookup, rule validation |
| Consumers | Decision Engine, Plugin SDK, Framework Profiles |
| Applies To | All audits |

The Rule Registry is the centralized source of truth for all engineering rules. Every rule must be registered here. No duplicated rule definitions are allowed.

## Rule Schema

Every rule must have:

| Field | Type | Required | Description |
|---|---|---|---|
| `ruleId` | string | Yes | Unique identifier (e.g., `RULE-SEC-001`) |
| `version` | string | Yes | Semantic version (e.g., `1.0.0`) |
| `owner` | string | Yes | Who maintains this rule (`core`, `plugin:<name>`, `community:<name>`) |
| `description` | string | Yes | What this rule checks |
| `gate` | string | Yes | Which Quality Gate this rule belongs to |
| `severity` | string | Yes | Default severity (Critical / High / Medium / Low / Informational) |
| `classification` | string | Yes | Default classification (Confirmed Defect / Security Vulnerability / Engineering Recommendation) |
| `detection` | object | Yes | How this rule is detected (see Detection Method) |
| `frameworks` | array | Yes | Applicable frameworks (empty = all frameworks) |
| `references` | array | Yes | Links to documentation, CVEs, standards |
| `status` | string | Yes | Active / Deprecated / Experimental |
| `introduced` | string | Yes | Version when introduced |
| `modified` | string | No | Version when last modified |
| `deprecated` | string | No | Version when deprecated |
| `replacement` | string | No | Rule ID that replaces this rule when deprecated |

## Detection Method

The `detection` object specifies how the rule is checked:

```json
{
  "type": "static-analysis | runtime | manual | hybrid",
  "tool": "eslint | typescript | custom | none",
  "pattern": "regex or AST pattern",
  "filePattern": "glob pattern for files to check",
  "severity": "override severity for this detection"
}
```

## Rule Registry Format

The Rule Registry is a JSON file at `skills/finalcode/core/rule-registry.json`:

```json
{
  "version": "2.0.0",
  "lastUpdated": "2026-07-09",
  "rules": [
    {
      "ruleId": "RULE-SEC-001",
      "version": "1.0.0",
      "owner": "core",
      "description": "No hardcoded secrets in source code",
      "gate": "Security",
      "severity": "Critical",
      "classification": "Security Vulnerability",
      "detection": {
        "type": "static-analysis",
        "tool": "custom",
        "pattern": "(api[_-]?key|secret|password|token)\\s*=\\s*['\"][^'"]+['\"]",
        "filePattern": "**/*.{ts,tsx,js,jsx}",
        "severity": "Critical"
      },
      "frameworks": [],
      "references": [
        "OWASP-S1",
        "CWE-798"
      ],
      "status": "Active",
      "introduced": "1.0.0"
    }
  ]
}
```

## Rule Lifecycle

### Active Rules

Active rules are checked during every audit. They have `status: "Active"`.

### Deprecated Rules

Deprecated rules are still checked but generate a warning. They have:
- `status: "Deprecated"`
- `deprecated: "2.0.0"`
- `replacement: "RULE-NEW-001"` (optional)

### Experimental Rules

Experimental rules are opt-in. They have `status: "Experimental"` and only run when explicitly enabled in configuration.

## Framework-Specific Rules

Rules can be scoped to specific frameworks:

```json
{
  "ruleId": "RULE-REACT-001",
  "frameworks": ["react", "next.js"],
  "description": "React hooks must follow Rules of Hooks"
}
```

When a framework is detected, its rules are automatically enabled. When a framework is not detected, its rules are skipped.

## Plugin Rules

Plugins can register rules with `owner: "plugin:<name>"`. Plugin rules follow the same schema but are validated against the Plugin SDK constraints:

- Plugin rules cannot override Core rules
- Plugin rules cannot change severity of Core rules
- Plugin rules must have unique `ruleId` values
- Plugin rules must be additive only

## Rule Lookup

When checking a finding against rules:

1. Look up `ruleId` in the Registry
2. Check `status` — skip if Deprecated or Experimental (unless enabled)
3. Check `frameworks` — skip if rule doesn't apply to detected frameworks
4. Apply `detection` method
5. Use `severity` and `classification` as defaults (may be overridden by findings)

## Validation

The Rule Registry must be validated before execution:

1. No duplicate `ruleId` values
2. All `gate` values reference valid Quality Gates
3. All `frameworks` values reference valid framework names
4. All `replacement` values reference existing rules
5. All `deprecated` rules have a `replacement` or explicit justification
6. No circular references

If validation fails, execution must stop with an error message identifying the invalid rule.

## Architecture Explainability

### Responsibilities

- Store all engineering rules
- Provide rule lookup
- Validate rule schemas
- Manage rule lifecycle (Active/Deprecated/Experimental)
- Support framework-specific rules

### Non-Responsibilities

- Classifying findings (Decision Engine)
- Generating the report (Report Engine)
- Determining certification status (Certification Engine)
- Loading policies (Policy Engine)
- Calculating Health Score (Health Score Engine)

### Owned Decisions

- Rule storage
- Rule lookup
- Rule validation
- Rule lifecycle management

### Consumed Decisions

- Framework detection (from Framework Profiles)
- Plugin rules (from Plugin SDK)

### Produced Decisions

- Active rules
- Rule lookup results
- Rule validation results

## Repository Discoverability

### Related Documents

- `core/decision-engine.md` — uses rules for decision making
- `core/certification-engine.md` — loads rules during initialization
- `plugins/sdk.md` — registers plugin rules
- `plugins/profiles.md` — provides framework-specific rules
- `references/gates.md` — defines gate criteria
- `references/security-gate.md` — defines security rules

### Used By

- Decision Engine (for rule matching)
- Certification Engine (for rule loading)
- Plugin SDK (for plugin rule registration)
- Framework Profiles (for framework rules)

### Depends On

- None (standalone)
