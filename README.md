# FinalCode

**OpenCode Edition v1.4**

> The official OpenCode production certification and repository auditing system.

FinalCode certifies whether a project is genuinely ready for production via a senior-engineering audit across 13 quality gates. It produces a standardized **FinalCode Certification Report** with a clear verdict: READY TO SHIP, READY WITH WARNINGS, or NOT READY.

---

## Philosophy

FinalCode is not a code reviewer, linter, or formatter. It is a **Production Certification System**.

- Every finding must have objective technical evidence
- Every recommendation must have a concrete justification
- Never invent issues, never ignore verified issues
- Prefer the smallest safe modification
- Deterministic: same repo state = same findings
- Confidence below 90% is classified as "Needs Verification"
- Every severity level must include engineering justification

## Features

- **13 Quality Gates** covering architecture, code quality, dead code, dependencies, type safety, error handling, testing, performance, security, accessibility, UI consistency, documentation, and GitHub readiness
- **Security Gate 2.0** with 14 categories and ~60 check items
- **Four Operational Modes** — Inspect, Repair, Refactor, Certify
- **Testing Gate** — evaluates unit tests, integration tests, E2E tests, coverage, critical path coverage, missing tests, flaky tests, test configuration, and test documentation
- **Standardized Certification Report** with exit codes (0, 1, 2, 3)
- **Evidence-Based Findings** with classification, severity, status, and verification methods
- **Confidence Breakdown** — per-category confidence scores instead of single overall score
- **Reliability Statement** — explicit statement of what was verified and what was not performed
- **Change Budget** and regression protection rules
- **Full repository coverage** analysis with transparency metrics

## Operational Modes

| Mode | Description | Modifies Files |
|------|-------------|----------------|
| **Inspect** | Full audit without modifying files. Produces the complete Certification Report. | No |
| **Repair** | Starts with a full Inspect audit, then generates and applies fixes in priority order. Only runs with explicit user approval. | Yes |
| **Refactor** | Improves maintainability without changing observable behavior. Generates a Refactoring Plan. Only runs with explicit user approval. | Yes |
| **Certify** | Strictest mode. Always performs a completely new inspection. Last checkpoint before release. | No |

### Mode Commands

- `Run FinalCode` — activates Inspect Mode
- `Run FinalCode in Repair Mode` — activates Repair Mode
- `Run FinalCode in Refactor Mode` — activates Refactor Mode
- `Run FinalCode in Certify Mode` — activates Certify Mode

## Installation

FinalCode is installed as an OpenCode skill. Copy the `finalcode.skill` file to your OpenCode skills directory, or place it in your project's `.opencode/skills/` folder.

### From Source

```bash
git clone https://github.com/dratiux/FinalCode.git
```

The skill is defined by `SKILL.md` and its reference files in the `references/` directory.

### As a Skill File

Download `finalcode.skill` and install it through OpenCode's skill management interface.

## Usage

### Inspect Mode (Default)

Ask OpenCode to audit your repository:

> Run FinalCode on this repository

FinalCode will scan the entire codebase, run all 13 quality gates, and produce a comprehensive report.

### Repair Mode

Request automatic fixes:

> Run FinalCode in Repair Mode

FinalCode will audit the repository, generate a repair plan, and apply fixes in priority order (Critical Security → Critical Defects → High → Medium → Low). **Only runs with your explicit approval.**

### Refactor Mode

Request maintainability improvements:

> Run FinalCode in Refactor Mode

FinalCode will audit the repository, generate a refactoring plan, and apply maintainability improvements that preserve observable behavior. **Only runs with your explicit approval.**

### Certify Mode

Request final release certification:

> Run FinalCode in Certify Mode

FinalCode performs a completely new inspection and issues an authoritative certification verdict.

## Repository Structure

```
FinalCode/
├── finalcode.skill              # Packaged skill artifact
├── SKILL.md                     # Complete skill specification
├── references/
│   ├── examples.md              # Worked example reports
│   ├── gates.md                 # Detailed Quality Gate checklists
│   └── security-gate.md         # Security Gate 2.0 checklist
├── README.md                    # This file
├── LICENSE                      # MIT License
├── CHANGELOG.md                 # Version history
├── CONTRIBUTING.md              # Contribution guidelines
├── CODE_OF_CONDUCT.md           # Community standards
├── SECURITY.md                  # Security policy
├── SUPPORT.md                   # Help resources
└── .github/                     # GitHub configuration
    ├── ISSUE_TEMPLATE/          # Issue templates
    ├── pull_request_template.md # PR template
    └── DISCUSSION_TEMPLATE/     # Discussion templates
```

## Requirements

- [OpenCode](https://opencode.ai) installed and configured
- An AI model capable of processing the skill specification
- Access to the repository you want to audit

## Quality Gates

FinalCode evaluates repositories across 13 gates:

| # | Gate | What It Checks |
|---|------|----------------|
| 1 | Architecture | Consistency, separation of concerns, modularity, dependency direction, circular dependencies |
| 2 | Code Quality | Naming, readability, code smells, complexity, SOLID/DRY/KISS/YAGNI |
| 3 | Dead Code | Unused files, imports, exports, variables, unreachable code |
| 4 | Dependencies | Unused packages, version conflicts, deprecated packages |
| 5 | Type Safety | Unsafe `any`, ignored errors, `ts-ignore`, nullable risks |
| 6 | Error Handling | Unhandled promises, silent failures, retry strategy |
| 7 | Testing | Unit tests, integration tests, E2E tests, coverage, critical path coverage, missing tests, flaky tests |
| 8 | Performance | Bundle size, lazy loading, rendering efficiency, caching |
| 9 | Security | Full Security Gate 2.0 checklist (14 categories) |
| 10 | Accessibility | Semantic HTML, ARIA, keyboard navigation, focus management |
| 11 | UI Consistency | Spacing, typography, color, interaction states, responsive behavior |
| 12 | Documentation | README, installation, configuration, architecture docs |
| 13 | GitHub Readiness | Repository cleanliness, naming consistency, release readiness |

## Certification Verdict

| Status | Exit Code | Meaning |
|--------|-----------|---------|
| **READY TO SHIP** | 0 | All mandatory gates pass |
| **READY WITH WARNINGS** | 1 | No Critical/High blockers, but Medium/Low findings remain |
| **NOT READY** | 2 | One or more mandatory gates fail |
| **NO PROJECT FOUND** | 3 | Could not locate a repository |

## Examples

See [references/examples.md](references/examples.md) for three complete worked examples:

1. **Clean Repository** — Certify Mode → READY TO SHIP (Exit Code 0)
2. **Repository With Issues** — Inspect Mode → NOT READY (Exit Code 2)
3. **Missing Repository** — NO PROJECT FOUND (Exit Code 3)

## Roadmap

- [ ] Enhanced AI model support and prompt optimization
- [ ] Integration with CI/CD pipelines
- [ ] Custom gate configuration
- [ ] Team collaboration features
- [ ] Performance benchmarking suite
- [ ] Multilingual documentation

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## Security

To report security vulnerabilities, please see [SECURITY.md](SECURITY.md).

## Support

- [Documentation](#documentation) — Read the docs
- [GitHub Discussions](../../discussions) — Ask questions
- [Issues](../../issues) — Report bugs
- [SUPPORT.md](SUPPORT.md) — Get help

## License

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.

## Credits

FinalCode is built on the principles of evidence-based engineering, deterministic auditing, and production-grade quality standards. It respects OpenCode conventions and preserves existing project architectures.

---

**FinalCode** — Production certification you can trust.
