# FinalCode Explainability Engine

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Defines how findings and decisions are explained and traced |
| Execution Stage | DECISION, REPORT |
| Loaded By | Report Engine, Decision Engine |
| Dependencies | Finding Classification |
| Outputs | Explainability blocks, evidence chains, decision traces |
| Consumers | Report Engine, User |
| Applies To | All audits |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| finding | object | Yes | Decision Engine |
| evidenceChain | object | Yes | Evidence collection |
| ruleMatch | object | Yes | Rule Registry |
| riskAnalysis | object | Yes | Risk Analysis |
| classification | object | Yes | Classification |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| explainabilityBlock | object | Complete explanation of the finding |
| evidenceChain | object | Detection method, observed evidence, reasoning, impact, recommendation, verification |
| decisionTrace | array | Step-by-step decision path |

### Preconditions

- Finding must be classified
- Evidence must be collected
- Rule must be matched
- Risk analysis must be complete

### Postconditions

- Every finding has a complete explainability block
- Every decision is traceable to evidence
- Every assumption is documented
- Alternative decisions are considered

### Required Evidence

| Evidence | Purpose |
|----------|---------|
| Observed evidence | What was found in the repository |
| Applicable rule | Which rule was matched |
| Engineering reasoning | How evidence led to conclusion |
| Engineering impact | What the impact is |
| Severity justification | Why this severity was chosen |
| Classification justification | Why this classification was chosen |
| Release impact justification | Why this blocks/doesn't block release |
| Alternative decisions | What other options were considered |
| Human assumptions | What assumptions were made |
| Confidence factors | What affects confidence |

### Generated Decisions

| Decision | Rule |
|----------|------|
| Explainability block content | Required elements specification |
| Evidence chain format | Standardized evidence presentation |
| Decision trace completeness | All steps documented |

### Possible Outcomes

| Outcome | Condition |
|---------|-----------|
| Complete explanation | All required elements present |
| Partial explanation | Some elements unavailable (documented) |
| No explanation | Insufficient evidence (classified as Needs Verification) |

The Explainability Engine ensures that every engineering decision produced by FinalCode is explainable and auditable. Every finding must explain itself, and every decision must be traceable.

## Purpose

The Explainability Engine serves three goals:

1. **Transparency** — readers understand why each decision was made
2. **Auditability** — every decision can be traced back to evidence and rules
3. **Trust** — clear reasoning builds confidence in the certification

## Finding Self-Explanation

Every finding must include an Explainability Block that answers:

### Required Elements

| Element | Question It Answers |
|---|---|
| Observed Evidence | What did FinalCode observe in the repository? |
| Applicable Rule | Which rule or criterion does this violate? |
| Reasoning | How did FinalCode reason from evidence to conclusion? |
| Engineering Impact | What is the actual engineering impact? |
| Severity Justification | Why was this severity level selected? |
| Classification Justification | Why was this classification selected? |
| Release Impact Justification | Why does or doesn't this block release? |
| Alternative Decisions Considered | What other options were considered? |
| Human Assumptions | What assumptions did FinalCode make? |
| Confidence Factors | What factors affect confidence in this finding? |
| Context Analysis (v3.0.0) | What framework and project context was considered? |
| False Positive Analysis (v3.0.0) | What false positive patterns were checked? |
| Alternative Explanations (v3.0.0) | What legitimate patterns resemble this finding? |

### Evidence Chain (v2.2.0)

Every finding must include a complete evidence chain that documents how the conclusion was reached:

| Element | Question It Answers |
|---|---|
| Detection Method | How was this finding detected? |
| Observed Evidence | What concrete evidence was found in the repository? |
| Engineering Reasoning | How did FinalCode reason from evidence to conclusion? |
| Engineering Impact | What is the actual engineering impact? |
| Recommendation | What should be done about it? |
| Verification Method | How can this finding be verified independently? |
| Context Analysis (v3.0.0) | What framework and project context was considered? |
| False Positive Analysis (v3.0.0) | What false positive patterns were checked? |
| Alternative Explanations (v3.0.0) | What legitimate patterns resemble this finding? |

