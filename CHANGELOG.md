# Changelog

All notable changes to FinalCode are documented in this file.

Format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [4.0.0] - 2026-07-12

### Highlights

Autonomous Engineering Agent. Transforms FinalCode from an Autonomous Engineering Workflow platform into an Autonomous Engineering Agent. FinalCode must no longer require the developer to manually choose the correct operating mode. Instead, it must understand the user's engineering objective, build an execution strategy, orchestrate workflows, pause for human approval when required, and continuously verify correctness until the objective is complete. All additions remain fully backward compatible.

### Added

- **Goal-Oriented Planning** — Transforms user requests into structured engineering goals
- **Planning Engine** — Generates execution strategy with workflows, dependencies, approvals, and verification
- **Workflow Orchestration** — Dynamically composes and executes workflows based on execution strategy
- **Objective Tracking** — Tracks mission progress including current goal, completed percentage, remaining work, and stages
- **Adaptive Decision Engine** — Continuously reevaluates strategy after every workflow and adapts to new information
- **Engineering Mission** — Represents every request as a Mission with goal, strategy, workflow graph, task queue, verification, history, and outcome
- **Autonomous Recommendations** — Generates evidence-based recommendations for next missions, quick wins, and long-term improvements
- **Mission Dashboard** — Displays mission status, progress, completed tasks, remaining tasks, workflow graph, approvals, verification, and engineering delta

### Changed

- `skills/finalcode/SKILL.md` updated with v4.0.0 features
- `README.md` updated to v4.0.0
- Version bumped to v4.0.0

### Added Files

- `skills/finalcode/core/goal-planning.md` — Goal-Oriented Planning
- `skills/finalcode/core/planning-engine.md` — Planning Engine
- `skills/finalcode/core/workflow-orchestration.md` — Workflow Orchestration
- `skills/finalcode/core/objective-tracking.md` — Objective Tracking
- `skills/finalcode/core/adaptive-decision.md` — Adaptive Decision Engine
- `skills/finalcode/core/engineering-mission.md` — Engineering Mission
- `skills/finalcode/core/autonomous-recommendations.md` — Autonomous Recommendations
- `skills/finalcode/core/mission-dashboard.md` — Mission Dashboard

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four existing operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Backward compatible with v3.6.0

## [3.6.0] - 2026-07-12

### Highlights

Autonomous Engineering Workflows. Transforms FinalCode from an Engineering Intelligence platform into an Autonomous Engineering Workflow system. Every operation must become a complete engineering workflow with planning, execution, verification, approval gates, rollback planning, and engineering memory updates. All additions remain fully backward compatible.

### Added

- **Workflow Engine** — Reusable workflow engine shared by every operating mode
- **Workflow Templates** — Reusable templates for common engineering operations
- **Project Lifecycle** — Identifies current lifecycle stage and adapts recommendations
- **Task Queue** — Autonomous engineering task queue with priorities and automation
- **Approval Gate** — Determines approval requirements before workflow execution
- **Rollback Planning** — Creates rollback plan before every workflow execution
- **Execution Sessions** — Tracks every workflow as an engineering session
- **Workflow Verification** — Defines mandatory verification for every workflow
- **Workflow Recovery** — Handles workflow failures with analysis and safe recovery
- **Workflow Metrics** — Measures workflow performance and effectiveness

### Changed

- `skills/finalcode/SKILL.md` updated with v3.6.0 features
- `README.md` updated to v3.6.0
- Version bumped to v3.6.0

### Added Files

- `skills/finalcode/core/workflow-engine.md` — Workflow Engine
- `skills/finalcode/core/workflow-templates.md` — Workflow Templates
- `skills/finalcode/core/project-lifecycle.md` — Project Lifecycle
- `skills/finalcode/core/task-queue.md` — Task Queue
- `skills/finalcode/core/approval-gate.md` — Approval Gate
- `skills/finalcode/core/rollback-planning.md` — Rollback Planning
- `skills/finalcode/core/execution-sessions.md` — Execution Sessions
- `skills/finalcode/core/workflow-verification.md` — Workflow Verification
- `skills/finalcode/core/workflow-recovery.md` — Workflow Recovery
- `skills/finalcode/core/workflow-metrics.md` — Workflow Metrics

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four existing operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Backward compatible with v3.5.0

## [3.5.0] - 2026-07-12

### Highlights

Continuous Engineering Intelligence. Transforms FinalCode from an execution intelligence system into a continuous engineering platform. Instead of analyzing only the current repository state, FinalCode continuously evaluates engineering evolution across versions. All additions remain fully backward compatible.

### Added

- **Engineering Timeline** — Tracks engineering quality across versions as historical data points
- **Engineering Trend Analysis** — Detects trends in engineering quality over time
- **Technical Debt Timeline** — Tracks debt over time with full history
- **Engineering Hotspots** — Detects unstable areas with highest maintenance cost
- **Release Evolution** — Compares releases automatically with measurable improvements
- **Continuous Risk Monitoring** — Tracks regression trends, security trends, architecture drift, debt growth, and testing coverage
- **Project Knowledge Evolution** — Preserves engineering decisions, security decisions, deployment changes, database evolution, framework migrations, and historical scores
- **Release Intelligence** — Provides engineering delta, quality delta, risk delta, debt delta, documentation delta, and overall evolution score for each release
- **Improvement Forecast** — Predicts estimated engineering score, expected debt reduction, expected regression reduction, estimated work remaining, and confidence
- **Continuous Roadmap** — Generates dynamic roadmap with priority, risk, ROI, estimated effort, dependencies, and engineering impact

