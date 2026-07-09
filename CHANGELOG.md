# Changelog

All notable changes to FinalCode will be documented in this file.

## [2.0.1] - 2026-07-09

### Maintenance Release — Documentation Consistency

Maintenance release focused solely on documentation consistency and repository integrity. No functional changes, no behavior changes, no breaking changes.

### Changed

- **Moved** `source/references/decision-engine.md` to `source/core/decision-engine.md` (canonical location)
- **Moved** `source/references/report-engine.md` to `source/core/report-engine.md` (canonical location)
- **Fixed** terminology inconsistencies: "Engineering Policy Engine" → "Policy Engine" in README.md
- **Fixed** terminology inconsistency: "plugin SDK" → "Plugin SDK" in SUPPORTED.md
- **Fixed** terminology inconsistency: "Explainability" → "Explainability Engine" in architecture.md
- **Updated** README.md source layout to include `release-engine.md` in references/
- **Updated** SKILL.md reference documents table to include `release-engine.md`
- **Updated** install scripts to copy core/ and plugins/ directories
- **Cleaned** installed skill directory of stale files
- **Derived** file counts automatically (no hardcoded numbers)

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification logic unchanged
- Report format unchanged
- Exit codes unchanged
- Backward compatible with v2.0.0

## [2.0.0] - 2026-07-09

### Extensible Engineering Platform

Transforms FinalCode from a monolithic specification into an extensible engineering platform with a stable core and plugin-based architecture. Separates FinalCode Core from framework-specific knowledge. No new Quality Gates, no modified Security Gate 2.0, no changed operational modes, no altered certification logic, no modified report output, no changed configuration behavior. Complete backward compatibility with v1.9.0.

### Added

- **Plugin SDK** — extensible plugin system with documented registration points for detection rules, report sections, framework knowledge, engineering recommendations, validation steps, and configuration options; plugins never modify Core logic directly
- **Rule Registry** — centralized source of truth for all engineering rules with Rule ID, Version, Owner, Description, Gate, Severity, Default Classification, Detection Method, Applicable Frameworks, References, and Deprecation Status; no duplicated rule definitions allowed
- **Framework Profiles** — modular framework support for 14 frameworks (React, Next.js, Vue, Angular, Electron, Node.js, Express, Fastify, NestJS, Cloudflare Workers, Cloudflare Pages, Supabase, Vite, Hono); each profile contributes additional rules, best practices, framework documentation, and report improvements without changing Core behavior
- **Certification Profiles** — configurable certification policies (Default, Production, Enterprise, Startup, Open Source, Educational, Minimal, Strict); each profile defines blocking policy, enabled gates, required evidence, minimum quality score, and report sections; default policy remains identical to v1.9.0
- **Policy Engine** — configurable severity thresholds, blocking rules, warning thresholds, documentation requirements, security strictness, and testing expectations; policies are configurable without editing Core
- **Rule Versioning** — semantic versioning for every engineering rule with introduced version, modified version, deprecated version, and replacement rule; allows future upgrades without breaking reports
- **Extension Marketplace Foundation** — documented plugin layout, registration process, validation requirements, compatibility rules, version compatibility, and future distribution architecture; no networking or package downloads implemented
- **Self Validation** — duplicate rule detection, duplicate finding detection, missing reference detection, invalid profile detection, broken plugin registration detection, invalid report section detection, inconsistent policy detection; execution must stop if Core is inconsistent
- **Performance Optimization** — reference documents loaded only when required, unrelated documentation not loaded, dependency relationships between modules documented, lazy loading strategy implemented
- **Architecture Documentation** — comprehensive system architecture describing Core, Decision Engine, Policy Engine, Rule Registry, Plugin SDK, Report Engine, Explainability Engine, Configuration System, Certification Pipeline, and Execution Flow with clear dependency diagrams in Markdown
- **New source directories** — `source/core/` (Core Engine Layer), `source/plugins/` (Plugin Layer)
- **New core documents** — `core/decision-engine.md`, `core/policy-engine.md`, `core/rule-registry.md`, `core/report-engine.md`, `core/certification-engine.md`
- **New plugin documents** — `plugins/sdk.md`, `plugins/profiles.md`, `plugins/marketplace.md`
- **New reference document** — `references/architecture.md`

### Changed

