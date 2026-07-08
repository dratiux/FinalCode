# Changelog

All notable changes to FinalCode will be documented in this file.

## [1.8.1] - 2026-07-08

### Report Quality & Decision Support

Improves report usability, engineering insight, and human decision support based on real-world execution across many repositories. Does not change the 13 Quality Gates, Security Gate 2.0, or the operational modes — only how results are presented, explained, and acted upon.

### Added

- **Executive Engineering Dashboard** — compact top-of-report view: Overall Status, Overall Risk, Health Score, Engineering Grade, Production Readiness, Security/Maintainability Ratings, Testing Status, Estimated Remaining Effort
- **Health Score Formula** — weighted category/weight/score/contribution breakdown; the score never appears as a bare number
- **Confidence Model 2.0** — replaces the single confidence number with Analysis Confidence, Evidence Coverage, Verification Coverage, Runtime Coverage, Repository Coverage, and Overall Reliability; each explained with its reason
- **Risk Matrix** — findings by severity plus Blocking vs Non-Blocking split
- **Engineering Effort Estimation** — per-finding Estimated Effort (5 min / 30 min / 2 hours / Half day / Multiple days) and repository-wide effort
- **Smart Finding Classification (engineering categories)** — each finding tagged Quick Win / Safe Refactor / Architecture Decision / Infrastructure Decision / Human Decision Required / Breaking Change / Technical Debt / Maintainability / Documentation / Developer Experience (alongside the v1.7.0 occurrence classifier)
- **Certification Checklist** — Build / Type Check / Lint / Tests / Security / Documentation / Accessibility / CI-CD / GitHub Ready at a glance
- **Trend Summary** — Health Score previous → current, resolved/new/regressions, improvement percentage
- **Runtime Capability Disclosure** — Verified / Runtime Executed / Not Executed / Assumed, never mixed
- **Execution Metrics** — execution time, files/directories scanned, rules executed, tool calls, reports generated
- **Standardized Report Navigation** — fixed section order (Dashboard → Metadata → Coverage → Risk Matrix → Gates → Findings → Security → Metrics → Trend → Checklist → Certification → Appendix)
- **Repository Quality Grade** — A+ … F derived from Health Score, with documented rules
- **Better Recommendation Engine** — recommendations include Priority, Estimated Effort, Expected Impact, Prerequisites, Verification Method
- Updated `references/examples.md` with Health Score Formula, Engineering Grade, Risk Matrix, Certification Checklist, and Trend Summary examples

### Changed

- `source/SKILL.md` "Report Quality & Decision Support (v1.8.1)" section documents all new capabilities
- Certification Report template rebuilt: Executive Dashboard, Risk Matrix, Health Score Formula, Confidence Model 2.0, Repository Quality Grade, Runtime Capability Disclosure, Execution Metrics, Certification Checklist, Trend Summary, standardized order
- Finding Format extended: Engineering Category, Estimated Effort, and Recommendation Engine fields
- Advanced Certification Rules "Confidence Breakdown" replaced by Confidence Model 2.0
- FINALCODE_SUMMARY.md required sections extended with Engineering Grade and Overall Reliability
- Documentation Standards metadata updated (Confidence Model 2.0)
- Inspect and Certify pipelines updated to generate the new report sections
- Version updated to 1.8.1

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- v1.7.0 Engineering Intelligence and v1.8.0 platform features preserved
- Finding IDs unchanged
- Backward compatible with v1.8.0

## [1.8.0] - 2026-07-08

### Configurable Engineering Platform

Transforms FinalCode from a fixed production certifier into a configurable engineering platform usable by any software project. Fully backward compatible: the 13 Quality Gates, Security Gate 2.0, all four operational modes, the v1.7.0 Engineering Intelligence features, and the documentation system are preserved unchanged. New capabilities only change which rules apply, how results are scoped, and what formats are emitted.

### Added