### Changed

- `skills/finalcode/SKILL.md` updated with v3.5.0 features
- `README.md` updated to v3.5.0
- Version bumped to v3.5.0

### Added Files

- `skills/finalcode/core/engineering-timeline.md` — Engineering Timeline
- `skills/finalcode/core/engineering-trend.md` — Engineering Trend Analysis
- `skills/finalcode/core/debt-timeline.md` — Technical Debt Timeline
- `skills/finalcode/core/engineering-hotspots.md` — Engineering Hotspots
- `skills/finalcode/core/release-evolution.md` — Release Evolution
- `skills/finalcode/core/continuous-risk.md` — Continuous Risk Monitoring
- `skills/finalcode/core/knowledge-evolution.md` — Project Knowledge Evolution
- `skills/finalcode/core/release-intelligence.md` — Release Intelligence
- `skills/finalcode/core/improvement-forecast.md` — Improvement Forecast
- `skills/finalcode/core/continuous-roadmap.md` — Continuous Roadmap

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four existing operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Backward compatible with v3.4.0

## [3.4.0] - 2026-07-12

### Highlights

Execution Intelligence. Adds predictive analysis capabilities to FinalCode, enabling it to anticipate consequences of engineering decisions before code modification. Includes dependency impact analysis, change impact prediction, cross-file refactoring engine, architecture metrics, API contract validation, database consistency audit, CI/CD audit, regression prediction, engineering graph, and confidence model v2.

### Added

- **Dependency Impact Analysis** — Analyzes dependency chains and impact radius before changes
- **Change Impact Prediction** — Predicts consequences of code modifications
- **Cross-file Refactoring Engine** — Coordinates refactoring across multiple files
- **Architecture Metrics** — Measures architecture health and coupling
- **API Contract Validation** — Validates API contracts between client and server
- **Database Consistency Audit** — Analyzes database schema, migrations, and consistency
- **CI/CD Audit** — Reviews CI/CD configuration and deployment workflows
- **Regression Prediction** — Predicts which files, tests, builds, routes, and APIs may fail
- **Engineering Graph** — Maps relationships between code components
- **Confidence Model v2** — Enhanced confidence scoring with predictive analysis

### Changed

- `skills/finalcode/SKILL.md` updated with v3.4.0 features
- `README.md` updated to v3.4.0
- Version bumped to v3.4.0

### Added Files

- `skills/finalcode/core/dependency-impact.md` — Dependency Impact Analysis
- `skills/finalcode/core/change-impact.md` — Change Impact Prediction
- `skills/finalcode/core/cross-file-refactor.md` — Cross-file Refactoring Engine
- `skills/finalcode/core/architecture-metrics.md` — Architecture Metrics
- `skills/finalcode/core/api-contract.md` — API Contract Validation
- `skills/finalcode/core/database-consistency.md` — Database Consistency Audit
- `skills/finalcode/core/cicd-audit.md` — CI/CD Audit
- `skills/finalcode/core/regression-prediction.md` — Regression Prediction

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four existing operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Backward compatible with v3.3.0

## [3.3.0] - 2026-07-12

### Highlights

Engineering Intelligence Edition. Transforms FinalCode from an engineering decision system into an autonomous Senior Software Engineer with 7 new operating modes. Core principles: runtime behavior is sacred, never guess, verify everything, smallest safe change wins.

### Added

- **Engineering Review Mode** — Complete engineering audit across 25+ categories with scores
- **Architecture Mode** — Architecture review with god component, circular dependency detection
- **Roadmap Planner** — Prioritized engineering roadmap with sprints and dependencies
- **Production Audit** — Pre-deployment inspection for environment, security, performance
- **Pull Request Review** — Senior engineer review with risk assessment and verdicts
- **Technical Debt Analyzer** — Debt classification, cost estimation, priority matrix
- **Engineering Memory** — Persistent project knowledge across audits
- **Verification Pipeline** — TypeScript, lint, tests, build, static analysis verification

### Changed

- `skills/finalcode/SKILL.md` updated with v3.3.0 features
- `README.md` updated to v3.3.0
- Version bumped to v3.3.0

### Added Files

- `skills/finalcode/core/engineering-review.md` — Engineering Review Mode
- `skills/finalcode/core/architecture-mode.md` — Architecture Mode
- `skills/finalcode/core/roadmap-planner.md` — Roadmap Planner
- `skills/finalcode/core/production-audit.md` — Production Audit
- `skills/finalcode/core/pr-review.md` — Pull Request Review
- `skills/finalcode/core/technical-debt-analyzer.md` — Technical Debt Analyzer
- `skills/finalcode/core/engineering-memory.md` — Engineering Memory

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four existing operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Backward compatible with v3.2.0

## [3.2.0] - 2026-07-12

### Highlights