- `source/SKILL.md` refactored as v2.0.0 orchestration layer with pointers to core, plugin, and reference documents
- `source/SKILL.md` "Architecture Overview" section documents the three-layer system (Core Engine, Plugin, Reference)
- `source/SKILL.md` "Plugin SDK (v2.0.0)" section documents the plugin system
- `source/SKILL.md` "Framework Profiles (v2.0.0)" section documents the 14 supported frameworks
- `source/SKILL.md` "Policy Engine (v2.0.0)" section documents the 8 built-in policies
- `source/SKILL.md` "Rule Registry (v2.0.0)" section documents the rule lifecycle
- `source/SKILL.md` "Self Validation (v2.0.0)" section documents validation requirements
- `source/SKILL.md` "Execution Flow" section documents the 6-phase pipeline
- `source/SKILL.md` "Loading Strategy" section documents on-demand loading
- `source/SKILL.md` "Dependency Relationships" section documents component dependencies
- `source/SKILL.md` Report template extended with Active Policy and Active Profiles fields
- `source/SKILL.md` Report template Version History updated with v2.0.0
- `README.md` version updated to 2.0.0
- `README.md` Features list extended with Plugin SDK, Rule Registry, Framework Profiles, Certification Profiles, Policy Engine, Rule Versioning, Extension Marketplace Foundation, Self Validation, Performance Optimization, Architecture Documentation
- `README.md` Feature Matrix extended with 12 new features
- `README.md` Source Layout updated with new directory structure
- `README.md` Installation updated to include core and plugins directories
- `README.md` Configuration section extended with Policy Engine documentation
- `SUPPORTED.md` version history updated with v2.0.0

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification logic and verdict rules unchanged
- Finding IDs unchanged
- Report format unchanged (external behavior identical)
- Exit codes unchanged
- Backward compatible with v1.9.0

## [1.9.0] - 2026-07-09

### Modular Engineering Architecture

Transforms FinalCode from a monolithic specification into a modular engineering platform. Every engineering decision is now explainable, every decision rule exists in one place, and the repository is easier to maintain while producing identical certification results. No behavior, Quality Gates, Security Gate 2.0, operational modes, or certification logic is modified.

### Added

- **Modular Engineering Architecture** — SKILL.md becomes the orchestration layer; 7 new dedicated reference documents handle specific responsibilities: decision-engine.md, report-engine.md, release-engine.md, confidence-model.md, finding-classification.md, health-score.md, explainability.md
- **Explainability Engine** — every finding explains itself with Observed Evidence, Applicable Rule, Reasoning, Engineering Impact, Severity Justification, Classification Justification, Release Impact Justification, Alternative Decisions Considered, Human Assumptions, and Confidence Factors
- **Decision Pipeline** — formalized internal decision flow: Evidence Collection → Rule Matching → Risk Analysis → Classification → Severity Calibration → Release Impact Assessment → Report Generation
- **Single Source of Decision Rules** — all decision rules exist in one place; report generation, Health Score, Grade, Certification, Priority Matrix, and Release Blockers consume the same decision model
- **Traceable Certification** — every certification decision shows exactly which gates passed, which blockers exist, and which findings contributed
- **Explainable Health Score** — Health Score is reproducible with documented category weights, deduction rules, maximum contribution, penalty rules, and final calculation; every deduction references the findings that caused it
- **Report Engine** — unified Report Engine with 37 documented section responsibilities, consistent ordering, consistent wording, and deterministic output
- **Engineering Knowledge Base** — reusable engineering guidance for each finding category (Architecture, Security, Accessibility, Performance, Testing, Documentation, GitHub)
- **Consistency Validation Engine** — automatic verification before report production: Health Score agrees with Grade, Grade agrees with Certification, Severity agrees with Classification, Release Blockers agree with Certification
- **New reference documents** — `references/decision-engine.md`, `references/report-engine.md`, `references/release-engine.md`, `references/confidence-model.md`, `references/finding-classification.md`, `references/health-score.md`, `references/explainability.md`

### Changed

- `source/SKILL.md` refactored as orchestration layer with pointers to reference documents
- `source/SKILL.md` "Modular Engineering Architecture (v1.9.0)" section documents the modular structure and principles
- Finding Format extended with Explainability Block
- Documentation Standards metadata extended with Explainability
- Report template Specification Version bumped to 1.9.0
- Version updated to 1.9.0

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- v1.7.0 Engineering Intelligence preserved
- v1.8.0 Configurable Engineering Platform preserved
- v1.8.1 Report Quality & Decision Support preserved
- v1.8.2 Decision Engine & Report Precision preserved
- Finding IDs unchanged
- Report format unchanged (external behavior identical)
- Exit codes unchanged
- Backward compatible with v1.8.2

