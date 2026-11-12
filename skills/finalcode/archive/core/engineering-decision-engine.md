# Engineering Decision Engine

## Purpose

Introduce a dedicated reasoning stage before finding classification. Every observation must be evaluated to determine whether it is an engineering defect, an intentional decision, a contextual trade-off, or an acceptable architectural compromise before it is reported.

## Observation Classification

Every observation must be classified into one of the following categories:

### Confirmed Defect

An unambiguous error that violates engineering principles, security best practices, or correctness requirements. These findings always require action.

Examples:
- Hardcoded secrets
- SQL injection vulnerability
- Broken authentication logic
- Data loss risk

### Engineering Recommendation

An improvement that would enhance quality, maintainability, or performance but is not a defect. The current implementation works correctly.

Examples:
- Extract duplicated logic into a shared utility
- Add input validation
- Improve error messages

### Architecture Decision

A deliberate structural choice made to satisfy specific requirements. These should be recognized, not reported as defects.

Examples:
- Monolithic architecture for a small team
- Serverless for variable workloads
- Single database for simplicity

### Accepted Trade-off

A conscious compromise where the team chose a suboptimal approach in one dimension to gain in another. These should be documented, not flagged.

Examples:
- No automated tests to accelerate initial launch
- Reduced observability due to team size constraints
- Using a monolithic frontend for consistency

### Contextual Constraint

A limitation imposed by the project environment that is outside the team's control. These should be acknowledged, not penalized.

Examples:
- No backend (static site constraint)
- Limited by client infrastructure requirements
- Regulatory constraints on technology choices

### Intentional Simplification

A deliberate reduction in complexity to achieve faster delivery, lower maintenance, or improved developer experience. These should be recognized.

Examples:
- Using mailto for contact forms instead of a backend service
- Skipping state management for a small app
- Using a single-page approach instead of routing

### Unknown Decision

An observation where the reasoning cannot be determined from available evidence. These require human verification.

### Unsupported Pattern

A pattern that is valid in other contexts but not supported by the current project type or certification profile.

## Decision Pipeline

```
Observation
    │
    v
Evidence Collection
    │
    v
Pattern Matching
    │
    v
Context Evaluation
    │
    v
Intent Analysis
    │
    v
Classification
    │
    v
Confidence Assessment
    │
    v
Finding Generation or Recognition
```

## Rules

- Every observation must be classified before it becomes a finding.
- Classification requires evidence. Never classify without supporting evidence.
- When evidence is insufficient, classify as Unknown Decision and request human verification.
- When multiple classifications are possible, select the best-supported one and document alternatives.

## Integration

The Engineering Decision Engine runs after Adaptive Rule Evaluation and before Finding Classification. It is a new stage in the certification pipeline.