Engineering Decision Intelligence. Transforms FinalCode from an advanced repository auditor into a complete engineering decision system. Improves how FinalCode understands repositories, correlates evidence, evaluates engineering trade-offs, and produces actionable engineering decisions.

### Added

- **Repository Intelligence Engine** — Understands the repository before analysis begins
- **Repository Profile** — Shared engineering context across all engines
- **Cross-Finding Correlation Engine** — Identifies relationships between findings and detects root causes
- **Engineering Trade-off Engine** — Evaluates trade-offs for each recommendation
- **Repository Maturity Model** — Evaluates engineering maturity across 10 dimensions
- **Engineering Execution Planner** — Produces implementation roadmap by phase
- **Decision Engine 2.0** — Extended pipeline with correlation, trade-offs, and execution planning
- **Report Improvements** — New sections for profile, correlation, trade-offs, maturity, and execution plan
- **Explainability Expansion** — Enhanced decision explanation with context and alternatives

### Changed

- `skills/finalcode/SKILL.md` updated with v3.2.0 features
- `skills/finalcode/core/decision-engine.md` updated with v3.2.0 pipeline
- `skills/finalcode/core/report-engine.md` updated with new sections
- `skills/finalcode/references/explainability.md` updated with expansion
- `README.md` updated to v3.2.0
- Version bumped to 3.2.0

### Added Files

- `skills/finalcode/core/repository-intelligence.md` — Repository Intelligence Engine
- `skills/finalcode/core/correlation-engine.md` — Cross-Finding Correlation Engine
- `skills/finalcode/references/maturity-model.md` — Repository Maturity Model

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Backward compatible with v3.1.0

## [3.1.0] - 2026-07-12

### Highlights

Benchmark & Regression Validation Framework. Introduces validation infrastructure to prove correctness across releases. No analysis improvements — only validation that existing capabilities remain correct.

### Added

- **Benchmark Repository Suite** — 9 benchmark scenarios (react-small, react-large, next-production, node-api, express-api, cloudflare-worker, typescript-library, production-ready, intentionally-broken)
- **Golden Reports** — Canonical FinalCode output for each benchmark
- **Regression Validation** — Compare previous vs current release across all metrics
- **Rule Validation Matrix** — Positive/negative/false positive examples for every rule
- **Benchmark Coverage** — Track rules, frameworks, gates, recommendations, evidence, knowledge base coverage
- **Regression Dashboard** — Summary table with stability, regression, improvement counts
- **Rule Stability Registry** — Version, stability, and behavior changes for every rule
- **Engineering Baselines** — Expected findings/quality/certification for different project types
- **Release Validation Checklist** — Required validation for every release
- **Regression Validation Script** — Automated validation of benchmark suite

### Changed

- `skills/finalcode/SKILL.md` updated to v3.1.0
- `README.md` updated to v3.1.0
- Version bumped to 3.1.0

### Added Files

- `benchmarks/README.md` — Benchmark documentation
- `benchmarks/metadata.json` — Suite-level metadata
- `benchmarks/rule-validation-matrix.json` — Rule validation scenarios
- `benchmarks/coverage.json` — Coverage tracking
- `benchmarks/regression-dashboard.json` — Regression summary
- `benchmarks/rule-stability.json` — Rule version tracking
- `benchmarks/QUICKSTART.md` — Quick start guide
- `benchmarks/scripts/validate-regression.py` — Validation script
- `benchmarks/engineering-baselines/baselines.json` — Baseline definitions
- `benchmarks/benchmarks/react-small/` — React small benchmark
- `benchmarks/benchmarks/react-large/` — React large benchmark
- `benchmarks/benchmarks/next-production/` — Next.js production benchmark
- `benchmarks/benchmarks/node-api/` — Node.js API benchmark
- `benchmarks/benchmarks/express-api/` — Express API benchmark
- `benchmarks/benchmarks/cloudflare-worker/` — Cloudflare Worker benchmark
- `benchmarks/benchmarks/typescript-library/` — TypeScript library benchmark
- `benchmarks/benchmarks/production-ready/` — Production-ready benchmark
- `benchmarks/benchmarks/intentionally-broken/` — Intentionally broken benchmark

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Explainability Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Backward compatible with v3.0.0

## [3.0.0] - 2026-07-12

### Highlights

Analysis Intelligence Engine. Introduces context-aware analysis, false positive reduction, and enhanced explainability. Significantly improves analysis quality by reducing false positives, providing framework-specific knowledge, and enhancing reasoning transparency.

### Added

- **Engineering Knowledge Base** — Framework-specific best practices, known issues, and anti-patterns for React, Next.js, Node.js, TypeScript, Vue, and Svelte
- **False Positive Reduction Engine** — Validates findings against known legitimate patterns, adjusts confidence based on context
- **Context-Aware Analysis** — Framework-specific knowledge applied during analysis pipeline
- **Rule Metadata Standard** — Enhanced rule schema with confidence, verification steps, false positive checks, known limitations, relationships, and explanation templates
- **Alternative Explanations** — Documented alternative explanations for findings
- **Confidence Model** — Confidence levels and adjustment factors for findings

### Changed

