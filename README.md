<p align="center">
  <img src="assets/finalcode-logo.svg" alt="FinalCode" width="468">
</p>

**OpenCode Edition v2.7.0**

FinalCode is a production certification system for OpenCode projects. It runs a senior-engineering audit across 13 quality gates and produces a standardized Certification Report with a clear verdict: READY TO SHIP, READY WITH WARNINGS, or NOT READY.

## Project Status

FinalCode is an independent open-source project created and maintained by Dratiux. It is not affiliated with, endorsed by, or maintained by the OpenCode project or its contributors.

## Table of Contents

- [Quick Start](#quick-start)
- [Installation](#installation)
- [Workflow](#workflow)
- [Quality Gates](#quality-gates)
- [Certification Verdict](#certification-verdict)
- [Architecture](#architecture)
- [Configuration](#configuration)
- [Requirements](#requirements)
- [Examples](#examples)
- [Engineering Documentation](#engineering-documentation)
- [Contributing](#contributing)
- [Security](#security)
- [Support](#support)
- [License](#license)

## Quick Start

```bash
git clone https://github.com/dratiux/FinalCode.git
cd FinalCode
bash scripts/install.sh
```

Then run FinalCode from your OpenCode session:

```
Run FinalCode
```

Or use the slash command:

```
/finalcode inspect
```

## Installation

### From Source (Recommended)

Clone the repository and run the install script:

**Linux/macOS:**

```bash
git clone https://github.com/dratiux/FinalCode.git
cd FinalCode
bash scripts/install.sh
```

**Windows (PowerShell):**

```powershell
git clone https://github.com/dratiux/FinalCode.git
cd FinalCode
pwsh scripts/install.ps1
```

The install script copies `source/SKILL.md`, `source/core/`, `source/plugins/`, and `source/references/` into `.opencode/skills/finalcode/` where OpenCode discovers them.

### Updating

After pulling changes, re-run the installation script to sync the installed skill.

## Workflow

FinalCode operates in four modes:

| Mode | Modifies Files | Use Case |
|------|----------------|----------|
| **Inspect** | No | Audit the repository and produce a report |
| **Repair** | Yes | Apply verified fixes, then re-inspect |
| **Refactor** | Yes | Improve maintainability without behavior change |
| **Certify** | No | Final sign-off before release |

### Commands

```
Run FinalCode                          # Inspect mode
Run FinalCode in Repair Mode           # Repair mode
Run FinalCode in Refactor Mode         # Refactor mode
Run FinalCode in Certify Mode          # Certify mode
```

### Slash Commands

```
/finalcode inspect
/finalcode repair
/finalcode refactor
/finalcode certify
```

## Quality Gates

FinalCode evaluates repositories across 13 quality gates:

| Gate | Scope |
|------|-------|
| Architecture | Project structure, module organization, dependency management |
| Code Quality | Complexity, duplication, naming conventions |
| Dead Code | Unused files, exports, variables, functions |
| Dependencies | Outdated packages, security vulnerabilities, license compliance |
| Type Safety | TypeScript strictness, type annotations, type errors |
| Error Handling | Try-catch blocks, error propagation, error recovery |
| Testing | Unit tests, integration tests, E2E tests, coverage |
| Performance | Bundle size, load times, memory usage |
| Security | 14-category security analysis (Security Gate 2.0) |
| Accessibility | WCAG compliance, screen reader support, keyboard navigation |
| UI Consistency | Design system compliance, component consistency |
| Documentation | README, API docs, inline comments, changelog |
| GitHub Readiness | Issue templates, PR templates, CI/CD, badges |

Detailed checklists: [source/references/gates.md](source/references/gates.md) and [source/references/security-gate.md](source/references/security-gate.md).

## Certification Verdict

| Verdict | Exit Code | Meaning |
|---------|-----------|---------|
| READY TO SHIP | 0 | All mandatory gates PASS |
| READY WITH WARNINGS | 1 | Mandatory gates PASS but warnings exist |
| NOT READY | 2 | One or more mandatory gates FAIL |
| NO PROJECT FOUND | 3 | No valid project detected |

## Architecture

FinalCode uses a Single Source of Truth (SSOT) architecture. All editable files live in `source/`. The install script generates `.opencode/skills/finalcode/` from these sources.

```
source/
├── SKILL.md                     # Skill specification
├── core/                        # Core engine layer
│   ├── decision-engine.md       # Decision pipeline and rule matching
│   ├── policy-engine.md         # Policy engine and built-in policies
│   ├── rule-registry.md         # Rule registry and lifecycle
│   ├── report-engine.md         # Report engine and section definitions
│   └── certification-engine.md  # Certification pipeline and validation
├── plugins/                     # Plugin layer
│   ├── sdk.md                   # Plugin SDK and registration
│   ├── profiles.md              # Framework profiles (14 frameworks)
│   └── marketplace.md           # Extension marketplace foundation
└── references/                  # Reference documentation
    ├── examples.md              # Worked example reports
    ├── gates.md                 # Quality gate checklists
    ├── security-gate.md         # Security gate checklist
    ├── configuration.md         # Configuration schema
    ├── plugins.md               # Plugin architecture
    ├── health-score.md          # Health score formula
    ├── confidence-model.md      # Confidence model 2.0
    ├── finding-classification.md # Finding classification
    ├── explainability.md        # Explainability engine
    ├── release-engine.md        # Release blocker engine
    └── architecture.md          # System architecture
```

**Rule:** Never edit files in `.opencode/skills/finalcode/`. Always edit `source/` files.

## Configuration

FinalCode can be configured without editing the skill. Place a `finalcode.config.json` at the repository root or `.finalcode/config.json`. See [source/references/configuration.md](source/references/configuration.md) for the schema.

### Built-in Policies

| Policy | Use Case |
|--------|----------|
| POLICY-DEFAULT | Default behavior |
| POLICY-PRODUCTION | Production systems |
| POLICY-ENTERPRISE | Enterprise environments |
| POLICY-STARTUP | Rapid development |
| POLICY-OPENSOURCE | Open source projects |
| POLICY-EDUCATIONAL | Learning projects |
| POLICY-MINIMAL | Minimum checks |
| POLICY-STRICT | Maximum strictness |

### Policy Selection

1. Explicit configuration (`policy: "POLICY-PRODUCTION"`)
2. Project profile default
3. Command-line flag (`--policy POLICY-ENTERPRISE`)
4. Default (`POLICY-DEFAULT`)

## Requirements

| Requirement | Minimum |
|-------------|---------|
| OpenCode | Latest Stable |
| Git | 2.0+ |
| Node.js | 18+ |
| npm | 9+ |

## Examples

### Clean Repository

```
Certification: READY TO SHIP
Exit Code: 0
Health Score: 94 / 100
Grade: A+
```

### Repository with Issues

```
Certification: NOT READY
Exit Code: 2
Health Score: 67 / 100
Grade: C+
Blocking Issues: 3
```

Full examples: [source/references/examples.md](source/references/examples.md).

## Engineering Documentation

FinalCode generates persistent documentation inside `.finalcode/`:

| Document | Purpose |
|----------|---------|
| `reports/<timestamp>-<mode>.md` | Immutable execution reports |
| `CHANGE_REPORT.md` | Engineering change log |
| `REFACTOR_REPORT.md` | Refactoring history |
| `FINALCODE_SUMMARY.md` | Executive summary |
| `CERTIFICATION_HISTORY.md` | Certification log |
| `TREND.md` | Historical trend analysis |
| `BASELINE.md` | First-execution baseline |

Reports are immutable. New executions create new timestamped files.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## Security

See [SECURITY.md](SECURITY.md).

## Support

- [GitHub Issues](https://github.com/dratiux/FinalCode/issues)
- [GitHub Discussions](https://github.com/dratiux/FinalCode/discussions)
- dratiux@gmail.com

See [SUPPORT.md](SUPPORT.md) for troubleshooting.

## License

MIT License. See [LICENSE](LICENSE).

## Credits

Created by Dratiux. Built for the OpenCode community.