- **Engineering Policy Engine** — hardcoded certification rules become configurable policy (required health score, mandatory tests/CI/Security Gate, `any` allowance, max complexity, documentation/accessibility requirements); default production policy preserves v1.7.0 behavior
- **Project Configuration** — optional `finalcode.config.json` / `.finalcode/config.json` (profile, enabled/disabled/required gates, severity overrides, targets, testing/CI/documentation requirements, refactor preferences, ignore paths, policy levers)
- **Project Profiles** — 11 built-in profiles (Production, Enterprise, Open Source, Library, CLI, Browser Extension, Desktop, Web Application, API, Mobile, MVP) that auto-adjust certification requirements
- **Baseline System** — `.finalcode/baseline.json` records known issues; reports show Baseline / New / Resolved / Regression / Severity Changes findings
- **Ignore System** — `.finalcodeignore` (`.gitignore` syntax) excludes paths; ignored files appear in Repository Coverage
- **Incremental Inspection** — Full / Incremental / Dependency Based scoping when Git is available
- **Pull Request Analysis** — branch-vs-target comparison (Files Changed, New/Resolved Findings, Regression Summary, Risk Level, Estimated Review Time) in Inspect and Certify Modes
- **Machine-Readable Reports** — `report.json` (every finding: id, severity, category, confidence, gate, status, files, recommendation) and SARIF 2.1.0 `report.sarif` (GitHub Code Scanning compatible) alongside Markdown
- **Plugin Architecture** — `plugins/` extend FinalCode with framework-specific gates, checks, recommendations, and repair hints (React, Next.js, Vue, Angular, Electron, Node.js, Cloudflare Workers, Supabase, Express, Fastify); additive only, never modify core behavior
- **Universal Compatibility** — automatic framework detection; never fails on unknown frameworks; audits with generic rules
- **Performance Improvements** — reuse repository metadata, dependency analysis, and architecture maps; avoid duplicate inspections during Repair Mode
- **Repository Portability** — works across language, framework, monorepo/polyrepo, OS, package manager, deployment platform
- **Engineering Policy Summary** — every report states Profile, Enabled/Disabled Rules, Configuration Source, Policy Version, Health Score Target
- **New reference docs** — `source/references/configuration.md` and `source/references/plugins.md`

### Changed

- `source/SKILL.md` "Configurable Engineering Platform (v1.8.0)" section documents all new capabilities
- All four mode pipelines updated: configuration/policy loading (step 0), profile selection, baseline analysis, ignore application, inspection-type determination, plugin activation, PR analysis, and machine-readable report emission
- Report template extended: AUDIT METADATA (Profile, Inspection Type, Configuration Source), REPOSITORY METADATA (Active Plugins), ENGINEERING POLICY, BASELINE ANALYSIS, PULL REQUEST ANALYSIS, and a machine-readable note
- Documentation Standards metadata extended with Profile, Inspection Type, Configuration Source
- Engineering Documentation System directory and artifact tables updated: `config.json`, `baseline.json`, `plugins/`, and `.json`/`.sarif` reports
- `references/gates.md` updated with a Configurable Gates note (enabled/disabled/required, profiles, plugins)
- Version updated to 1.8.0

### Not Modified

- 13 Quality Gates unchanged (only scoping/blocking made configurable)
- Security Gate 2.0 unchanged
- All four operational modes preserved
- v1.7.0 Engineering Intelligence features preserved
- Finding IDs unchanged
- Backward compatible with v1.7.x

## [1.7.0] - 2026-07-08

### Engineering Intelligence

Extends FinalCode's audit with decision-making, trend, and planning intelligence. Focuses on interpreting findings rather than adding new quality gates. The 13 Quality Gates, Security Gate 2.0, all four operational modes, the certification workflow, and the Single Source of Truth architecture are preserved unchanged.

### Added