## [1.8.2] - 2026-07-09

### Decision Engine & Report Precision

Improves the decision engine, report quality, and engineering accuracy without adding new Quality Gates, removing existing behavior, or changing Security Gate 2.0, the operational modes, or configuration compatibility. The goal is more trustworthy engineering decisions, fewer false positives, clearer reasoning, and a strict separation between engineering recommendations and release blockers.

### Added

- **Release Blocker Engine** — rule-based classification replacing static blocking behavior; every finding classified as Release Blocker, Conditional Blocker, Engineering Recommendation, or Informational; deployment-aware blocking with explicit condition documentation
- **Warning Analyzer** — per-category lint/diagnostics breakdown with counts, top 5 categories, estimated cleanup effort, and expected engineering impact
- **Health Score Explanation** — weighted breakdown with major contributors, largest deductions, and how to gain the next 5 points
- **Grade Justification** — every letter grade (A+ … F) explains why with specific strengths and weaknesses
- **Finding Impact Analysis** — Engineering Cost (Low/Medium/High), Estimated Fix Time, and Risk if Ignored for every finding
- **Improvement Delta** — compares current inspection with prior: Resolved / New / Regressed / Unchanged findings with net change and overall direction
- **Certification Confidence Model** — five-metric model (Static Analysis / Testing / Runtime / Documentation / Deployment Confidence) plus Overall Reliability (evidence completeness, explicitly not a probability)
- **Engineering Priority Matrix** — maps every finding to Priority (P0–P3), Business Impact, Engineering Effort, Risk, and Recommended Sprint
- **Release Decision Summary** — clear release decision with exact reason, what remains, and estimated work remaining
- **Report Consistency** — internal consistency enforcement: severity vs verdict, health vs grade, checklist vs gates, dashboard vs content; inconsistencies corrected before report emission
- Updated `references/examples.md` with all new report sections and examples

### Changed

- `source/SKILL.md` "Decision Engine & Report Precision (v1.8.2)" section documents all new capabilities
- Certification Report template rebuilt: Grade Justification in Dashboard, Warning Analysis, Release Blocker Summary, Health Score Explanation, Certification Confidence Model, Improvement Delta, Engineering Priority Matrix, Release Decision Summary
- Finding Format extended: Release Blocker Classification, Engineering Cost, Risk if Ignored
- Report Navigation updated with new sections in correct order
- Inspect, Repair, Refactor, and Certify pipelines updated to generate new report sections
- Documentation Standards metadata extended with Certification Confidence Model
- FINALCODE_SUMMARY.md required sections extended with Improvement Delta, Warning Breakdown, Certification Confidence Model, Engineering Priority Matrix, Release Decision Summary
- Version updated to 1.8.2

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- v1.7.0 Engineering Intelligence and v1.8.0 platform features preserved
- v1.8.1 report quality features preserved
- Finding IDs unchanged
- Backward compatible with v1.8.1

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
- **Repository Health Score** — weighted composite score (0–100) across 10 categories (Security, Architecture, Maintainability, Performance, Documentation, Accessibility, Testing, Type Safety, GitHub Readiness, Dead Code)
- **Engineering Metrics** — cyclomatic complexity, function/file length, duplicate code, type coverage, documentation coverage, lint status, test coverage, build success, type check status
- **Historical Trend Analysis** — append-only `.finalcode/TREND.md` tracks repository quality over time
- **Baseline Analysis** — first-execution `.finalcode/BASELINE.md` establishes baseline; future reports compare against it
- **Runtime Behavior Analysis** — execution patterns, error handling, logging practices, configuration drift
- **Executive Engineering Summary** — 30-second engineering manager view with strengths, weaknesses, risks, and recommendations
- **Commit Assistance** — Conventional Commits message generation
- **Pull Request Assistance** — GitHub-ready PR description generation
- **Change Budget** — always prefer the smallest safe modification
- **Regression Protection** — after every applied fix, review surrounding code and verify no regressions
- **UI Evidence Requirements** — UI Consistency Gate findings use Component / Objective Observation / Expected Behavior / User Impact / Recommended Correction format
- **Security Evidence Rules** — never report a category as clean without objective evidence; differentiate Verified vs Assumed
- **Reliability Statement** — explicit statement of what was verified and what was not performed

### Changed