- `skills/finalcode/SKILL.md` updated with v3.0.0 Analysis Intelligence features
- `skills/finalcode/core/decision-engine.md` updated with context-aware analysis pipeline
- `skills/finalcode/core/rule-registry.md` updated with v3.0.0 metadata standard
- `skills/finalcode/references/finding-classification.md` updated with alternatives and confidence
- `skills/finalcode/references/explainability.md` updated with enhanced reasoning
- `README.md` updated to v3.0.0
- Version bumped to 3.0.0

### Added Files

- `skills/finalcode/references/knowledge-base.md` — Knowledge Base entry point
- `skills/finalcode/references/knowledge-base-react.md` — React knowledge
- `skills/finalcode/references/knowledge-base-nextjs.md` — Next.js knowledge
- `skills/finalcode/references/knowledge-base-nodejs.md` — Node.js knowledge
- `skills/finalcode/references/knowledge-base-typescript.md` — TypeScript knowledge
- `skills/finalcode/references/false-positive-reduction.md` — False Positive Reduction Engine

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Backward compatible with v2.10.0

## [2.10.0] - 2026-07-10

### Highlights

Cross-Agent Distribution & Documentation Refinement. Repositioned FinalCode as a portable engineering skill for the Skills ecosystem. Removed OpenCode-only wording. Improved documentation clarity and professionalism.

### Changed

- `README.md` rewritten with cross-agent distribution focus, removed OpenCode-specific requirements
- `CONTRIBUTING.md` updated with Skills ecosystem terminology
- `SUPPORT.md` simplified, removed internal path references
- `SUPPORTED.md` renamed "Platform Compatibility" to "Framework Compatibility", removed agent-specific compatibility table
- `SECURITY.md` updated scope from "OpenCode" to "Skills ecosystem"
- `skills/finalcode/SKILL.md` updated description and version
- Version bumped to 2.10.0

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Explainability Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Backward compatible with v2.8.0

## [2.8.0] - 2026-07-10

### Highlights

Native skills.sh Distribution. Migrated to skills.sh as the single official installation method. Removed repository-owned installation logic that duplicated skills.sh functionality. Simplified documentation and repository structure.

### Added

- **skills.sh Integration** — single official installation method via `npx skills add dratiux/FinalCode`
- **skills/finalcode/ Directory** — skill source files moved from `source/` to `skills/finalcode/` for skills.sh discoverability

### Removed

- **Install Scripts** — removed `scripts/install.sh` and `scripts/install.ps1` (skills.sh handles installation)
- **.skill Binary References** — removed obsolete `.skill` binary entries from `.gitattributes`
- **Legacy Installation Documentation** — removed git clone + install script workflow from README

### Changed

- `README.md` rewritten with skills.sh installation, updated directory references
- `CONTRIBUTING.md` updated with new file structure and removed install script references
- `SUPPORT.md` updated with skills.sh troubleshooting and new resource paths
- `SUPPORTED.md` updated with new file paths for plugin SDK, profiles, and policy engine
- `.gitignore` updated with skills.sh comment and new edit location
- `.gitattributes` cleaned up, removed .skill binary entries
- `source/SKILL.md` moved to `skills/finalcode/SKILL.md`
- `source/core/` moved to `skills/finalcode/core/`
- `source/plugins/` moved to `skills/finalcode/plugins/`
- `source/references/` moved to `skills/finalcode/references/`
- Version bumped to 2.8.0

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Explainability Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged (source location changed from `source/` to `skills/finalcode/`)
- Backward compatible with v2.7.0

## [2.7.0] - 2026-07-10

### Highlights

Executable Documentation & Extension Contracts. Upgraded documentation from static documentation to executable engineering specifications. Every document now has Execution Metadata, Reference Contracts, and Repository Discoverability. Plugin SDK formalized with Extension Contracts. Complete backward compatibility with all previous versions.

### Added

- **Execution Metadata** — every document now has Purpose, Execution Stage, Loaded By, Dependencies, Outputs, Consumers, Applies To
- **Reference Contracts** — reference documents now have Inputs, Outputs, Preconditions, Postconditions, Required Evidence, Generated Decisions, Possible Outcomes
- **Execution Dependency Graph** — complete dependency model documenting who loads what, when, why
- **Extension Contracts** — formalized plugin SDK with contract-driven approach
- **Public Interface Classification** — Stable/Experimental/Internal/Deprecated classification for all interfaces
- **Execution Lifecycle** — complete lifecycle of one audit from detection to report
- **Documentation Consistency Audit** — canonical definitions, terminology consistency, no duplicates
- **Architecture Explainability** — Responsibilities/Non-responsibilities for Core Engine documents
- **Repository Discoverability** — Related Documents/Used By/Depends On for all documents
- **Validation Report** — complete validation of all v2.7.0 changes

### Changed

- All core engine documents updated with Execution Metadata, Architecture Explainability, Repository Discoverability
- All reference documents updated with Execution Metadata, Reference Contracts
- All plugin documents updated with Execution Metadata, Extension Contracts
- Version bumped to 2.7.0

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Explainability Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Install Scripts unchanged
- Backward compatible with v2.6.0

## [2.6.0] - 2026-07-10

### Highlights

