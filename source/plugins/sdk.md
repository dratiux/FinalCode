# FinalCode Plugin SDK

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Defines the contract for extending FinalCode via plugins |
| Execution Stage | INITIALIZATION, PLUGIN |
| Loaded By | Certification Engine |
| Dependencies | Rule Registry, Report Engine |
| Outputs | Plugin manifest, registration points, lifecycle hooks |
| Consumers | Plugin developers, Certification Engine |
| Applies To | Plugin extensions |

The Plugin SDK defines how plugins register with FinalCode. Plugins extend FinalCode without modifying Core logic. Every plugin must follow the registration process documented here.

## Plugin Manifest

Every plugin must have a `manifest.json`:

```json
{
  "name": "finalcode-react",
  "version": "1.0.0",
  "description": "React framework support for FinalCode",
  "author": "FinalCode Team",
  "license": "MIT",
  "repository": "https://github.com/dratiux/finalcode-react",
  "compatibility": {
    "finalcode": ">=2.0.0",
    "opencode": ">=1.0.0"
  },
  "entry": "index.md",
  "registers": {
    "rules": ["source/rules.json"],
    "reportSections": ["source/report-sections.json"],
    "framework": "source/framework.json",
    "recommendations": ["source/recommendations.json"],
    "validation": ["source/validation.json"],
    "configuration": ["source/configuration.json"]
  }
}
```

## Registration Points

### Rule Registration

Plugins register rules via `rules.json`:

```json
{
  "rules": [
    {
      "ruleId": "RULE-REACT-001",
      "version": "1.0.0",
      "owner": "plugin:finalcode-react",
      "description": "React hooks must follow Rules of Hooks",
      "gate": "Code Quality",
      "severity": "High",
      "classification": "Confirmed Defect",
      "detection": {
        "type": "static-analysis",
        "tool": "eslint",
        "pattern": "react-hooks/rules-of-hooks",
        "filePattern": "**/*.{tsx,jsx}",
        "severity": "High"
      },
      "frameworks": ["react", "next.js"],
      "references": ["https://reactjs.org/docs/hooks-rules.html"],
      "status": "Active",
      "introduced": "1.0.0"
    }
  ]
}
```

**Constraints:**
- `owner` must be `plugin:<plugin-name>`
- `ruleId` must be unique across all plugins
- Cannot override Core rules (`owner: "core"`)
- Cannot change severity of Core rules
- Must be additive only

### Report Section Registration

Plugins register report sections via `report-sections.json`:

```json
{
  "sections": [
    {
      "sectionId": "react-performance",
      "title": "React Performance Analysis",
      "description": "Performance analysis specific to React applications",
      "order": 15,
      "requiresFramework": "react",
      "template": "react-performance-template.md"
    }
  ]
}
```

**Constraints:**
- `order` must be >= 100 (Core sections use 1-37)
- Cannot replace Core sections
- Must have `requiresFramework` to avoid showing in non-React projects

### Framework Registration

Plugins register framework support via `framework.json`:

```json
{
  "framework": {
    "id": "react",
    "name": "React",
    "version": ">=17.0.0",
    "detection": {
      "files": ["package.json"],
      "dependencies": ["react", "react-dom"],
      "configFiles": ["next.config.js", "vite.config.ts", "craco.config.js"]
    },
    "bestPractices": [
      "Use functional components with hooks",
      "Avoid inline styles for performance",
      "Use React.memo for expensive components",
      "Follow Rules of Hooks"
    ],
    "commonIssues": [
      "Missing dependency arrays in useEffect",
      "Stale closures in event handlers",
      "Unnecessary re-renders"
    ],
    "documentation": "https://reactjs.org"
  }
}
```

### Recommendation Registration

Plugins register recommendations via `recommendations.json`:

```json
{
  "recommendations": [
    {
      "id": "REC-REACT-001",
      "title": "Use React.memo for Expensive Components",
      "description": "Wrap expensive components with React.memo to prevent unnecessary re-renders",
      "applicableWhen": "component renders frequently with same props",
      "priority": "medium",
      "frameworks": ["react"]
    }
  ]
}
```

### Validation Registration

Plugins register validation steps via `validation.json`:

