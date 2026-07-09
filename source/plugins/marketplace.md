# FinalCode Extension Marketplace Foundation

The Extension Marketplace prepares FinalCode for future community extensions. This document defines the architecture for plugin discovery, validation, and distribution. No networking or package downloads are implemented — only the architecture is prepared.

## Marketplace Architecture

```
┌─────────────────────────────────────────────────┐
│              FinalCode Core                      │
├─────────────────────────────────────────────────┤
│  Plugin SDK  │  Rule Registry  │  Policy Engine │
└─────────────────────────────────────────────────┘
         │              │               │
         ▼              ▼               ▼
┌─────────────────────────────────────────────────┐
│              Plugin Manager                      │
├─────────────────────────────────────────────────┤
│  Discovery  │  Validation  │  Activation        │
└─────────────────────────────────────────────────┘
         │              │               │
         ▼              ▼               ▼
┌─────────────────────────────────────────────────┐
│              Plugin Registry                     │
├─────────────────────────────────────────────────┤
│  Local Plugins  │  Remote Registry (Future)     │
└─────────────────────────────────────────────────┘
```

## Plugin Layout

Every published plugin must follow this layout:

```
finalcode-plugin-<name>/
├── manifest.json
├── README.md
├── LICENSE
├── source/
│   ├── rules.json
│   ├── report-sections.json
│   ├── framework.json
│   ├── recommendations.json
│   ├── validation.json
│   └── configuration.json
├── tests/
│   ├── unit/
│   └── integration/
└── CHANGELOG.md
```

## Manifest Schema

The plugin manifest must follow this schema:

```json
{
  "name": "string (required)",
  "version": "string (required, semver)",
  "description": "string (required)",
  "author": "string (required)",
  "license": "string (required)",
  "repository": "string (URL)",
  "homepage": "string (URL)",
  "bugs": "string (URL)",
  "compatibility": {
    "finalcode": "string (required, semver range)",
    "opencode": "string (semver range)"
  },
  "entry": "string (required, relative path)",
  "registers": {
    "rules": "array of file paths",
    "reportSections": "array of file paths",
    "framework": "file path",
    "recommendations": "array of file paths",
    "validation": "array of file paths",
    "configuration": "file path"
  },
  "dependencies": {
    "finalcode-plugin-<name>": "semver range"
  },
  "keywords": ["array of strings"],
  "categories": ["array of strings"]
}
```

## Registration Process

### Step 1: Create Plugin

1. Create plugin directory following layout
2. Write manifest.json
3. Write source files
4. Write tests
5. Write documentation

### Step 2: Validate Plugin

Run FinalCode self-validation:

```bash
finalcode validate-plugin ./finalcode-plugin-<name>
```

Validation checks:
- Manifest is valid JSON
- All referenced files exist
- No duplicate rule IDs
- No duplicate report section IDs
- All rules follow Rule Registry schema
- All report sections follow Report Engine schema
- All framework detection rules are valid
- Tests pass
- Documentation is complete

### Step 3: Package Plugin

Create distributable package:

```bash
finalcode package-plugin ./finalcode-plugin-<name>
```

Creates:
- `finalcode-plugin-<name>-<version>.tar.gz`
- Checksum file
- Installation manifest

### Step 4: Publish Plugin (Future)

Publish to marketplace:

```bash
finalcode publish-plugin ./finalcode-plugin-<name>-<version>.tar.gz
```

Uploads to:
- Plugin registry (database)
- Documentation site
- Version history

### Step 5: Install Plugin

Install from marketplace:

```bash
finalcode install-plugin finalcode-plugin-<name>@<version>
```

Downloads and installs:
- Plugin files to `~/.config/opencode/plugins/`
- Plugin metadata to plugin registry
- Plugin documentation to local cache

## Validation Requirements

### Code Quality

- No linting errors
- No type errors
- No security vulnerabilities
- No hardcoded secrets
- No unused dependencies

### Documentation

- README.md is complete
- Installation instructions are clear
- Usage examples are provided
- Configuration options are documented
- Troubleshooting guide is included

### Testing

- Unit tests pass
- Integration tests pass
- Coverage >= 80%
- No flaky tests
- No skipped tests

### Compatibility

- Compatible with declared FinalCode version
- Compatible with declared OpenCode version
- No conflicts with Core rules
- No conflicts with other plugins
- No breaking changes without major version bump

## Compatibility Rules

### Version Compatibility

Plugins must declare compatibility:

```json
{
  "compatibility": {
    "finalcode": ">=2.0.0",
    "opencode": ">=1.0.0"
  }
}
```

FinalCode checks compatibility before activation.

### Conflict Detection

FinalCode detects conflicts:

1. Duplicate rule IDs across plugins
2. Duplicate report sections across plugins
3. Framework detection conflicts
4. Configuration conflicts
5. Dependency conflicts

Conflicts prevent plugin activation.

### Dependency Resolution

Plugins can depend on other plugins:

```json
{
  "dependencies": {
    "finalcode-plugin-react": ">=1.0.0"
  }
}
```

FinalCode resolves dependencies before activation.

## Version Compatibility

### Semantic Versioning

Plugins follow semantic versioning:

- `MAJOR`: Breaking changes
- `MINOR`: New features, backward compatible
- `PATCH`: Bug fixes, backward compatible

### Upgrade Path

When upgrading plugins:

1. Check compatibility with current FinalCode version
2. Check for breaking changes
3. Check for configuration changes
4. Check for rule changes
5. Run validation
6. Activate updated plugin

### Rollback

If plugin fails:

1. Deactivate plugin
2. Restore previous version
3. Clear plugin cache
4. Re-run validation
5. Re-activate previous version

## Distribution

### Local Distribution

For local plugins:

1. Copy plugin to `~/.config/opencode/plugins/`
2. Register in local plugin registry
3. Activate plugin

### Remote Distribution (Future)

For remote plugins:

1. Download from marketplace
2. Verify checksum
3. Verify signature
4. Install to local plugins directory
5. Register in plugin registry
6. Activate plugin

## Security

### Checksum Verification

Every distributed plugin must have:

- SHA-256 checksum file
- GPG signature (future)
- Package integrity verification

### Sandboxing

Plugins run in sandboxed environment:

- Limited file system access
- No network access (future)
- No system command execution
- No access to other plugins

### Auditing

All plugin activities are audited:

- Plugin activation/deactivation
- Rule registration
- Report section registration
- Configuration changes
- Validation results

## Future Enhancements

### Phase 1: Local Marketplace

- Plugin discovery in local directories
- Plugin validation
- Plugin activation
- Plugin versioning

### Phase 2: Remote Registry

- Centralized plugin repository
- Plugin search and discovery
- Plugin download and installation
- Plugin versioning and updates

### Phase 3: Community Features

- Plugin ratings and reviews
- Plugin statistics
- Plugin author profiles
- Plugin collaboration tools

### Phase 4: Enterprise Features

- Private plugin repositories
- Plugin licensing
- Plugin analytics
- Plugin support
