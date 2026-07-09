<p align="center">
  <img src="assets/finalcode-logo.svg" alt="FinalCode" width="468">
</p>

**OpenCode Edition v2.0.1**

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
- [Configuration](#configuration)
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
- **Policy Engine** — configurable certification rules (severity thresholds, blocking rules, warning thresholds, documentation requirements, security strictness, testing expectations)
- **Project Configuration** — optional `finalcode.config.json` / `.finalcode/config.json` defines profile, enabled/disabled/required gates, severity overrides, targets, and ignore paths; defaults to production policy when absent
- **Project Profiles** — built-in profiles (Production, Enterprise, Open Source, Library, CLI, Browser Extension, Desktop, Web Application, API, Mobile, MVP) auto-adjust certification requirements
- **Baseline System** — `.finalcode/baseline.json` records known issues; reports show New / Resolved / Regression / Severity Changes
- **Ignore System** — `.finalcodeignore` excludes files/folders; ignored paths appear in Repository Coverage
- **Incremental Inspection** — Full / Incremental / Dependency Based scoping when Git is available
- **Pull Request Analysis** — compares branch vs target: Files Changed, New/Resolved Findings, Regression Summary, Risk Level, Estimated Review Time (Inspect & Certify)
- **Machine-Readable Reports** — `report.json` and SARIF 2.1.0 (`report.sarif`) alongside Markdown, GitHub Code Scanning compatible
- **Universal Compatibility** — automatic framework detection; never fails on unknown frameworks; audits with generic rules
- **Performance Improvements** — reuses metadata, dependency analysis, and architecture maps; avoids duplicate Repair Mode inspections
- **Repository Portability** — works across language, framework, monorepo/polyrepo, OS, package manager, and deployment platform
- **Engineering Policy Summary** — every report states Profile, Enabled/Disabled Rules, Configuration Source, and Policy Version
- **Executive Engineering Dashboard** — compact top-of-report view: status, risk, health score, grade, production readiness, security/maintainability ratings, testing status, remaining effort
- **Health Score Formula** — weighted category/weight/score/contribution breakdown, never a bare number
- **Confidence Model 2.0** — Analysis, Evidence, Verification, Runtime, and Repository Coverage plus Overall Reliability, each explained
- **Risk Matrix** — findings by severity with blocking vs non-blocking split
- **Engineering Effort Estimation** — per-finding effort (5 min … Multiple days) and repository-wide effort
- **Smart Finding Classification** — engineering categories (Quick Win, Safe Refactor, Architecture/Infrastructure Decision, Human Decision Required, Breaking Change, Technical Debt, Maintainability, Documentation, Developer Experience)
- **Certification Checklist** — Build / Type Check / Lint / Tests / Security / Docs / Accessibility / CI-CD / GitHub at a glance
- **Trend Summary** — Health Score previous → current, resolved/new/regressions, improvement percentage
- **Runtime Capability Disclosure** — Verified / Runtime Executed / Not Executed / Assumed, never mixed
- **Execution Metrics** — execution time, files/directories scanned, rules executed, tool calls, reports generated
- **Standardized Report Navigation** — fixed section order for fast reading
- **Repository Quality Grade** — A+ … F derived from Health Score, with documented rules
- **Better Recommendation Engine** — Priority, Estimated Effort, Expected Impact, Prerequisites, Verification Method
- **Release Blocker Engine** — rule-based classification: Release Blocker / Conditional Blocker / Engineering Recommendation / Informational; deployment-aware blocking
- **Warning Analyzer** — per-category lint/diagnostics breakdown, top 5 categories, estimated cleanup effort, expected engineering impact
- **Health Score Explanation** — weighted breakdown, major contributors, largest deductions, how to gain the next 5 points
- **Grade Justification** — every letter grade (A+ … F) explains why with specific strengths and weaknesses
- **Finding Impact Analysis** — Engineering Cost, Estimated Fix Time, Risk if Ignored for every finding
- **Improvement Delta** — Resolved / New / Regressed / Unchanged findings vs prior inspection
- **Certification Confidence Model** — Static Analysis / Testing / Runtime / Documentation / Deployment Confidence + Overall Reliability (evidence completeness, not probability)
- **Engineering Priority Matrix** — Priority, Business Impact, Engineering Effort, Risk, Recommended Sprint per finding
- **Release Decision Summary** — clear decision, exact reason, what remains, estimated work remaining
- **Report Consistency** — internal consistency enforcement: severity vs verdict, health vs grade, checklist vs gates, dashboard vs content
- **Modular Engineering Architecture** — SKILL.md as orchestration layer with 7 dedicated reference documents for decision engine, report engine, release engine, confidence model, finding classification, health score, and explainability
- **Explainability Engine** — every finding explains itself: Observed Evidence, Applicable Rule, Reasoning, Engineering Impact, Severity Justification, Classification Justification, Release Impact Justification, Alternative Decisions Considered, Human Assumptions, Confidence Factors
- **Decision Pipeline** — formalized internal decision flow: Evidence Collection → Rule Matching → Risk Analysis → Classification → Severity Calibration → Release Impact Assessment → Report Generation
- **Single Source of Decision Rules** — all decision rules exist in one place; report generation, Health Score, Grade, Certification, Priority Matrix, and Release Blockers consume the same decision model
- **Traceable Certification** — every certification decision shows exactly which gates passed, which blockers exist, and which findings contributed
- **Explainable Health Score** — Health Score is reproducible with documented category weights, deduction rules, maximum contribution, penalty rules, and final calculation; every deduction references the findings that caused it
- **Report Engine** — unified Report Engine with 37 documented section responsibilities, consistent ordering, consistent wording, and deterministic output
- **Engineering Knowledge Base** — reusable engineering guidance for each finding category (Architecture, Security, Accessibility, Performance, Testing, Documentation, GitHub)
- **Consistency Validation Engine** — automatic verification before report production: Health Score agrees with Grade, Grade agrees with Certification, Severity agrees with Classification, Release Blockers agree with Certification
- **Plugin SDK** — extensible plugin system with registration points for rules, report sections, framework knowledge, recommendations, validation steps, and configuration options
- **Rule Registry** — centralized source of truth for all engineering rules with semantic versioning, lifecycle management, and framework scoping
- **Framework Profiles** — modular framework support for React, Next.js, Vue, Angular, Electron, Node.js, Express, Fastify, NestJS, Cloudflare Workers, Cloudflare Pages, Supabase, Vite, Hono
- **Certification Profiles** — configurable certification policies (Default, Production, Enterprise, Startup, Open Source, Educational, Minimal, Strict)
- **Policy Engine** — configurable severity thresholds, blocking rules, documentation requirements, security strictness, and testing expectations
- **Rule Versioning** — semantic versioning with introduced, modified, deprecated, and replacement fields
- **Extension Marketplace Foundation** — prepared architecture for future community plugins with validation, compatibility, and distribution
- **Self Validation** — duplicate rule detection, duplicate finding detection, reference validation, profile validation, plugin validation, report section validation, policy consistency
- **Performance Optimization** — lazy loading of reference documents, dependency-aware loading, reduced unnecessary loading
- **Architecture Documentation** — comprehensive system architecture with component relationships, dependency diagrams, and execution flow

## Version Compatibility

| Item | Value |
|------|-------|
| Current Version | 2.0.1 |
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
| Policy Engine | Available | Configurable certification rules |
| Project Configuration | Available | finalcode.config.json / .finalcode/config.json |
| Project Profiles | Available | 11 built-in profiles auto-adjust requirements |
| Baseline System | Available | Known-issue tracking via baseline.json |
| Ignore System | Available | .finalcodeignore path exclusion |
| Incremental Inspection | Available | Full / Incremental / Dependency Based |
| Pull Request Analysis | Available | Branch vs target diff analysis |
| Machine-Readable Reports | Available | report.json + SARIF 2.1.0 |
| Universal Compatibility | Available | Auto framework detection, never fails on unknown |
| Performance Improvements | Available | Reused analysis, no duplicate inspections |
| Repository Portability | Available | Any language, framework, mono/polyrepo, OS |
| Engineering Policy Summary | Available | Profile and policy visibility in reports |
| Executive Engineering Dashboard | Available | Compact top-of-report status view |
| Health Score Formula | Available | Weighted, explained health calculation |
| Confidence Model 2.0 | Available | Six explained confidence metrics |
| Risk Matrix | Available | Severity counts + blocking split |
| Engineering Effort Estimation | Available | Per-finding and repo-wide effort |
| Smart Finding Classification | Available | Engineering categories per finding |
| Certification Checklist | Available | Build/type/lint/test/security/CI at a glance |
| Trend Summary | Available | Health progression vs baseline |
| Runtime Capability Disclosure | Available | Verified/executed/not-executed/assumed |
| Execution Metrics | Available | Time, scope, rules, tool calls, reports |
| Standardized Report Navigation | Available | Fixed section order |
| Repository Quality Grade | Available | A+ … F with documented rules |
| Better Recommendation Engine | Available | Priority/effort/impact/prereqs/verification |
| Release Blocker Engine | Available | Deployment-aware blocking classification |
| Warning Analyzer | Available | Per-category lint/diagnostics breakdown |
| Health Score Explanation | Available | Weighted breakdown, contributors, deductions, improvement path |
| Grade Justification | Available | Letter grade with strengths and weaknesses |
| Finding Impact Analysis | Available | Engineering cost, fix time, risk if ignored |
| Improvement Delta | Available | Resolved/new/regressed/unchanged vs prior inspection |
| Certification Confidence Model | Available | Static/Testing/Runtime/Documentation/Deployment Confidence + Overall Reliability |
| Engineering Priority Matrix | Available | Priority, business impact, effort, risk, sprint per finding |
| Release Decision Summary | Available | Decision, reason, what remains, estimated work |
| Report Consistency | Available | Internal consistency enforcement across all sections |
| Modular Engineering Architecture | Available | Orchestration layer with 7 dedicated reference documents |
| Explainability Engine | Available | Every finding explains itself with full reasoning |
| Decision Pipeline | Available | Formalized Evidence → Rule → Risk → Classification → Severity → Release → Report |
| Single Source of Decision Rules | Available | All decision rules in one place, no duplication |
| Traceable Certification | Available | Every certification decision shows its derivation |
| Explainable Health Score | Available | Reproducible with documented weights, deductions, and calculation |
| Report Engine | Available | 37 documented sections with consistent ordering and deterministic output |
| Engineering Knowledge Base | Available | Reusable guidance for each finding category |
| Consistency Validation Engine | Available | Automatic verification before report production |
| Plugin SDK | Available | Extensible plugin system with registration points |
| Rule Registry | Available | Centralized rule management with versioning |
| Framework Profiles | Available | Modular framework support for 14 frameworks |
| Certification Profiles | Available | Configurable certification policies |
| Policy Engine | Available | Configurable severity thresholds and blocking rules |
| Rule Versioning | Available | Semantic versioning with lifecycle management |
| Extension Marketplace Foundation | Available | Prepared architecture for future community plugins |
| Self Validation | Available | Duplicate detection, reference validation, consistency checks |
| Performance Optimization | Available | Lazy loading, dependency-aware loading |
| Architecture Documentation | Available | System architecture with dependency diagrams |

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
│   ├── SKILL.md                     # Skill specification (orchestration layer)
│   ├── core/                        # Core Engine Layer
│   │   ├── decision-engine.md       # Decision Pipeline, Rule Matching, Risk Analysis
│   │   ├── policy-engine.md         # Policy Engine, Built-in Policies, Policy Selection
│   │   ├── rule-registry.md         # Rule Registry, Rule Schema, Rule Lifecycle
│   │   ├── report-engine.md         # Report Engine, 37 Sections, Formatting Rules
│   │   └── certification-engine.md  # Certification Pipeline, Validation, Execution Flow
│   ├── plugins/                     # Plugin Layer
│   │   ├── sdk.md                   # Plugin SDK, Registration Process, Constraints
│   │   ├── profiles.md              # Framework Profiles, Detection, Best Practices
│   │   └── marketplace.md           # Extension Marketplace Foundation, Distribution
│   └── references/                  # Reference Layer
│       ├── examples.md              # Worked example reports
│       ├── gates.md                 # Quality Gate Checklists
│       ├── security-gate.md         # Security Gate 2.0 Checklist
│       ├── configuration.md         # Config, Profiles, Baseline, Ignore, Incremental, PR, Machine-readable
│       ├── plugins.md               # Plugin Architecture and Examples
│       ├── health-score.md          # Health Score Formula, Weights, Grade Assignment
│       ├── confidence-model.md      # Confidence Model 2.0, Certification Confidence Model
│       ├── finding-classification.md # Finding Status, Classification, IDs, Severity
│       ├── explainability.md        # Explainability Engine, Finding Self-Explanation
│       ├── release-engine.md        # Release Blocker Engine, Conditional Blockers
│       └── architecture.md          # Overall System Architecture, Dependency Diagrams
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

This copies `source/SKILL.md`, `source/core/`, `source/plugins/`, and `source/references/` into `.opencode/skills/finalcode/` where OpenCode can discover them.

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

## Configuration

FinalCode v2.0.0 is configurable without editing the skill. Place a `finalcode.config.json` at the repository root (or `.finalcode/config.json`). If neither exists, FinalCode uses its default production policy. See [source/references/configuration.md](source/references/configuration.md) for the full schema and examples.

### Built-in Policies

| Policy | Description |
|--------|-------------|
| POLICY-DEFAULT | Default behavior (identical to v1.9.0) |
| POLICY-PRODUCTION | Strict policy for production systems |
| POLICY-ENTERPRISE | Enterprise-grade policy |
| POLICY-STARTUP | Relaxed policy for rapid development |
| POLICY-OPENSOURCE | Policy for open source projects |
| POLICY-EDUCATIONAL | Policy for learning projects |
| POLICY-MINIMAL | Bare minimum checks |
| POLICY-STRICT | Maximum strictness |

### Policy Selection

The active policy is selected by:

1. Explicit configuration (`policy: "POLICY-PRODUCTION"`)
2. Project profile (some profiles set a default policy)
3. Command-line flag (`--policy POLICY-ENTERPRISE`)
4. Default (`POLICY-DEFAULT`)

## Usage

### Inspect Mode

```bash
# Run FinalCode in Inspect Mode
Run FinalCode

# Or use the slash command
/finalcode inspect
```

### Repair Mode

```bash
# Run FinalCode in Repair Mode
Run FinalCode in Repair Mode

# Or use the slash command
/finalcode repair
```

### Refactor Mode

```bash
# Run FinalCode in Refactor Mode
Run FinalCode in Refactor Mode

# Or use the slash command
/finalcode refactor
```

### Certify Mode

```bash
# Run FinalCode in Certify Mode
Run FinalCode in Certify Mode

# Or use the slash command
/finalcode certify
```

## Requirements

| Requirement | Minimum | Recommended |
|-------------|---------|-------------|
| OpenCode | Latest Stable | Latest Stable |
| Git | 2.0+ | Latest Stable |
| Node.js | 18+ | Latest LTS |
| npm | 9+ | Latest Stable |

## Quality Gates

FinalCode evaluates repositories across 13 Quality Gates:

| Gate | Description |
|------|-------------|
| Architecture | Project structure, module organization, dependency management |
| Code Quality | Code smells, complexity, duplication, naming conventions |
| Dead Code | Unused files, exports, variables, functions |
| Dependencies | Outdated packages, security vulnerabilities, license compliance |
| Type Safety | TypeScript strictness, type annotations, type errors |
| Error Handling | Try-catch blocks, error propagation, error recovery |
| Testing | Unit tests, integration tests, E2E tests, coverage |
| Performance | Bundle size, load times, memory usage, optimization |
| Security | Security Gate 2.0 (14 categories) |
| Accessibility | WCAG compliance, screen reader support, keyboard navigation |
| UI Consistency | Design system compliance, component consistency |
| Documentation | README, API docs, inline comments, changelog |
| GitHub Readiness | Issue templates, PR templates, CI/CD, badges |

## Certification Verdict

| Verdict | Exit Code | Meaning |
|---------|-----------|---------|
| READY TO SHIP | 0 | All mandatory gates PASS |
| READY WITH WARNINGS | 1 | Mandatory gates PASS but warnings exist |
| NOT READY | 2 | One or more mandatory gates FAIL |
| NO PROJECT FOUND | 3 | No valid project detected |

## Examples

### Clean Repository

```
Certification: READY TO SHIP
Exit Code: 0
Health Score: 94 / 100 (Excellent)
Grade: A+
Overall Reliability: 92%
```

### Repository with Issues

```
Certification: NOT READY
Exit Code: 2
Health Score: 67 / 100 (Fair)
Grade: C+
Overall Reliability: 78%
Blocking Issues: 3
```

## Support Policy

| Version | Support Level | End of Life |
|---------|---------------|-------------|
| 2.0.x | Active Development | TBD |
| 1.9.x | Maintenance | 2027-01-01 |
| 1.8.x | Maintenance | 2026-12-01 |
| < 1.8 | End of Life | 2026-06-01 |

## Roadmap

### v2.1.0 (Planned)

- Remote plugin registry
- Community plugin submission
- Plugin ratings and reviews

### v2.2.0 (Planned)

- Enterprise plugin repository
- Plugin licensing
- Plugin analytics

### v3.0.0 (Future)

- Real-time collaboration
- Multi-repository certification
- CI/CD integration

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## Security

See [SECURITY.md](SECURITY.md) for vulnerability reporting.

## Support

- **Issues:** [GitHub Issues](https://github.com/dratiux/FinalCode/issues)
- **Discussions:** [GitHub Discussions](https://github.com/dratiux/FinalCode/discussions)
- **Email:** dratiux@gmail.com

## License

MIT License. See [LICENSE](LICENSE).

## Credits

Created by Dratiux. Built for the OpenCode community.
