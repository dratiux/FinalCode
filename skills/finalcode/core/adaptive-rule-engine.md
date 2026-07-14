# Adaptive Rule Engine

## Purpose

Every engineering rule must explicitly define when it applies. Rules are evaluated after repository classification so that certification requirements adapt to project context automatically.

## Rule Classification

Every rule in the Rule Registry must be classified into one of four categories:

### Always Required

Rules that apply to every repository regardless of project type, architecture, or deployment target. These represent universal engineering standards.

Examples:
- No hardcoded secrets
- No known vulnerable dependencies
- Valid README file
- No malicious code

### Context Required

Rules that apply only when specific project context is detected. The context conditions must be explicitly defined in the rule metadata.

Examples:
- Rate limiting: Required for REST APIs and SaaS, ignored for static websites
- Authentication: Required for production services, optional for internal tools
- Accessibility compliance: Required for public websites, optional for CLIs

### Optional

Rules that are never required for certification but provide engineering value when applied. These generate engineering recommendations rather than certification findings.

Examples:
- JSDoc comments on all functions
- Specific naming conventions
- Performance micro-optimizations

### Ignored

Rules that are explicitly skipped for the current project context. Every ignored rule must report the reason for skipping.

## Rule Metadata

Every rule must include the following context-aware metadata:

```yaml
rule_id: FC-TEST-001
name: Unit test coverage minimum
always_required: false
context_required:
  project_types:
    - SaaS
    - Enterprise
    - API
    - Library
    - CLI
    - Open Source
  conditions:
    - field: testing_strategy
      operator: exists
context_optional:
  project_types:
    - Brand Website
    - Portfolio
    - Internal Tool
context_ignored:
  project_types:
    - Experimental
    - Landing Page
```

## Evaluation Pipeline

```
Repository Classification
        |
        v
Load Active Certification Profile
        |
        v
For Each Rule in Rule Registry:
    |
    ├── Is rule Always Required?
    |       └── Yes → Apply rule
    |
    ├── Is rule Context Required?
    |       └── Does project match context conditions?
    |               ├── Yes → Apply rule
    |               └── No → Skip (report as Skipped with reason)
    |
    ├── Is rule Optional?
    |       └── Apply only as engineering recommendation
    |
    └── Is rule Ignored?
            └── Skip (report as Skipped with reason)
```

## Rule Applicability Report

Every rule evaluation must output:

- **Rule ID**: The unique rule identifier
- **Rule Name**: Human-readable rule name
- **Applicability**: Applied, Skipped, or Optional
- **Reason**: Explanation of why the rule was applied or skipped
- **Certification Profile**: The active profile that determined applicability
- **Context Dependency**: The project context attributes that influenced the decision
- **Confidence**: Confidence in the applicability decision

## Examples

| Rule | Context | Applicability | Reason |
|---|---|---|---|
| Unit test coverage > 80% | Brand Website | Optional | Brand websites do not require testing for certification |
| Unit test coverage > 80% | Enterprise API | Always Required | Enterprise APIs require testing for certification |
| Rate limiting configured | Static Website | Ignored | Static websites have no server-side rate limiting |
| Rate limiting configured | REST API | Always Required | REST APIs require rate limiting for production |
| WCAG AA compliance | Public SaaS | Always Required | Public-facing SaaS must be accessible |
| WCAG AA compliance | Internal CLI | Optional | Internal CLI tools have no accessibility requirements |

## Backward Compatibility

Rules without context-aware metadata default to Always Required to preserve previous behavior.