Execution Optimization & Knowledge Consolidation. Refactored SKILL.md from 2231 lines to a lean orchestration layer, replaced duplicated knowledge with reference routing, and reduced execution cost. Complete backward compatibility with all previous versions.

### Added

- **references/certification-rules.md** — comprehensive certification rules reference with Finding Status, Classification, IDs, Severity Calibration, Evidence-Based Findings, Fix Verification, Release Blocking Policy, Confidence Model 2.0, Repository Coverage, Reliability Statement, Certification Integrity, Change Budget, Regression Protection, UI Evidence Requirements, Security Gate 2.0, Security Evidence Rules, Root Cause Intelligence, Repair Quality Assessment, Engineering Metrics, Repository Health Score, Historical Trend Analysis, Baseline Analysis
- **references/report-format.md** — complete report template with 55 sections, Exit Code Convention, Report Engine Section Registry

### Changed

- `source/SKILL.md` refactored from 2231 lines to ~1030 lines (~54% reduction)
- Advanced Certification Rules section replaced with key requirements summary and routing to `references/certification-rules.md`
- Engineering Intelligence section replaced with key capabilities summary
- Report Quality & Decision Support section condensed with key requirements summary
- Decision Engine section condensed with pipeline summary
- Finding Format section replaced with required/conditional fields summary and routing to `references/explainability.md`
- FinalCode Certification Report section replaced with section list and routing to `references/report-format.md`
- Operational Modes section condensed with mode selection and execution rules
- Reference Documents section updated with new reference files
- Version bumped to 2.6.0

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Explainability Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Install Scripts unchanged
- Backward compatible with v2.5.0

## [2.5.0] - 2026-07-10

### Highlights

Execution Architecture Refinement. Removed legacy distribution artifacts, strengthened reference-driven execution, improved instruction quality. Complete backward compatibility with all previous versions.

### Removed

- **Legacy .skill Distribution** — removed `finalcode.skill` from repository root
- **Packaging Scripts** — removed `scripts/package.ps1`, `scripts/package.sh`
- **Verification Scripts** — removed `scripts/verify.ps1`, `scripts/verify.sh`
- **dist/ Directory** — removed generated packaging artifacts
- **.skill References** — removed all references to `.skill` as installation method

### Changed

- `README.md` simplified installation section, removed packaging documentation
- `.gitignore` cleaned up, removed dist/ exclusion
- `source/SKILL.md` version bump to v2.5.0

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Explainability Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Install Scripts unchanged
- Backward compatible with v2.4.1

## [2.4.1] - 2026-07-10

### Highlights

Release packaging validation and distribution improvements. Strengthened package validation, added standalone verification scripts, and clarified distribution policy. Complete backward compatibility with v2.4.0.

### Added

- **Standalone Package Verification** — `scripts/verify.ps1` and `scripts/verify.sh` validate existing `.skill` packages without rebuilding
- **Extended Package Manifest** — `manifest.json` now includes package name, format version, generator version, branch, minimum OpenCode version, compatible versions, structure version
- **Improved Package Validation** — rejection of duplicate files, empty files, missing required references before package generation
- **Release Checklist** — automated verification of all packaging requirements
- **Distribution Policy Documentation** — clear classification of recommended vs experimental installation methods

### Changed

- `scripts/package.ps1` updated with v2.4.1 validation improvements
- `scripts/package.sh` updated with v2.4.1 validation improvements
- `README.md` updated with installation clarifications, verification instructions, distribution policy
- `dist/PACKAGE_REPORT.md` format extended with validation summary, statistics, matrix, compatibility, distribution notes

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Explainability Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Install Scripts unchanged
- Backward compatible with v2.4.0

## [2.4.0] - 2026-07-10

### Highlights

Release Packaging System. Deterministic, reproducible release packages generated from the Single Source of Truth. Complete backward compatibility with all previous versions.

### Added

- **Release Packaging System** — deterministic packaging pipeline generating reproducible `.skill` packages from source
- **Package Validation** — multi-stage validation ensuring package integrity before completion
- **Version Consistency Check** — verifies version alignment across SKILL.md, README.md, CHANGELOG.md, SUPPORTED.md before packaging
- **Release Manifest** — `dist/manifest.json` with version, timestamp, commit, file inventory
- **Package Verification Report** — `dist/PACKAGE_REPORT.md` with validation results and file details
- **SHA256 Integrity Checksums** — `dist/SHA256SUMS` for package and manifest verification
- **Cross-platform Packaging Scripts** — `scripts/package.ps1` (PowerShell) and `scripts/package.sh` (bash)

### Changed

- `README.md` updated with release packaging documentation
- `.gitignore` updated to exclude `dist/` (generated artifacts)

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Explainability Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Install Scripts unchanged
- Backward compatible with v2.3.0

## [2.3.0] - 2026-07-10

### Highlights

Architecture intelligence. Evaluates engineering structure, maintainability, dependency design, and long-term scalability. Complete backward compatibility with all previous versions.

### Added

