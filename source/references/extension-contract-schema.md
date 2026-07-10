# Extension Contract Schema

Defines the standard contract for every FinalCode extension point. Plugins should become contract-driven rather than convention-driven.

## Standard Extension Contract Block

Every extension point must define:

```markdown
## Extension Contract

### Extension Name

<unique identifier for this extension point>

### Execution Stage

<when this extension is consulted during an audit>

### Available Context

<what information is available to the extension>

### Accessible Data

<what data the extension can read>

### Allowed Operations

<what the extension can do>

### Forbidden Operations

<what the extension cannot do>

### Expected Outputs

<what the extension must produce>

### Failure Handling

<what happens when the extension fails>

### Version Compatibility

<which FinalCode versions this extension supports>
```

## Extension Points

### Rule Registration

```markdown
## Extension Contract: Rule Registration

### Extension Name
rule-registration

### Execution Stage
ANALYSIS

### Available Context
- Detected frameworks
- Active policy
- Project configuration

### Accessible Data
- Rule Registry (read-only)
- Framework Profiles (read-only)

### Allowed Operations
- Register new rules with owner "plugin:<name>"
- Define detection methods
- Specify severity and classification defaults
- Declare framework applicability

### Forbidden Operations
- Override Core rules (owner: "core")
- Change severity of Core rules
- Remove existing rules
- Modify rule lookup logic

### Expected Outputs
- rules.json with valid rule schema
- Unique ruleId values
- Valid detection methods

### Failure Handling
- Invalid rules → skip invalid rules, log warning
- Duplicate ruleId → reject plugin, log error
- Invalid detection method → skip rule, log warning

### Version Compatibility
- FinalCode >=2.0.0
```

### Report Section Registration

```markdown
## Extension Contract: Report Section Registration

### Extension Name
report-section-registration

### Execution Stage
REPORT

### Available Context
- Findings from Decision Engine
- Health Score from Health Score Engine
- Confidence metrics from Confidence Model

### Accessible Data
- Report Engine section registry (read-only)
- Finding data (read-only)

### Allowed Operations
- Register new report sections with order >= 100
- Define section templates
- Specify framework requirements

### Forbidden Operations
- Replace Core sections (order 1-55)
- Modify Core section ordering
- Change Core section formatting

### Expected Outputs
- report-sections.json with valid section schema
- Unique sectionId values
- Valid order values (>= 100)

### Failure Handling
- Invalid sections → skip invalid sections, log warning
- Duplicate sectionId → reject section, log error
- Invalid order → reject section, log warning

### Version Compatibility
- FinalCode >=2.0.0
```

### Framework Registration

```markdown
## Extension Contract: Framework Registration

### Extension Name
framework-registration

### Execution Stage
DETECTION

### Available Context
- Project files and structure
- Package dependencies
- Configuration files

### Accessible Data
- Framework Profiles (read-only)

### Allowed Operations
- Define framework detection rules
- Specify framework-specific rules
- Document best practices and common issues

### Forbidden Operations
- Override Core framework detection
- Modify existing framework profiles
- Change detection logic

### Expected Outputs
- framework.json with valid framework schema
- Detection rules that work reliably
- Framework-specific rules

### Failure Handling
- Invalid framework → skip framework, log warning
- Detection failure → skip framework detection, log warning
- Rule conflict → skip conflicting rules, log warning

### Version Compatibility
- FinalCode >=2.0.0
```

### Recommendation Registration

```markdown
## Extension Contract: Recommendation Registration

### Extension Name
recommendation-registration

### Execution Stage
DECISION

### Available Context
- Findings from Decision Engine
- Framework-specific rules
- Best practices

### Accessible Data
- Finding data (read-only)
- Framework profiles (read-only)

### Allowed Operations
- Register recommendations with applicableWhen conditions
- Specify priority levels
- Declare framework applicability

### Forbidden Operations
- Override Core recommendations
- Change recommendation priority logic
- Modify existing recommendations

### Expected Outputs
- recommendations.json with valid recommendation schema
- Unique recommendation IDs
- Valid priority levels

### Failure Handling
- Invalid recommendations → skip invalid recommendations, log warning
- Duplicate recommendation ID → reject recommendation, log error
- Invalid priority → reject recommendation, log warning

### Version Compatibility
- FinalCode >=2.0.0
```

### Validation Registration

```markdown
## Extension Contract: Validation Registration

### Extension Name
validation-registration

### Execution Stage
VALIDATION

### Available Context
- Project configuration
- Framework detection results
- Plugin configuration

### Accessible Data
- Configuration (read-only)
- Framework detection (read-only)

### Allowed Operations
- Register validation steps with commands
- Specify required/optional status
- Declare framework applicability

### Forbidden Operations
- Override Core validation steps
- Change validation logic
- Modify existing validation steps

### Expected Outputs
- validation.json with valid validation schema
- Unique stepId values
- Valid commands

### Failure Handling
- Invalid validation → skip validation step, log warning
- Command failure → skip validation, log warning
- Framework mismatch → skip validation, log warning

### Version Compatibility
- FinalCode >=2.0.0
```

### Configuration Registration

```markdown
## Extension Contract: Configuration Registration

### Extension Name
configuration-registration

### Execution Stage
INITIALIZATION

### Available Context
- Project configuration
- Default configuration values

### Accessible Data
- Configuration (read-only)

### Allowed Operations
- Register configuration options with types and defaults
- Specify option descriptions
- Declare valid values

### Forbidden Operations
- Override Core configuration options
- Change configuration validation logic
- Modify existing configuration options

### Expected Outputs
- configuration.json with valid configuration schema
- Unique option keys
- Valid types and defaults

### Failure Handling
- Invalid configuration → skip configuration, log warning
- Duplicate option key → reject option, log error
- Invalid type → reject option, log warning

### Version Compatibility
- FinalCode >=2.0.0
```