**Format:**
```
EVIDENCE CHAIN
-------------------------------------------------
Detection Method:
  Static Analysis — ESLint rule no-console detected console.log usage.

Observed Evidence:
  src/utils/logger.ts:15 — console.log("Debug: user login");
  src/utils/logger.ts:23 — console.log("Debug: API response", data);
  src/utils/logger.ts:31 — console.log("Debug: database query", query);

Engineering Reasoning:
  Console.log statements in production code expose internal state to
  anyone with browser DevTools or server log access. The project has
  a proper logger (winston) configured in src/config/logger.ts but
  these files use console.log instead. This is a security and
  maintainability concern because:
  1. Debug output may contain sensitive data (API responses, queries)
  2. Console.log is not configurable for production log levels
  3. Performance impact in high-traffic scenarios

Engineering Impact:
  Low-to-medium security risk. Debug output may expose sensitive
  data in production. Maintainability impact is low.

Recommendation:
  Replace console.log with the configured winston logger at
  appropriate log levels (debug for development, warn/error for
  production).

Verification Method:
  1. Search codebase for remaining console.log statements
  2. Verify winston logger is configured and available
  3. Check that replacement uses appropriate log levels
```

### Explainability Block Format

```
EXPLAINABILITY
-------------------------------------------------
Observed Evidence:
  Hardcoded API key found in src/config.ts at line 42.
  Key appears to be a production API key based on format and context.

Applicable Rule:
  Security Gate 2.0 — Secrets Management: "No hardcoded secrets
  in source code. Use environment variables or secret managers."

Reasoning:
  The key is hardcoded directly in source code, not loaded from
  an environment variable or secret manager. This is a verified
  security vulnerability because:
  1. The key is visible to anyone with repository access
  2. The key will be included in build artifacts
  3. The key cannot be rotated without code changes

Engineering Impact:
  Immediate security risk — unauthorized access to the API
  using the exposed credentials.

Severity Justification:
  Selected Critical because:
  - Immediate security risk (credentials exposed)
  - Data loss potential (unauthorized API access)
  - No mitigation required to exploit (key is in source)

Classification Justification:
  Selected Security Vulnerability because:
  - Verified security weakness
  - Meets Security Gate 2.0 criteria
  - Objective evidence supports classification

Release Impact Justification:
  Classified as Release Blocker because:
  - Critical severity security vulnerability
  - Blocks all deployment targets
  - Must be resolved before any release

Alternative Decisions Considered:
  1. Engineering Recommendation — rejected because this is a
     verified security vulnerability, not an improvement
  2. Needs Verification — rejected because evidence is conclusive
  3. Low severity — rejected because credentials are immediately
     exploitable

Human Assumptions:
  - Assumed the key is a production key based format
  - Assumed the repository is not private/internal
  - If this is a test key or the repository is fully internal,
    the severity may be reduced

Confidence Factors:
  + High confidence: key format matches production API keys
  + High confidence: key is in source code, not config
  - Medium confidence: assumed production environment
  - Low confidence: unknown if repository is public
```

## Decision Audit Trail

Every decision must be traceable through the pipeline:

### Audit Trail Format

```
AUDIT TRAIL
-------------------------------------------------
Finding: FC-SEC-001
Pipeline Stage: Risk Analysis → Classification → Severity → Release Impact

Evidence Collection:
  Input: src/config.ts:42
  Output: Hardcoded API key detected

Rule Matching:
  Input: Security Gate 2.0 — Secrets Management
  Output: Rule matched

Risk Analysis:
  Input: Evidence + Rule
  Output: High impact, High probability → Critical risk

Classification:
  Input: Risk Analysis + Rule type
  Output: Security Vulnerability

Severity Calibration:
  Input: Risk Analysis + Impact assessment
  Output: Critical

Release Impact Assessment:
  Input: Classification + Severity + Deployment context
  Output: Release Blocker

Report Generation:
  Input: All previous stages
  Output: Finding entry with Explainability Block
```

## Consistency Validation

Before emitting any finding, the Explainability Engine validates:

1. **Evidence matches conclusion** — the conclusion is supported by the evidence
2. **Rule matches classification** — the classification matches the rule type
3. **Risk matches severity** — the severity reflects the risk analysis
4. **Classification matches release impact** — the release impact is appropriate
5. **No contradictory statements** — the explanation is internally consistent

If validation fails, the inconsistency must be corrected or flagged.

## Human Assumptions

Every finding must declare its assumptions:

### Assumption Categories

| Category | Example |
|---|---|
| Environment | Assumed production environment |
| Repository | Assumed public repository |
| Framework | Assumed React conventions |
| Configuration | Assumed default configuration |
| Dependencies | Assumed latest stable versions |

**Rule:** If assumptions are wrong, the finding may need to be re-evaluated. State assumptions explicitly so humans can verify them.

## Confidence Factors

Every finding must list factors that affect confidence:

### Positive Factors (+)

- Direct evidence from execution
- Multiple independent sources confirming
- Deterministic/verifiable check
- High test coverage for affected code

