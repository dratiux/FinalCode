<p align="center">
  <img src="assets/finalcode-logo.svg" alt="FinalCode" width="468">
</p>

**OpenCode Edition v1.7.0**

> Production certification and engineering intelligence for OpenCode projects.

FinalCode certifies whether a project is genuinely ready for production via a senior-engineering audit across 13 quality gates. It produces a standardized **FinalCode Certification Report** with a clear verdict: READY TO SHIP, READY WITH WARNINGS, or NOT READY. It also generates persistent engineering documentation, commit messages, pull request descriptions, root cause analysis, historical trend tracking, and repository health scoring.

---

## Project Status

FinalCode is an independent open-source project created and maintained by Dratiux.

It is designed specifically for OpenCode projects.

FinalCode is not affiliated with, endorsed by, sponsored by, or maintained by the OpenCode project or its contributors.

## Table of Contents

- [Project Status](#project-status)
- [Philosophy](#philosophy)
- [Features](#features)
- [Version Compatibility](#version-compatibility)
- [Compatibility Matrix](#compatibility-matrix)
- [Feature Matrix](#feature-matrix)
- [Operational Modes](#operational-modes)
- [Slash Commands](#slash-commands)
- [Source Layout](#source-layout)
- [Installation](#installation)
- [Engineering Documentation](#engineering-documentation)
- [Usage](#usage)
- [Requirements](#requirements)
- [Quality Gates](#quality-gates)
- [Certification Verdict](#certification-verdict)
- [Examples](#examples)
- [Support Policy](#support-policy)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Security](#security)
- [Support](#support)
- [License](#license)
- [Credits](#credits)

## Philosophy

FinalCode is not a code reviewer, linter, or formatter. It is a **Production Certification System and Engineering Intelligence Platform**.

- Every finding must have objective technical evidence
- Every recommendation must have a concrete justification
- Every finding must include root cause analysis and preventive recommendations
- Never invent issues, never ignore verified issues
- Prefer the smallest safe modification
- Deterministic: same repo state = same findings
- Confidence below 90% is classified as "Needs Verification"
- Every severity level must include engineering justification
- Every execution generates persistent engineering documentation
- Historical trend analysis and baseline comparison for continuous improvement

## Features

- **13 Quality Gates** covering architecture, code quality, dead code, dependencies, type safety, error handling, testing, performance, security, accessibility, UI consistency, documentation, and GitHub readiness
- **Security Gate 2.0** with 14 categories and ~60 check items
- **Four Operational Modes** — Inspect, Repair, Refactor, Certify
- **Testing Gate** — evaluates unit tests, integration tests, E2E tests, coverage, critical path coverage, missing tests, flaky tests, test configuration, and test documentation
- **Root Cause Intelligence** — every finding includes root cause analysis and classification
- **Repository Health Score** — weighted composite score (0–100) across 10 categories
- **Engineering Metrics** — cyclomatic complexity, function/file length, duplicate code, type coverage, documentation coverage, lint status, test coverage
- **Historical Trend Analysis** — append-only trend tracking over time
- **Baseline Analysis** — first-execution baseline, never overwritten, compared against every run
- **Runtime Behavior Analysis** — execution patterns, error handling, logging practices, configuration drift
- **Standardized Certification Report** with exit codes (0, 1, 2, 3)
- **Evidence-Based Findings** with stable IDs, classification, severity, status, and verification methods
- **Confidence Breakdown** — per-category confidence scores instead of single overall score
- **Reliability Statement** — explicit statement of what was verified and what was not performed
- **Engineering Documentation System** — persistent reports and engineering documents
- **Executive Engineering Summary** — 30-second engineering manager view with strengths, weaknesses, risks, and recommendations
- **Commit Assistance** — Conventional Commits message generation
- **Pull Request Assistance** — GitHub-ready PR description generation
- **Change Budget** and regression protection rules
- **Full repository coverage** analysis with transparency metrics
- **Decision Intelligence** — structured decision analysis for every non-automatable finding (options, pros/cons, effort, risk, certification impact, recommendation)
- **Repository Evolution** — compares each execution against prior runs: health progression, findings fixed/introduced/remaining, overall improvement
- **Smart Finding Classification** — high-frequency findings grouped into Safe / Needs Review / Unsafe; only Unsafe and Needs Review are expanded
- **Deployment Intelligence** — infrastructure findings explain suitable/unsupported environments, production risks, and recommended alternatives
- **Automatic Verification Pipeline** — Repair Mode applies, verifies build/lint/tests, re-inspects, and produces an updated certification report automatically
- **Intelligent Repair Stop** — Repair Mode halts automatically when all remaining findings require human decisions, with a clear explanation
- **Executive Decision Summary** — automatic fixes, human decisions, blocking decisions, next action, and effort remaining in one place
- **Engineering Roadmap** — remaining work grouped into Immediate / Short Term / Medium Term / Long Term
- **Release Readiness Predictor** — current certification, probability of READY TO SHIP, remaining work, and estimated completion effort
- **Human Override Awareness** — accept/defer recommendations recorded in `.finalcode/OVERRIDES.md`; acknowledged items are not re-litigated unless project conditions change

## Version Compatibility

| Item | Value |
|------|-------|
| Current Version | 1.7.0 |
| Stability | Stable |
| Minimum OpenCode Version | Not Yet Defined |
| Recommended OpenCode Version | Latest Stable |
| Tested OpenCode Version | Not Yet Defined |
| Breaking Changes | None |
| Migration Required | No |

## Compatibility Matrix

| Platform / Framework | Support Level | Notes |
|----------------------|---------------|-------|
| OpenCode | Fully Supported | Primary target |
| React | Fully Supported | Production ready |
| Next.js | Fully Supported | App Router and Pages Router |
| Electron | Fully Supported | Desktop applications |
| Vite | Fully Supported | Default build system |
| TypeScript | Fully Supported | Recommended |
| JavaScript | Fully Supported | Supported |
| Node.js | Fully Supported | LTS recommended |
| Hono | Fully Supported | Tested |
| Express | Supported | Standard projects |
| Cloudflare Workers | Supported | Tested |
| Vue | Experimental | Limited testing |
| Nuxt | Experimental | Limited testing |
| Svelte | Experimental | Limited testing |
| Astro | Experimental | Limited testing |
| Laravel | Not Tested | Unknown compatibility |
| Django | Not Tested | Unknown compatibility |
| ASP.NET | Not Tested | Unknown compatibility |
| Spring | Not Tested | Unknown compatibility |

Support Levels:

- **Fully Supported** — Tested and verified in production workflows
- **Supported** — Works with standard project structures
- **Experimental** — Limited testing, may require adjustments
- **Not Tested** — No official validation performed

## Feature Matrix

| Feature | Status | Description |
|---------|--------|-------------|
| Inspect Mode | Available | Repository inspection and audit |
| Repair Mode | Available | Applies verified fixes in priority order |
| Refactor Mode | Available | Improves maintainability without behavior change |
| Certify Mode | Available | Release certification and sign-off |
| Security Gate 2.0 | Available | 14-category security analysis |
| Testing Gate | Available | Test evaluation and coverage analysis |
| Engineering Metrics | Available | Repository complexity and quality metrics |
| Health Score | Available | Weighted repository quality score (0-100) |
| Trend Analysis | Available | Historical quality tracking over time |
| Baseline Analysis | Available | First inspection comparison |
| Root Cause Intelligence | Available | Root cause classification and prevention |
| Repair Quality Assessment | Available | Repair effectiveness evaluation |
| Executive Engineering Summary | Available | 30-second management summary |
| Commit Assistance | Available | Conventional Commits message generation |
| Pull Request Assistance | Available | GitHub PR description generation |
| Engineering Documentation | Available | Automatic report generation |
| Decision Intelligence | Available | Structured decision analysis for non-automatable findings |
| Repository Evolution | Available | Comparison against prior executions |
| Smart Finding Classification | Available | Safe / Needs Review / Unsafe grouping for high-frequency findings |
| Deployment Intelligence | Available | Environment suitability and production risk for infrastructure findings |
| Automatic Verification Pipeline | Available | Repair Mode auto-verifies and re-certifies |
| Intelligent Repair Stop | Available | Automatic halt when only human decisions remain |
| Executive Decision Summary | Available | Fixes, decisions, blockers, next action in one view |
| Engineering Roadmap | Available | Prioritized Immediate / Short / Medium / Long Term work |
| Release Readiness Predictor | Available | Certification, ship probability, remaining effort |
| Human Override Awareness | Available | Accept/defer tracking in OVERRIDES.md |

Feature Status Values:

- **Available** — Stable and ready for use
- **Experimental** — In development, may change
- **Planned** — Scheduled for future release
- **Deprecated** — Will be removed in a future version

## Operational Modes

| Mode | Description | Modifies Files | Generates Documentation |
|------|-------------|----------------|------------------------|
| **Inspect** | Full audit without modifying files. Produces the complete Certification Report. | No | Optional report |
| **Repair** | Starts with a full Inspect audit, then generates and applies fixes in priority order. Only runs with explicit user approval. | Yes | Report + CHANGE_REPORT + SUMMARY + optional commit/PR |
| **Refactor** | Improves maintainability without changing observable behavior. Generates a Refactoring Plan. Only runs with explicit user approval. | Yes | Report + REFACTOR_REPORT + SUMMARY + optional commit/PR |
| **Certify** | Strictest mode. Always performs a completely new inspection. Last checkpoint before release. | No | Report + CERTIFICATION_HISTORY |

### Mode Commands

- `Run FinalCode` — activates Inspect Mode
- `Run FinalCode in Repair Mode` — activates Repair Mode
- `Run FinalCode in Refactor Mode` — activates Refactor Mode
- `Run FinalCode in Certify Mode` — activates Certify Mode

## Slash Commands

FinalCode integrates with OpenCode's Slash Command system. Use the `/finalcode` command for quick access:

| Command | Description |
|---------|-------------|
| `/finalcode` | Run FinalCode in Inspect Mode (default) |
| `/finalcode inspect` | Run FinalCode in Inspect Mode |
| `/finalcode repair` | Run FinalCode in Repair Mode |
| `/finalcode refactor` | Run FinalCode in Refactor Mode |
| `/finalcode certify` | Run FinalCode in Certify Mode |

The slash command is a lightweight entry point that delegates to the FinalCode Skill. No auditing logic is duplicated — the command simply invokes the skill with the appropriate mode.

## Source Layout

FinalCode follows a **Single Source of Truth (SSOT)** architecture. There is exactly one editable copy of every skill file:

```
FinalCode/
├── source/                          ← EDIT THIS (single source of truth)
│   ├── SKILL.md                     # Skill specification
│   └── references/
│       ├── examples.md              # Worked example reports
│       ├── gates.md                 # Quality Gate checklists
│       └── security-gate.md         # Security Gate 2.0 checklist
├── .opencode/                       # OpenCode configuration
│   ├── commands/
│   │   └── finalcode.md             # Slash command entry point
│   └── skills/
│       └── finalcode/               ← GENERATED (never edit manually)
├── .finalcode/                      ← GENERATED (engineering documentation)
│   ├── reports/                     # Timestamped execution reports
│   ├── CHANGE_REPORT.md             # Engineering change log
│   ├── REFACTOR_REPORT.md           # Refactoring history
│   ├── FINALCODE_SUMMARY.md         # Executive summary
│   ├── CERTIFICATION_HISTORY.md     # Certification log
│   ├── TREND.md                     # Historical trend analysis
│   └── BASELINE.md                  # First-execution baseline
├── scripts/
│   ├── install.sh                   # Installation script (bash)
│   └── install.ps1                  # Installation script (PowerShell)
├── finalcode.skill                  # Packaged skill artifact
├── README.md
├── LICENSE
├── CHANGELOG.md
├── CONTRIBUTING.md
├── CODE_OF_CONDUCT.md
├── SECURITY.md
├── SUPPORT.md
├── SUPPORTED.md
└── .github/
```

**Rule:** Never edit files in `.opencode/skills/finalcode/`. Always edit `source/` files.

## Installation

### From Source

```bash
git clone https://github.com/dratiux/FinalCode.git
cd FinalCode
bash scripts/install.sh
```

This copies `source/SKILL.md` and `source/references/` into `.opencode/skills/finalcode/` where OpenCode can discover them.

### PowerShell

```powershell
pwsh scripts/install.ps1
```

### As a Skill File

Download `finalcode.skill` and install it through OpenCode's skill management interface.

### Updating

After pulling changes, re-run the installation script to sync the installed skill:

```bash
bash scripts/install.sh
```

The installed copies in `.opencode/skills/finalcode/` are generated artifacts — they are git-ignored and must never be edited directly.

## Engineering Documentation

FinalCode automatically generates persistent engineering documentation inside `.finalcode/`:

| Document | Purpose | When Updated |
|----------|---------|--------------|
| `reports/<timestamp>-<mode>.md` | Immutable execution reports | After every execution |
| `CHANGE_REPORT.md` | Official engineering change log | When findings are resolved |
| `REFACTOR_REPORT.md` | Refactoring history | When refactors are applied |
| `FINALCODE_SUMMARY.md` | Executive engineering summary | After every execution |
| `CERTIFICATION_HISTORY.md` | Certification log | After every Certify execution |
| `TREND.md` | Historical trend analysis | After every execution (append-only) |
| `BASELINE.md` | First-execution baseline | Generated once, never overwritten |

Reports in `.finalcode/reports/` are immutable — new executions create new timestamped files, never overwrite existing ones.

### Repository Health Score

FinalCode calculates a **Repository Health Score** (0–100) across 10 categories:

| Category | Weight |
|----------|--------|
| Security | 20% |
| Architecture | 15% |
| Maintainability | 15% |
| Performance | 10% |
| Documentation | 10% |
| Accessibility | 10% |
| Testing | 10% |
| Type Safety | 5% |
| GitHub Readiness | 5% |

Classifications: 90–100 Excellent, 75–89 Good, 50–74 Fair, 0–49 Poor.

### Historical Trend Analysis

Every execution appends a snapshot to `.finalcode/TREND.md` tracking Health Score, Confidence, Security findings, Critical findings, and High findings over time. A **baseline** is established on first execution (`.finalcode/BASELINE.md`) and every subsequent execution compares against it.

## Usage

### Inspect Mode (Default)

Ask OpenCode to audit your repository:

> Run FinalCode on this repository

FinalCode will scan the entire codebase, run all 13 quality gates, and produce a comprehensive report.

### Repair Mode

Request automatic fixes:

> Run FinalCode in Repair Mode

FinalCode will audit the repository, generate a repair plan, and apply fixes in priority order (Critical Security → Critical Defects → High → Medium → Low). After completion, it generates engineering documentation and optionally suggests a commit message. **Only runs with your explicit approval.**

### Refactor Mode

Request maintainability improvements:

> Run FinalCode in Refactor Mode

FinalCode will audit the repository, generate a refactoring plan, and apply maintainability improvements that preserve observable behavior. After completion, it generates engineering documentation and optionally suggests a commit message. **Only runs with your explicit approval.**

### Certify Mode

Request final release certification:

> Run FinalCode in Certify Mode

FinalCode performs a completely new inspection, issues an authoritative certification verdict, and appends to the certification history.

## Requirements

- [OpenCode](https://opencode.ai) installed and configured
- An AI model capable of processing the skill specification
- Access to the repository you want to audit

For detailed compatibility information, see the [Compatibility Matrix](#compatibility-matrix) and [Version Compatibility](#version-compatibility) sections.

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

See [source/references/examples.md](source/references/examples.md) for three complete worked examples:

1. **Clean Repository** — Certify Mode → READY TO SHIP (Exit Code 0)
2. **Repository With Issues** — Inspect Mode → NOT READY (Exit Code 2)
3. **Missing Repository** — NO PROJECT FOUND (Exit Code 3)

## Support Policy

FinalCode guarantees support only for OpenCode-based workflows. Support for other frameworks depends on project structure and available tooling. See [SUPPORTED.md](SUPPORTED.md) for the complete support policy and compatibility details.

## Roadmap

FinalCode v1.7.0 delivered the complete engineering intelligence suite (decision analysis, repository evolution, smart finding classification, deployment intelligence, automatic verification pipeline, intelligent repair stop, executive decision summary, engineering roadmap, release readiness predictor, and human override awareness).

Planned forward work:

- [ ] Enhanced AI model support and prompt optimization
- [ ] Integration with CI/CD pipelines
- [ ] Custom gate configuration
- [ ] Team collaboration features
- [ ] Performance benchmarking suite
- [ ] Multilingual documentation
- [ ] Repository health dashboards
- [ ] Cross-repository trend comparison

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## Security

To report security vulnerabilities, please see [SECURITY.md](SECURITY.md).

## Support

- [Documentation](#documentation) — Read the docs
- [GitHub Discussions](../../discussions) — Ask questions
- [Issues](../../issues) — Report bugs
- [SUPPORT.md](SUPPORT.md) — Get help
- [SUPPORTED.md](SUPPORTED.md) — Support policy and compatibility

## License

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.

## Credits

FinalCode is built on the principles of evidence-based engineering, deterministic auditing, and production-grade quality standards. It respects OpenCode conventions and preserves existing project architectures.

---

**FinalCode** — Production certification and engineering intelligence you can trust.