- **Decision Intelligence** — every non-automatable finding now carries a structured Decision Analysis (why a human decision is required, available options, pros/cons, estimated effort, risk level, certification impact, final recommendation), replacing the generic "Requires Human Decision" message
- **Repository Evolution** — every report includes a Repository Evolution section comparing the current execution against prior runs: Health Score progression, findings fixed, new findings introduced, remaining findings, and overall engineering improvement
- **Smart Finding Classification** — high-frequency findings (e.g. repeated `any` casts) are classified Safe / Needs Review / Unsafe; only Unsafe and Needs Review instances are expanded, Safe instances are collapsed into a single counted line
- **Deployment Intelligence** — infrastructure findings (rate limiters, storage, caching, databases, cloud services) explain suitable environments, unsupported environments, production risks, and recommended alternatives
- **Automatic Verification Pipeline** — Repair Mode automatically applies fixes, verifies build/lint/tests, runs a lightweight re-inspection, and produces an updated certification report, so the user does not need to manually run Inspect afterward
- **Intelligent Repair Stop** — Repair Mode detects when all remaining findings require human decisions and stops automatically with an explanation of why no further automatic repair is possible
- **Executive Decision Summary** — report section summarizing automatic fixes completed, human decisions required, blocking decisions, recommended next action, and estimated engineering effort remaining
- **Engineering Roadmap** — generated after every execution, grouping remaining work into Immediate / Short Term / Medium Term / Long Term
- **Release Readiness Predictor** — estimates current certification, probability of READY TO SHIP, remaining engineering work, and estimated completion effort
- **Human Override Awareness** — developers can explicitly accept or defer recommendations; decisions are recorded in `.finalcode/OVERRIDES.md`, acknowledged items are not re-litigated unless project conditions change, and accepted vs fixed is tracked distinctly
- **`.finalcode/OVERRIDES.md`** — new persistent document recording accepted/deferred recommendation decisions

### Changed

- Engineering Intelligence (v1.7.0) section added to `source/SKILL.md` documenting all ten capabilities
- Inspect Mode pipeline updated: applies Smart Finding Classification, attaches Decision Analysis and Deployment Intelligence, and generates Repository Evolution, Executive Decision Summary, Engineering Roadmap, and Release Readiness Predictor
- Repair Mode pipeline updated: Automatic Verification Pipeline, Decision Analysis on non-automatable findings, Intelligent Repair Stop notice, and intelligence sections in the re-inspection
- Refactor Mode pipeline updated: Decision Analysis on non-automatable refactors and intelligence sections in the re-inspection
- Certify Mode pipeline updated: Smart Finding Classification, Decision Analysis, Deployment Intelligence, and intelligence sections in the certification report
- Finding Format updated: every finding may include Decision Analysis, Smart Finding Classification, and Deployment Intelligence blocks
- FINALCODE_SUMMARY.md required sections extended with Release Readiness Predictor, Engineering Roadmap, and Repository Evolution
- FinalCode Certification Report template extended with Repository Evolution, Decision Analysis, Engineering Roadmap, Release Readiness Predictor, Executive Decision Summary, Human Override Awareness, and (Repair Mode) Intelligent Repair Stop sections
- Engineering Documentation System directory structure and artifact table updated to include OVERRIDES.md
- Report template Specification Version bumped to 1.7.0
- Version updated to 1.7.0

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification logic and verdict rules unchanged
- Finding IDs unchanged
- Backward compatible with v1.6.x

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.6.2] - 2026-07-08

### Documentation Correction

Clarifies project ownership and OpenCode relationship. No functionality changes.

### Changed

- README.md hero description corrected: removed "official" claim, now reads "Production certification and engineering intelligence for OpenCode projects"
- README.md Project Status section added: states FinalCode is independent, not affiliated with OpenCode
- SUPPORTED.md: removed "official" from support policy description
- source/SKILL.md: removed "official" from description, Identity, Brand Commands, Certify Mode purpose, Report Template, and Engineering Documentation sections
- Version updated to 1.6.2

### Documentation

- Clarified that FinalCode is an independent open-source project created by Dratiux
- Clarified that FinalCode is not affiliated with, endorsed by, sponsored by, or maintained by OpenCode
- Removed all wording that implied official OpenCode ownership or endorsement

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification logic unchanged
- Slash Commands unchanged
- Report format unchanged
- Runtime behavior unchanged
- Backward compatible with v1.6.1