- `source/SKILL.md` completely rewritten with Engineering Intelligence capabilities
- Inspect Mode pipeline updated with new intelligence features
- Repair Mode pipeline updated with verification and regression protection
- Refactor Mode pipeline updated with engineering justification
- Certify Mode pipeline updated with full intelligence suite
- Finding Format extended with Root Cause, Preventive Recommendation, and Engineering Metrics
- FinalCode Certification Report template extended with Health Score, Engineering Metrics, Trend Summary, and Executive Summary
- Version updated to 1.6.0

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification logic unchanged
- Finding IDs unchanged
- Backward compatible with v1.5.x

## [1.5.0] - 2026-07-08

### Advanced Security Gate, Documentation Standards & Testing Gate

Major expansion of the Security Gate with 14 categories and ~60 check items, comprehensive documentation standards, and a dedicated Testing Gate. Introduces the FinalCode Certification Report format with 37 sections and exit codes.

### Added

- **Security Gate 2.0** — 14 categories: Authentication, Authorization, Session Management, Input Validation, Secrets Management, Dependency Security, API Security, Frontend Security, Backend Security, Deployment Security, Cloud Configuration, Rate Limiting, Security Headers, Environment Security
- **Testing Gate** — unit tests, integration tests, E2E tests, coverage, critical path coverage, missing tests, flaky tests, test configuration, test documentation
- **Documentation Standards** — comprehensive documentation requirements for all engineering artifacts
- **FinalCode Certification Report** — 37-section standardized report format with exit codes (0, 1, 2, 3)
- **Evidence-Based Findings** — every finding must have objective evidence
- **Fix Verification** — every fix must be verified before marked resolved
- **Confidence Breakdown** — per-category confidence scores
- **Repository Coverage** — what was inspected and what was not
- **Severity Calibration** — severity must reflect actual engineering impact

### Changed

- `source/SKILL.md` expanded with Security Gate 2.0, Testing Gate, Documentation Standards, and Certification Report
- Version updated to 1.5.0

### Not Modified

- 13 Quality Gates unchanged
- All four operational modes preserved
- Certification logic unchanged
- Backward compatible with v1.4.x

## [1.4.0] - 2026-07-08

### Engineering Metrics & Repository Health

Introduces repository health scoring, engineering metrics, and executive summaries.

### Added

- **Repository Health Score** — weighted composite score (0–100)
- **Engineering Metrics** — cyclomatic complexity, function/file length, duplicate code, type coverage, documentation coverage
- **Executive Engineering Summary** — 30-second manager view

### Changed

- `source/SKILL.md` expanded with Health Score and Engineering Metrics
- Version updated to 1.4.0

### Not Modified

- 13 Quality Gates unchanged
- All four operational modes preserved
- Backward compatible with v1.3.x

## [1.3.0] - 2026-07-08

### Plugin Architecture & Universal Compatibility

Introduces plugin system and automatic framework detection.

### Added

- **Plugin Architecture** — framework-specific gates, checks, and repair logic
- **Universal Compatibility** — automatic framework detection, never fails on unknown
- **Repository Portability** — works across languages, frameworks, OS

### Changed

- `source/SKILL.md` expanded with Plugin Architecture
- Version updated to 1.3.0

### Not Modified

- 13 Quality Gates unchanged
- All four operational modes preserved
- Backward compatible with v1.2.x

## [1.2.0] - 2026-07-08

### Operational Modes & Configuration

Introduces the four operational modes and project configuration.

### Added

- **Four Operational Modes** — Inspect, Repair, Refactor, Certify
- **Project Configuration** — `finalcode.config.json`
- **Project Profiles** — 11 built-in profiles

### Changed

- `source/SKILL.md` expanded with Operational Modes
- Version updated to 1.2.0

### Not Modified

- 13 Quality Gates unchanged
- Backward compatible with v1.1.x

## [1.1.0] - 2026-07-08

### Quality Gates & Security Gate

Introduces the 13 Quality Gates and Security Gate.

### Added

- **13 Quality Gates** — Architecture, Code Quality, Dead Code, Dependencies, Type Safety, Error Handling, Testing, Performance, Security, Accessibility, UI Consistency, Documentation, GitHub Readiness
- **Security Gate** — initial security checklist

### Changed

- `source/SKILL.md` expanded with Quality Gates
- Version updated to 1.1.0

### Not Modified

- Backward compatible with v1.0.x

## [1.0.0] - 2026-07-08

### Initial Release

Initial release of FinalCode as a production certification system for OpenCode projects.

### Added

- **Core certification logic**
- **Basic report generation**
- **Four operational modes** (Inspect, Repair, Refactor, Certify)
- **Evidence-based findings**
- **Deterministic auditing**
