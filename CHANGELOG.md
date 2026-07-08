# Changelog

All notable changes to FinalCode will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
