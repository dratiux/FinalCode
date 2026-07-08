# Changelog

All notable changes to FinalCode will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
