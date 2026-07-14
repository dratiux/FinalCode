# Certification Profiles

## Purpose

Introduce certification profiles that define which quality gates, rules, and thresholds apply to each project type. Certification requirements adapt to project context while maintaining identical engineering standards.

## Profile Definitions

Each profile defines the following dimensions:

### Mandatory Gates

Gates that must pass for certification. These gates always run and their results directly affect the certification verdict.

### Optional Gates

Gates that are recommended but do not block certification. Findings from optional gates appear in the report but never cause a NOT READY verdict.

### Ignored Gates

Gates that are not relevant to the project type and are skipped entirely. Every ignored gate must report the reason for skipping.

### Recommended Gates

Gates that are strongly recommended for engineering best practices. These are not required for certification but appear as engineering recommendations when skipped.

### Release Blockers

Specific rule categories within gates that block release. These adapt to project context - for example, authentication security is a release blocker for Enterprise but not for a static Brand Website.

### Minimum Documentation

Required documentation types for the project type (README, API docs, contributing guide, changelog, architecture docs, etc.).

### Minimum Testing

Required testing types for the project type (unit tests, integration tests, E2E tests, etc.).

### Minimum Security

Required security categories from Security Gate 2.0 for the project type.

### Deployment Expectations

Expected deployment configuration, environment variables, CI/CD requirements, and infrastructure checks.

### Certification Thresholds

Minimum health score, minimum grade, and pass/fail criteria specific to this profile.

## Available Profiles

### Default Certification

Preserves the existing FinalCode behavior exactly. All 13 quality gates are mandatory. All previous certification logic applies unchanged.

### Brand Website

| Dimension | Setting |
|---|---|
| Mandatory Gates | Architecture, Code Quality, Dependencies, Documentation |
| Optional Gates | Performance, Accessibility, UI Consistency |
| Ignored Gates | Type Safety (if no TypeScript), Testing |
| Release Blockers | Security vulnerabilities, Broken pages, Missing documentation |
| Minimum Testing | None |
| Minimum Security | HTTPS, CSP headers, Form security |

### Portfolio

| Dimension | Setting |
|---|---|
| Mandatory Gates | Code Quality, Dependencies, Documentation, UI Consistency |
| Optional Gates | Architecture, Performance, Accessibility |
| Ignored Gates | Testing, GitHub Readiness |
| Release Blockers | Broken assets, Security vulnerabilities |
| Minimum Testing | None |
| Minimum Security | HTTPS, Form security |

### SaaS

| Dimension | Setting |
|---|---|
| Mandatory Gates | All 13 quality gates |
| Optional Gates | — |
| Ignored Gates | — |
| Release Blockers | Security, Testing failures, Performance regressions, Documentation gaps |
| Minimum Testing | Unit tests, Integration tests |
| Minimum Security | All 14 categories |

### Enterprise

| Dimension | Setting |
|---|---|
| Mandatory Gates | All 13 quality gates |
| Optional Gates | — |
| Ignored Gates | — |
| Release Blockers | Security, Testing, Documentation, Architecture violations, Type errors |
| Minimum Testing | Unit tests, Integration tests, E2E tests |
| Minimum Security | All 14 categories + compliance requirements |

### API

| Dimension | Setting |
|---|---|
| Mandatory Gates | Architecture, Code Quality, Dependencies, Type Safety, Error Handling, Testing, Performance, Security, Documentation |
| Optional Gates | Accessibility, UI Consistency |
| Ignored Gates | — |
| Release Blockers | Security, Error handling gaps, Performance regressions, Missing API documentation |
| Minimum Testing | Unit tests, Integration tests |
| Minimum Security | Authentication, Authorization, Input validation, Rate limiting |

### Browser Extension

| Dimension | Setting |
|---|---|
| Mandatory Gates | Architecture, Code Quality, Dependencies, Security, Documentation |
| Optional Gates | Performance, UI Consistency, Accessibility |
| Ignored Gates | GitHub Readiness |
| Release Blockers | Security vulnerabilities, Permission violations, CSP violations |
| Minimum Testing | Unit tests |
| Minimum Security | Permissions, CSP, Data handling |

### Library

| Dimension | Setting |
|---|---|
| Mandatory Gates | Code Quality, Dependencies, Type Safety, Testing, Documentation |
| Optional Gates | Architecture, Performance, Security |
| Ignored Gates | Accessibility, UI Consistency, GitHub Readiness |
| Release Blockers | Type errors, Missing documentation, Security vulnerabilities in dependencies |
| Minimum Testing | Unit tests |
| Minimum Security | Dependency vulnerability scanning |

### CLI

| Dimension | Setting |
|---|---|
| Mandatory Gates | Code Quality, Dependencies, Type Safety, Error Handling, Testing, Documentation |
| Optional Gates | Architecture, Performance, Security |
| Ignored Gates | Accessibility, UI Consistency |
| Release Blockers | Error handling, Missing documentation, Security vulnerabilities |
| Minimum Testing | Unit tests |
| Minimum Security | Input validation, Dependency scanning |

### Open Source

| Dimension | Setting |
|---|---|
| Mandatory Gates | Code Quality, Dependencies, Type Safety, Testing, Documentation, GitHub Readiness |
| Optional Gates | Architecture, Performance, Security, Error Handling |
| Ignored Gates | — |
| Release Blockers | Security vulnerabilities, Missing documentation, CI failures |
| Minimum Testing | Unit tests |
| Minimum Security | Dependency scanning |

### Internal Tool

| Dimension | Setting |
|---|---|
| Mandatory Gates | Code Quality, Dependencies, Error Handling, Documentation |
| Optional Gates | Architecture, Type Safety, Testing, Performance, Security |
| Ignored Gates | Accessibility, UI Consistency, GitHub Readiness |
| Release Blockers | Data loss risks, Security vulnerabilities |
| Minimum Testing | None |
| Minimum Security | Authentication, Access control |

### Experimental

| Dimension | Setting |
|---|---|
| Mandatory Gates | Code Quality, Dependencies |
| Optional Gates | Architecture, Documentation, Security |
| Ignored Gates | Testing, Accessibility, UI Consistency, GitHub Readiness, Performance |
| Release Blockers | Security vulnerabilities, Malicious code |
| Minimum Testing | None |
| Minimum Security | Dependency scanning |

## Profile Selection

The active profile is selected by:

1. **Explicit configuration**: `profile: "enterprise"` in finalcode.config.json
2. **Automatic detection**: Project Classification Engine selects the best matching profile
3. **Command-line flag**: `--profile saas`
4. **Default**: Default Certification (preserves v4.3.0 behavior)

## Profile Overrides

Individual gates can be overridden within any profile:

```json
{
  "profile": "saas",
  "overrides": {
    "testing": "optional"
  }
}
```

## Backward Compatibility

Default Certification profile behaves exactly like previous FinalCode releases. All existing certification logic, gate definitions, thresholds, and verdicts remain unchanged when using Default profile.