## [1.6.1] - 2026-07-08

### Documentation and Compatibility Update

Improves documentation quality, compatibility transparency, and framework support. No operational logic, quality gates, report generation, slash commands, or runtime behavior changes.

### Added

- **Version Compatibility** — new section in README with version, stability, OpenCode version requirements, breaking changes, and migration status
- **Compatibility Matrix** — new section in README with support levels for 18 platforms and frameworks
- **Feature Matrix** — new section in README with status and description for all 16 features
- **SUPPORTED.md** — dedicated support policy file with recommended environments, support scope, and version history
- **Table of Contents** — new navigation section in README with links to all major sections

### Changed

- README.md version updated to 1.6.1
- README.md navigation updated with new sections
- README.md Source Layout updated to include SUPPORTED.md
- README.md Support section updated to reference SUPPORTED.md
- README.md Requirements section updated to reference Compatibility Matrix

### Documentation Style

- All documentation uses Title Case for headings
- No emojis or decorative symbols in any documentation file
- Tables used instead of lists where appropriate
- Consistent phrasing across README.md, CHANGELOG.md, SUPPORT.md, SECURITY.md, CONTRIBUTING.md, SUPPORTED.md

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification logic unchanged
- Slash Commands unchanged
- Report format unchanged
- Runtime behavior unchanged
- Backward compatible with v1.6.0

## [1.6.0] - 2026-07-08

### Engineering Intelligence, Historical Analytics & Runtime Behavior Analysis

Transforms FinalCode from an auditing and documentation system into a comprehensive engineering intelligence platform. Introduces repository health scoring, root cause intelligence, historical trend analysis, baseline comparison, runtime behavior analysis, engineering metrics, and executive engineering summaries.

### Added

- **Root Cause Intelligence** — every finding now includes root cause analysis and a Root Cause Classification (Human Error, Architecture, Dependency, Configuration, Framework, External Library, Build System, Security Misconfiguration, Technical Debt, Legacy Code)
- **Preventive Recommendations** — every finding includes a preventive recommendation to avoid recurrence
- **Repository Health Score** — weighted composite score (0–100) across 10 categories with Excellent/Good/Fair/Poor classification
- **Engineering Metrics** — cyclomatic complexity, function/file length, duplicate code, type coverage, documentation coverage, lint status, test coverage
- **Historical Trend Analysis** — append-only `.finalcode/TREND.md` tracks metrics over time (Health Score, Confidence, Security, Critical, High findings)
- **Baseline Analysis** — `.finalcode/BASELINE.md` generated once on first execution, never overwritten; every subsequent execution compares against baseline
- **Runtime Behavior Analysis** — Inspect Mode now analyzes execution patterns, error handling in production code, logging practices, configuration drift, and environment dependencies
- **Repository Health Score in Report** — new Health Score section in FinalCode Certification Report with category breakdown
- **Executive Engineering Summary** — redesigned FINALCODE_SUMMARY.md with Strengths, Weaknesses, Most Critical Risk, Recommended Next Action, Estimated Effort, Risk Assessment, and Release Recommendation
- **Engineering Metrics in Report** — new Engineering Metrics section in FinalCode Certification Report
- **Trend Snapshot in Report** — report includes trend snapshot (appended to TREND.md, not duplicated)
- **Baseline Comparison in Report** — report includes baseline comparison (if BASELINE.md exists)
- **Install Script Cleanup** — install scripts no longer create `.finalcode/` (runtime artifact only)
- **`.gitignore` Updated** — entire `.finalcode/` directory ignored (runtime artifact)

### Changed