### Negative Factors (-)

- Incomplete evidence
- Single source of information
- Non-deterministic behavior
- Unknown runtime environment
- Assumed configuration

## Context Analysis (v3.0.0)

Every finding must document the context considered during analysis:

### Context Factors

| Factor | Question It Answers |
|---|---|
| Framework | What framework is being used and how does it affect this finding? |
| Project Type | What type of project is this (library, application, monorepo)? |
| Environment | What environment is this deployed to (browser, server, edge)? |
| Build System | What build system is used and how does it affect this finding? |
| Testing Strategy | What testing strategy is used and how does it affect this finding? |

### Context Analysis Format

```
CONTEXT ANALYSIS
-------------------------------------------------
Framework:
  React 18.2.0 — Hooks rules apply, functional components expected

Project Type:
  Web application — client-side rendering, interactive UI

Environment:
  Browser — DOM manipulation, event handling

Build System:
  Vite — modern bundler, ES modules

Testing Strategy:
  Jest + React Testing Library — component testing
```

**Rule:** Context analysis must be specific to the finding and explain how context affects interpretation.

## False Positive Analysis (v3.0.0)

Every finding must document false positive checks performed:

### False Positive Categories

| Category | Description | Action |
|----------|-------------|--------|
| Known Legitimate | Recognized legitimate pattern | Filter as false positive |
| Context Dependent | Valid in certain contexts | Flag for manual review |
| Framework Specific | Valid in specific framework | Adjust confidence |
| Version Specific | Valid in specific version | Document version constraint |
| Configuration Dependent | Valid with specific configuration | Check configuration |

### False Positive Analysis Format

```
FALSE POSITIVE ANALYSIS
-------------------------------------------------
Pattern Checked: Type assertions in TypeScript
Context: Third-party library integration
Analysis: Type assertions may be necessary for external data
Verdict: False positive if justified by context

Pattern Checked: Console.log in development
Context: Debug code gated by NODE_ENV
Analysis: Development logging is necessary
Verdict: False positive if development-only
```

**Rule:** False positive analysis must document all patterns checked and their verdicts.

## Alternative Explanations (v3.0.0)

Every finding must document alternative explanations considered:

### Alternative Explanation Format

```
ALTERNATIVE EXPLANATIONS
-------------------------------------------------
Pattern: Type assertions in TypeScript
Context: Third-party library integration
Analysis: Type assertions may be necessary for external data
Verdict: False positive if justified by context

Pattern: Console.log in development
Context: Debug code gated by NODE_ENV
Analysis: Development logging is necessary
Verdict: False positive if development-only
```

**Rules:**
- Every finding must document at least one alternative explanation considered
- If no alternative applies, state "No alternative explanations identified"
- Alternative explanations must be specific to the finding context
- Alternative explanations inform confidence adjustment

## Report-Level Explainability

Beyond individual findings, the report itself must be explainable:

### Certification Traceability

```
READY WITH WARNINGS

Generated from:
  13/13 Gates Passed
  0 Release Blockers
  2 Conditional Blockers
  9 Engineering Recommendations
  31 Informational Findings

Confidence: 85% Overall Reliability
  Static Analysis: 95%
  Testing: 80%
  Runtime: 70%
  Documentation: 90%
  Deployment: 95%
```

### Health Score Traceability

```
Health Score: 90 / 100

Calculated from:
  Security:      96 × 20% = 19.2
  Architecture:  88 × 15% = 13.2
  Maintainability: 90 × 15% = 13.5
  Performance:   85 × 10% = 8.5
  Documentation: 92 × 10% = 9.2
  Accessibility: 94 × 10% = 9.4
  Testing:       82 × 10% = 8.2
  Type Safety:   95 × 5% = 4.8
  GitHub Ready:  90 × 5% = 4.5
  Dead Code:     88 × 0% = 0.0

Deductions caused by:
  FC-TEST-001: -1.8 (testing coverage below target)
  FC-PERF-001: -1.5 (bundle size above target)
```

## Integration with Other Engines

The Explainability Engine consumes:

- **Decision Engine** (see `../core/decision-engine.md`) — pipeline stages and results
- **Finding Classification** (see `finding-classification.md`) — classification rules
- **Release Engine** (see `release-engine.md`) — release impact assessment
- **Health Score** (see `health-score.md`) — calculation details

The Explainability Engine produces:

- Explainability Block (per finding)
- Audit Trail (per finding)
- Certification Traceability (report section)
- Health Score Traceability (report section)