- **Architecture Map** — textual description of system layers, major modules, entry points, shared components, external integrations, data flow, dependency flow
- **Module Health** — independent health assessment for every major module with health score, responsibilities, dependencies, complexity, risk, recommendations
- **Responsibility Analysis** — detection of God Objects, God Components, God Services, Utility Overload, Mixed Responsibilities, Feature Leakage, Cross Layer Coupling
- **Dependency Intelligence** — analysis of circular dependencies, dependency direction, layer violations, tight coupling, fan-in, fan-out, concentration
- **Scalability Assessment** — evaluation of maintainability, extensibility, modularity, testability, replaceability, deployment flexibility with justified scores
- **Technical Debt Classification** — categorization into Structural, Architectural, Testing, Documentation, Performance, Security, Configuration, Maintainability with cleanup effort estimates
- **Architecture Risk Matrix** — risk, impact, likelihood, engineering cost, recommended priority
- **Design Pattern Recognition** — verified patterns with evidence (Repository, Service, Factory, Strategy, Adapter, Observer, DI, CQRS, MVC, MVVM)
- **Anti-Pattern Detection** — verified anti-patterns with evidence (God Class, Blob, Spaghetti Code, Feature Envy, Circular Dependency, Duplicate Logic, Primitive Obsession, Shotgun Surgery, Large Switch, Magic Numbers, Long Method)
- **Maintainability Forecast** — current maintainability, primary risks, expected growth impact, recommended refactors
- **Refactor Opportunity Map** — grouped refactors by area with estimated benefit, cost, priority
- **Architecture Summary** — executive summary of strongest/weakest areas, highest risks, largest debt, highest ROI improvements

### Changed

- `source/SKILL.md` updated with v2.3.0 Architecture Intelligence features
- `source/SKILL.md` Report Template extended with Architecture Overview, Module Health, Responsibility Analysis, Dependency Analysis, Scalability Assessment, Technical Debt Summary, Architecture Risk Matrix, Design Patterns, Anti-Patterns, Maintainability Forecast, Refactor Opportunity Map, Architecture Summary
- `source/references/architecture.md` updated with Architecture Intelligence analysis methods
- `source/core/report-engine.md` updated with 12 new Architecture Intelligence sections
- `source/references/examples.md` updated with architecture examples

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Evidence Engine unchanged
- Explainability Engine unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Install Scripts unchanged
- Backward compatible with v2.2.0

## [2.2.0] - 2026-07-10

### Highlights

Evidence-driven engineering auditing. Every conclusion backed by explicit evidence and transparent reasoning. Complete backward compatibility with all previous versions.

### Added

- **Evidence Chain** — every finding includes Detection Method, Observed Evidence, Engineering Reasoning, Engineering Impact, Recommendation, Verification Method
- **Evidence Quality Classification** — Direct Evidence, Strong Evidence, Indirect Evidence, Weak Evidence, Assumption, Not Verified; affects confidence but not severity
- **Detection Source** — Static Analysis, Repository Structure, Configuration Analysis, Dependency Analysis, Build Output, ESLint, TypeScript, Security Inspection, Runtime Observation, Documentation Review, Manual Engineering Reasoning
- **Finding Lifecycle** — Detected, Verified, Fixed, Reopened, Deprecated, Ignored, Accepted Risk; historical reports consulted when available
- **Recommendation Classification** — Bug Fix, Refactor, Architecture, Performance, Security, Documentation, Developer Experience, Infrastructure, Testing, Technical Debt; independent of Severity and Priority
- **Confidence Justification** — every confidence score must include an explanation; no bare percentages
- **Evidence Summary** — new report section summarizing audit evidence quality
- **Engineering Assumptions** — explicit documentation of all inferences with reason, confidence, and verification requirements
- **Analysis Trace** — execution trace showing exactly what was analyzed and what was skipped
- **Report Completeness Score** — new metric measuring audit completeness (separate from Health Score, Overall Reliability, and Certification)
- **Explain Successful Gates** — Quality Gate Summary now explains why each gate passed with evidence

### Changed

- `source/SKILL.md` updated with v2.2.0 Evidence & Analysis Engine features
- `source/SKILL.md` Finding Format extended with Evidence Chain, Evidence Quality Classification, Detection Source, Finding Lifecycle, Recommendation Classification, Confidence Justification
- `source/SKILL.md` Report Template extended with Evidence Summary, Engineering Assumptions, Analysis Trace, Report Completeness
- `source/SKILL.md` Quality Gate Summary updated to explain successful gates
- `source/references/explainability.md` updated with Evidence Chain format
- `source/references/finding-classification.md` updated with Finding Lifecycle and Recommendation Classification
- `source/references/confidence-model.md` updated with Confidence Justification requirements
- `source/core/report-engine.md` updated with new sections and v2.2.0 finding fields
- `source/references/examples.md` updated with v2.2.0 evidence chain examples

### Not Modified

- 13 Quality Gates unchanged
- Security Gate 2.0 unchanged
- All four operational modes preserved
- Certification Engine unchanged
- Configuration System unchanged
- Plugin System unchanged
- Exit codes unchanged
- SSOT Architecture unchanged
- Install Scripts unchanged
- Backward compatible with v2.1.0

## [2.1.0] - 2026-07-10

### Highlights

Documentation rewrite. All GitHub-facing Markdown files rewritten as professional engineering documentation. No functional changes.

### Added