- Finding Format updated: every finding now includes Root Cause, Root Cause Classification, and Preventive Recommendation
- Inspect Mode pipeline updated: calculates Engineering Metrics, Health Score, appends to TREND.md, compares against BASELINE.md
- Repair Mode pipeline updated: calculates Repair Quality Assessment, root cause intelligence, appends to TREND.md, compares against BASELINE.md
- Refactor Mode pipeline updated: calculates Engineering Metrics, Health Score, appends to TREND.md, compares against BASELINE.md
- Certify Mode pipeline updated: calculates Engineering Metrics, Health Score, appends to TREND.md, compares against BASELINE.md
- Report Template updated: new sections for Engineering Metrics, Repository Health Score, Executive Summary, Trend Snapshot, Baseline Comparison
- Engineering Documentation System updated: new files TREND.md and BASELINE.md in directory structure
- Documentation Standards updated: reports must include Engineering Metrics, Health Score, Trend Snapshot, Baseline Comparison
- Version updated to 1.6.0
- Identity updated to include "Engineering Intelligence Platform"
- Core Principles updated with Root Cause Intelligence and Historical Analytics
- Non-Goals updated with repository health baseline, trend tracking, root cause intelligence

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification logic unchanged
- Slash Commands unchanged
- Finding IDs unchanged
- Backward compatible with v1.5.x

## [1.5.0] - 2026-07-08

### Stable Release — Engineering Documentation & Release Assistant

Transforms FinalCode from an auditing skill into a complete engineering documentation and release assistant. Introduces persistent engineering documentation, automatic report generation, commit assistance, and pull request assistance.

### Added

- **Engineering Documentation System** — persistent `.finalcode/` directory for reports and engineering documents
- **Automatic Documentation Generation** — mandatory after every successful execution that modifies the repository
- **CHANGE_REPORT.md** — engineering change log with stable finding IDs (FC-SEC-001, FC-CODE-003, etc.)
- **REFACTOR_REPORT.md** — refactoring history with behavioral change declarations
- **FINALCODE_SUMMARY.md** — executive engineering summary (regenerated after every execution)
- **CERTIFICATION_HISTORY.md** — append-only certification log
- **Timestamped Reports** — immutable execution reports in `.finalcode/reports/`
- **Finding IDs** — stable unique identifiers (FC-<CATEGORY>-<NUMBER>) that never renumber
- **Commit Assistance** — Conventional Commits message generation
- **Pull Request Assistance** — GitHub-ready PR description generation
- **Reliability Statement** — new categories: Verified, Performed, Skipped, Not Verifiable, Unknown
- **Documentation Standards** — mandatory metadata in every generated report

### Changed

- Execution pipelines updated with documentation generation stages
- Inspect Mode: optionally generates timestamped report
- Repair Mode: generates report, updates CHANGE_REPORT and SUMMARY, optional commit/PR
- Refactor Mode: generates report, updates REFACTOR_REPORT and SUMMARY, optional commit/PR
- Certify Mode: generates report, appends to CERTIFICATION_HISTORY
- Version updated to 1.5.0 Stable
- Reliability Statement expanded with 5 status categories
- Identity updated to include "Engineering Documentation Assistant"

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification logic unchanged
- Slash Commands unchanged
- Backward compatible with v1.4.x

## [1.4.2] - 2026-07-08

### Single Source of Truth (SSOT) Update

Eliminates duplicate editable copies of skill files. Only one authoritative source exists — installed copies are generated automatically.

### Changed

- **Repository restructured** — `SKILL.md` and `references/` moved to `source/` directory (single editable copy)
- **Installed copies removed** — `.opencode/skills/finalcode/` now generated by installation script, not tracked in git
- **`.gitignore` updated** — installed skill directory ignored to prevent accidental manual edits
- **Installation script created** — `scripts/install.sh` (bash) and `scripts/install.ps1` (PowerShell)
- **README.md updated** — new Source Layout, Installation, and Synchronization sections

### Removed

- Duplicate `SKILL.md` at repository root (moved to `source/`)
- Duplicate `references/` at repository root (moved to `source/`)
- Manually maintained `.opencode/skills/finalcode/` files (now generated)

### Architecture

