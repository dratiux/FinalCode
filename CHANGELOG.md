# Changelog

All notable changes to FinalCode are documented in this file.

Format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/). This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