- `docs/philosophy.md` -- engineering philosophy, design goals, and non-goals
- `CONTRIBUTING.md` -- contributor guide with development workflow, coding standards, documentation standards, PR expectations, and review checklist
- `SUPPORT.md` -- troubleshooting guide with installation issues, skill activation, report interpretation, and bug reporting checklist

### Changed

- `README.md` -- rewritten as professional introduction; removed duplicated feature list and feature matrix; removed marketing language
- `CHANGELOG.md` -- rewritten in Keep a Changelog format; removed redundant "Not Modified" blocks; removed duplicated policy tables
- `CONTRIBUTING.md` -- rewritten as contributor guide with development workflow, coding standards, documentation standards, and review checklist
- `SECURITY.md` -- rewritten with responsible disclosure policy, supported versions, scope, severity handling, and response expectations
- `SUPPORTED.md` -- reduced duplication; added support level definitions; removed duplicated framework profiles and policy tables
- `SUPPORT.md` -- rewritten as troubleshooting guide with installation issues, skill activation, report interpretation, and bug reporting checklist

### Removed

- Duplicated feature descriptions (README features list vs feature matrix)
- Duplicated compatibility matrices (README vs SUPPORTED.md)
- Duplicated policy tables (README, SUPPORTED.md, CHANGELOG.md)
- Duplicated framework profiles tables (README, SUPPORTED.md)
- Redundant "Not Modified" blocks from CHANGELOG entries
- Marketing language and superlatives from all documentation

## [2.0.1] - 2026-07-09

### Highlights

Documentation consistency and terminology fixes. No functional changes.

### Changed

- Moved `source/references/decision-engine.md` to `source/core/decision-engine.md`
- Moved `source/references/report-engine.md` to `source/core/report-engine.md`
- Fixed terminology: "Engineering Policy Engine" to "Policy Engine"
- Fixed terminology: "plugin SDK" to "Plugin SDK"
- Fixed terminology: "Explainability" to "Explainability Engine"
- Updated install scripts to copy core/ and plugins/ directories

## [2.0.0] - 2026-07-09

### Highlights

Extensible engineering platform. Introduces Plugin SDK, Rule Registry, Framework Profiles, Certification Profiles, Policy Engine, and Rule Versioning. Complete backward compatibility with v1.9.0.

### Added

- Plugin SDK with registration points for rules, report sections, framework knowledge, recommendations, validation steps, and configuration options
- Rule Registry with semantic versioning, lifecycle management, and framework scoping
- Framework Profiles for 14 frameworks (React, Next.js, Vue, Angular, Electron, Node.js, Express, Fastify, NestJS, Cloudflare Workers, Cloudflare Pages, Supabase, Vite, Hono)
- Certification Profiles (Default, Production, Enterprise, Startup, Open Source, Educational, Minimal, Strict)
- Policy Engine with configurable severity thresholds, blocking rules, and documentation requirements
- Rule Versioning with introduced, modified, deprecated, and replacement fields
- Extension Marketplace Foundation with documented plugin layout and distribution architecture
- Self Validation with duplicate detection, reference validation, and consistency checks
- Performance Optimization with lazy loading and dependency-aware loading
- Architecture Documentation with component relationships and dependency diagrams
- New directories: `source/core/`, `source/plugins/`

### Changed

- `source/SKILL.md` refactored as orchestration layer with pointers to core, plugin, and reference documents
- `README.md` updated with new source layout and feature descriptions
- `SUPPORTED.md` updated with framework profiles and certification policies

## [1.9.0] - 2026-07-09

### Highlights

Modular engineering architecture. SKILL.md becomes the orchestration layer with 7 dedicated reference documents. Every finding explains itself. Complete backward compatibility with v1.8.2.

### Added

- Explainability Engine with Observed Evidence, Applicable Rule, Reasoning, Engineering Impact, and Classification Justification
- Decision Pipeline: Evidence Collection, Rule Matching, Risk Analysis, Classification, Severity Calibration, Release Impact Assessment, Report Generation
- Single Source of Decision Rules for report generation, Health Score, Grade, Certification, Priority Matrix, and Release Blockers
- Traceable Certification showing which gates passed, which blockers exist, and which findings contributed
- Explainable Health Score with documented category weights, deduction rules, and final calculation
- Report Engine with 37 documented section responsibilities
- Engineering Knowledge Base with reusable guidance for each finding category
- Consistency Validation Engine for automatic verification before report production
- 7 new reference documents: decision-engine.md, report-engine.md, release-engine.md, confidence-model.md, finding-classification.md, health-score.md, explainability.md

### Changed

- `source/SKILL.md` refactored as orchestration layer
- Finding Format extended with Explainability Block

## [1.8.2] - 2026-07-09

### Highlights

Release blocker engine and report precision. Improves decision engine, report quality, and engineering accuracy. Complete backward compatibility with v1.8.1.

### Added

