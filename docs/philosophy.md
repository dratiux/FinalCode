# Engineering Philosophy

## Why FinalCode Exists

FinalCode exists because software teams need a reliable way to determine whether a repository is ready for production. Linters check syntax. Test runners check behavior. Security scanners check known vulnerabilities. None of these answer the question: "Is this project ready to ship?"

FinalCode answers that question by running a senior-engineering audit across 13 quality gates and producing a certification verdict with a clear exit code.

## Engineering Philosophy

FinalCode is not a code reviewer, linter, or formatter. It is a certification system. The distinction matters:

- **Code reviewers** suggest improvements. FinalCode certifies readiness.
- **Linters** enforce style rules. FinalCode enforces engineering standards.
- **Formatters** fix syntax. FinalCode fixes nothing unless explicitly asked.

FinalCode produces a verdict. The verdict is binary in its implications: either the project is ready to ship, or it is not. The "READY WITH WARNINGS" state exists for projects that meet mandatory requirements but have known issues that should be addressed.

## Evidence-First Auditing

Every finding must have objective technical evidence. FinalCode does not speculate about code quality. It inspects the repository, collects evidence, and classifies findings based on what it observes.

### Evidence Requirements

- Every finding must reference specific files, line numbers, or concrete observations
- Every recommendation must cite the technical reason for the recommendation
- Every severity level must include engineering justification
- Confidence below 90% is classified as "Needs Verification"
- Never invent issues. Never ignore verified issues.

### Determinism

The same repository state produces the same findings. FinalCode does not produce different results on different runs of the same code. This determinism is essential for baseline comparison and trend analysis.

## Certification Philosophy

Certification is a formal act. When FinalCode certifies a repository as "READY TO SHIP," it is making a statement about the engineering quality of that repository. This statement must be traceable.

### Traceability

Every certification decision shows exactly which gates passed, which blockers exist, and which findings contributed to the verdict. There are no hidden decisions.

### Conservative Defaults

FinalCode defaults to production-grade requirements. Projects that want relaxed standards must explicitly configure a policy (e.g., POLICY-STARTUP, POLICY-MINIMAL).

### Backward Compatibility

New versions never change existing behavior without explicit configuration. A project that worked with v1.7.0 works identically with v2.1.0 using the default policy.

## Decision Philosophy

Some findings can be fixed automatically. Others require human decisions. FinalCode distinguishes between these cases explicitly.

### Automatic Fixes

- Code style violations
- Unused imports
- Missing type annotations (where the type is inferrable)
- Simple refactoring patterns

### Human Decisions

- Architecture changes
- Breaking API changes
- Security policy decisions
- Trade-offs between performance and readability
- Framework or library migration decisions

FinalCode never makes a human decision automatically. When a finding requires human judgment, it says so explicitly and provides the context needed to make the decision.

### Decision Analysis

Every non-automatable finding includes a structured decision analysis:

- Why a human decision is required
- Available options
- Pros and cons of each option
- Estimated effort
- Risk level
- Certification impact
- Final recommendation

## Explainability Principles

FinalCode does not produce black-box verdicts. Every element of the report explains itself.

### Finding Self-Explanation

Every finding includes:

- **Observed Evidence**: What was found
- **Applicable Rule**: Which rule applies
- **Reasoning**: Why this is a finding
- **Engineering Impact**: What this means for the project
- **Classification Justification**: Why this severity level
- **Release Impact Justification**: Why this affects the certification

### Health Score Transparency

The Health Score is reproducible. Every deduction references the findings that caused it. The category weights, deduction rules, and maximum contributions are documented.

### Grade Justification

Every letter grade (A+ to F) explains why. The justification references specific strengths and weaknesses.

## Design Goals

1. **Certainty over ambiguity.** Every finding has evidence. Every verdict has traceability.
2. **Simplicity over comprehensiveness.** The 13 quality gates cover the essential engineering disciplines. Adding more gates increases noise without proportional value.
3. **Actionability over information.** Every finding includes a recommendation. Every recommendation includes an effort estimate.
4. **Determinism over randomness.** Same code, same findings. No surprises.
5. **Transparency over authority.** The report shows its reasoning. The Health Score shows its calculation. The certification shows its derivation.

## Non-Goals

1. **FinalCode is not a code reviewer.** It does not suggest style improvements or readability enhancements unless they affect a quality gate.
2. **FinalCode is not a test framework.** It does not write or run tests. It evaluates test coverage and configuration.
3. **FinalCode is not a security scanner.** It does not find all vulnerabilities. It checks security practices against established standards.
4. **FinalCode is not a CI/CD tool.** It does not integrate with pipelines. It produces artifacts that pipelines can consume.
5. **FinalCode is not a replacement for human review.** It provides evidence and recommendations. Humans make the final decisions.