```
source/SKILL.md          ← EDIT THIS (single source of truth)
source/references/       ← EDIT THESE (single source of truth)
        ↓ scripts/install.sh
.opencode/skills/finalcode/  ← GENERATED (never edit manually)
```

## [1.4.1] - 2026-07-08

### Command Integration Update

Integrates FinalCode with OpenCode's Slash Command system.

### Added

- **Slash Command** — `/finalcode` command with mode argument support (`inspect`, `repair`, `refactor`, `certify`)
- **OpenCode Skill Location** — skill files installed to `.opencode/skills/finalcode/` per OpenCode conventions
- **Command Entry Point** — `.opencode/commands/finalcode.md` delegates to the FinalCode Skill

### Changed

- Repository structure updated to include `.opencode/` directory
- README.md updated with Slash Commands documentation

### Not Modified

- Skill behavior unchanged
- Quality Gates unchanged
- Auditing engine unchanged
- Certification logic unchanged

## [1.4.0] - 2026-07-08

### Precision, Reliability & Refactoring Update

Improves engineering accuracy, report transparency, security validation, deterministic behavior, testing evaluation, and introduces a dedicated Refactor Mode.

### Added

- **Refactor Mode** — dedicated mode for maintainability improvement without changing observable behavior
- **Testing Quality Gate (Gate 7)** — evaluates unit tests, integration tests, end-to-end tests, coverage, critical path coverage, missing tests, flaky tests, test configuration, and test documentation
- **Finding Status** — every finding now uses exactly one status: Confirmed, Needs Verification, or Not Verified
- **Severity Calibration** — new severity level "Informational" with justification requirement
- **Confidence Breakdown** — per-category confidence scores (Architecture, Code Quality, Security, Testing, Type Safety, Accessibility, UI Consistency, Repository Coverage, Verification) replacing single confidence score
- **Reliability Statement** — every report explicitly states what was verified and what was not performed
- **Certification Integrity** — every report includes a disclaimer about certification boundaries
- **Report Versioning** — every report now includes Specification Version, Audit Engine Version, Report Version, Repository Version, Git Commit, Audit Date, Mode
- **Security Evidence Rules** — differentiates between Verified and Assumed security status; never reports "clean" without objective evidence

### Changed

- Quality Gates expanded from 12 to 13 (Testing Gate added as Gate 7, Performance renumbered to Gate 8, Security to Gate 9, etc.)
- Security Gate 2.0 expanded from 9 to 14 categories: Authentication, Authorization, Session Management, Input Validation, Secrets, Dependencies, API Security, Frontend Security, Backend Security, Deployment Security, Cloud Configuration, Rate Limiting, Security Headers, Environment Configuration
- Confidence Calculation replaced with per-category Confidence Breakdown
- Report format updated with new sections: Confidence Breakdown, Reliability Statement, Certification Integrity, Refactors Applied
- Quality Gate Summary now includes PASS WITH WARNINGS status
- Brand Commands updated to include Refactor Mode
- Mission statement clarified: "not to maximize findings" added to Non-Goals

### Deprecated

- Single overall Confidence Score (replaced by Confidence Breakdown)

## [1.3.0] - 2026-07-08

### OpenCode Edition

Initial public release of FinalCode as an OpenCode skill.

### Added

- Complete skill specification for AI-driven production certification
- Three operational modes: Inspect, Repair, Certify
- 12 Quality Gates: Architecture, Code Quality, Dead Code, Dependencies, Type Safety, Error Handling, Performance, Security, Accessibility, UI Consistency, Documentation, GitHub Readiness
- Security Gate 2.0 with 9 categories and ~40 check items
- Standardized FinalCode Certification Report format
- Exit codes: 0 (READY TO SHIP), 1 (READY WITH WARNINGS), 2 (NOT READY), 3 (NO PROJECT FOUND)
- Evidence-based finding classification system
- Confidence calculation algorithm
- Change budget and regression protection rules
- UI Consistency evidence requirements
- Full reference documentation with worked examples
- Three complete example reports (Clean, Issues, Missing Repository)
- Repair Mode execution plan and priority ordering