- Release Blocker Engine with rule-based classification (Release Blocker, Conditional Blocker, Engineering Recommendation, Informational)
- Warning Analyzer with per-category lint/diagnostics breakdown
- Health Score Explanation with weighted breakdown and improvement path
- Grade Justification with strengths and weaknesses for every letter grade
- Finding Impact Analysis with Engineering Cost, Estimated Fix Time, and Risk if Ignored
- Improvement Delta comparing current inspection with prior
- Certification Confidence Model with five metrics plus Overall Reliability
- Engineering Priority Matrix with Priority, Business Impact, Engineering Effort, Risk, and Recommended Sprint
- Release Decision Summary with clear decision, reason, and remaining work
- Report Consistency with internal consistency enforcement

## [1.8.1] - 2026-07-08

### Highlights

Report quality and decision support. Improves report usability, engineering insight, and human decision support. Complete backward compatibility with v1.8.0.

### Added

- Executive Engineering Dashboard with compact top-of-report view
- Health Score Formula with weighted category/weight/score/contribution breakdown
- Confidence Model 2.0 with Analysis, Evidence, Verification, Runtime, Repository Coverage, and Overall Reliability
- Risk Matrix with findings by severity and blocking split
- Engineering Effort Estimation per finding and repository-wide
- Smart Finding Classification with engineering categories
- Certification Checklist at a glance
- Trend Summary with Health Score progression
- Runtime Capability Disclosure
- Execution Metrics
- Repository Quality Grade (A+ to F)
- Recommendation Engine with Priority, Effort, Impact, Prerequisites, Verification

## [1.8.0] - 2026-07-08

### Highlights

Configurable engineering platform. Introduces Policy Engine, Project Configuration, Profiles, Baseline, Ignore, Incremental Inspection, PR Analysis, Machine-Readable Reports, Plugin Architecture, and Universal Compatibility. Complete backward compatibility with v1.7.0.

### Added

- Policy Engine with configurable certification rules
- Project Configuration via `finalcode.config.json` or `.finalcode/config.json`
- 11 Project Profiles (Production, Enterprise, Open Source, Library, CLI, Browser Extension, Desktop, Web Application, API, Mobile, MVP)
- Baseline System with `.finalcode/baseline.json`
- Ignore System with `.finalcodeignore`
- Incremental Inspection (Full, Incremental, Dependency Based)
- Pull Request Analysis with branch-vs-target comparison
- Machine-Readable Reports (JSON and SARIF 2.1.0)
- Plugin Architecture for framework-specific extensions
- Universal Compatibility with automatic framework detection
- Performance Improvements with reused analysis
- Repository Portability across language, framework, and OS

## [1.7.0] - 2026-07-08

### Highlights

Engineering intelligence. Extends audit with decision-making, trend, and planning intelligence. Complete backward compatibility with v1.6.x.

### Added

- Decision Intelligence with structured Decision Analysis for non-automatable findings
- Repository Evolution comparing current execution against prior runs
- Smart Finding Classification (Safe, Needs Review, Unsafe)
- Deployment Intelligence with environment suitability analysis
- Automatic Verification Pipeline for Repair Mode
- Intelligent Repair Stop when only human decisions remain
- Executive Decision Summary
- Engineering Roadmap with prioritized work items
- Release Readiness Predictor
- Human Override Awareness with `.finalcode/OVERRIDES.md`

## [1.6.2] - 2026-07-09

### Changed

- Corrected project ownership: FinalCode is independent, not affiliated with OpenCode
- Removed "official" claims from all documentation

## [1.6.1] - 2026-07-08

### Added

- Version Compatibility section in README
- Compatibility Matrix with support levels for 18 platforms
- Feature Matrix with status for all features
- SUPPORTED.md with support policy
- Table of Contents in README

## [1.6.0] - 2026-07-08

### Added

- Root Cause Intelligence with classification and prevention
- Repository Health Score (0-100) across 10 categories
- Engineering Metrics (complexity, duplication, type coverage, documentation coverage)
- Historical Trend Analysis via `.finalcode/TREND.md`
- Baseline Analysis via `.finalcode/BASELINE.md`
- Runtime Behavior Analysis
- Executive Engineering Summary
- Commit Assistance with Conventional Commits
- Pull Request Assistance
- Change Budget and Regression Protection

## [1.5.0] - 2026-07-08

### Added

- Security Gate 2.0 with 14 categories and ~60 check items
- Testing Gate with unit, integration, and E2E test evaluation
- Documentation Standards for all engineering artifacts
- FinalCode Certification Report with 37 sections and exit codes
- Evidence-Based Findings with stable IDs
- Confidence Breakdown per category
- Repository Coverage with transparency metrics

## [1.4.0] - 2026-07-08

### Added

- Repository Health Score (0-100)
- Engineering Metrics (complexity, duplication, type coverage)
- Executive Engineering Summary

## [1.3.0] - 2026-07-08

### Added

- Plugin Architecture for framework-specific extensions
- Universal Compatibility with automatic framework detection
- Repository Portability

## [1.2.0] - 2026-07-08

### Added

- Four Operational Modes (Inspect, Repair, Refactor, Certify)
- Project Configuration via `finalcode.config.json`
- 11 Project Profiles

## [1.1.0] - 2026-07-08

### Added

- 13 Quality Gates
- Security Gate

## [1.0.0] - 2026-07-08

### Added

- Core certification logic
- Basic report generation
- Four operational modes
- Evidence-based findings
- Deterministic auditing