```json
{
  "validation": [
    {
      "stepId": "validate-react-hooks",
      "description": "Validate React hooks usage",
      "command": "npx eslint --plugin react-hooks .",
      "required": false,
      "frameworks": ["react"]
    }
  ]
}
```

### Configuration Registration

Plugins register configuration options via `configuration.json`:

```json
{
  "configuration": {
    "options": [
      {
        "key": "react.strictMode",
        "type": "boolean",
        "default": true,
        "description": "Enable React Strict Mode checks"
      },
      {
        "key": "react.testingLibrary",
        "type": "boolean",
        "default": true,
        "description": "Check for React Testing Library usage"
      }
    ],
    "defaults": {
      "react.strictMode": true,
      "react.testingLibrary": true
    }
  }
}
```

## Plugin Lifecycle

### 1. Discovery

FinalCode scans for plugins in:
- `~/.config/opencode/plugins/`
- `.opencode/plugins/` (project-local)
- `node_modules/finalcode-plugin-*` (npm packages)

### 2. Validation

Before activation, validate:
- `manifest.json` is valid
- All referenced files exist
- No duplicate rule IDs
- No duplicate report section IDs
- Compatibility with current FinalCode version

### 3. Registration

Validated plugins register their contributions:
- Rules added to Rule Registry (with `owner: "plugin:<name>"`)
- Report sections added to Report Engine
- Framework support added to detection system
- Recommendations added to recommendation engine
- Validation steps added to validation pipeline
- Configuration options added to Configuration System

### 4. Activation

Plugins are activated when:
- Their framework is detected in the project
- They are explicitly enabled in configuration
- They are required by a certification profile

### 5. Execution

During audit execution:
- Plugin rules are checked alongside Core rules
- Plugin report sections are generated when applicable
- Plugin validation steps are executed when applicable
- Plugin recommendations are included in output

### 6. Deactivation

Plugins are deactivated when:
- Their framework is not detected
- They are explicitly disabled in configuration
- They fail validation
- They are incompatible with current FinalCode version

## Plugin Constraints

### Additive Only

Plugins can only add new functionality. They cannot:
- Remove Core rules
- Modify Core behavior
- Override Core report sections
- Change Core certification logic
- Modify Core Health Score formula

### Isolation

Plugins are isolated from each other:
- Plugin A cannot depend on Plugin B
- Plugin A cannot modify Plugin B's rules
- Plugin failures do not affect other plugins
- Plugin A cannot access Plugin B's configuration

### Versioning

Plugins follow semantic versioning:
- `MAJOR`: Breaking changes in plugin interface
- `MINOR`: New features, backward compatible
- `PATCH`: Bug fixes, backward compatible

### Compatibility

Plugins declare compatibility:
```json
{
  "compatibility": {
    "finalcode": ">=2.0.0",
    "opencode": ">=1.0.0"
  }
}
```

FinalCode refuses to activate plugins with incompatible version declarations.

## Extension Contracts

Every extension point must define a formal contract. See `references/extension-contract-schema.md` for the complete contract schema.

### Contract Requirements

Each extension contract must specify:
- **Extension Name:** unique identifier
- **Execution Stage:** when the extension is consulted
- **Available Context:** what information is available
- **Accessible Data:** what data can be read
- **Allowed Operations:** what the extension can do
- **Forbidden Operations:** what the extension cannot do
- **Expected Outputs:** what the extension must produce
- **Failure Handling:** what happens when the extension fails
- **Version Compatibility:** which FinalCode versions are supported

### Contract Enforcement

FinalCode enforces contracts:
- Contracts are validated before plugin activation
- Contract violations result in plugin rejection
- Contract errors are logged with specific details
- Contract compatibility is checked across versions

## Plugin Testing

Plugins should be tested:
- Unit tests for detection logic
- Integration tests with FinalCode
- Compatibility tests with target frameworks
- Regression tests against Core behavior

## Error Handling

Plugin failures are handled gracefully:
- Invalid manifest → skip plugin, log warning
- Invalid rules → skip invalid rules, log warning
- Invalid report sections → skip invalid sections, log warning
- Framework detection failure → skip framework detection, log warning
- Validation failure → skip validation step, log warning

Plugin failures never block Core execution.
