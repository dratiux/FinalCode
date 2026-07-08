# Changelog

All notable changes to FinalCode will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
- **CHANGE_REPORT.md** — official engineering change log with stable finding IDs (FC-SEC-001, FC-CODE-003, etc.)
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
