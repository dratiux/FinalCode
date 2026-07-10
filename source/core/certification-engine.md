# FinalCode Certification Engine

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Orchestrates the complete certification pipeline from initialization to final output |
| Execution Stage | INITIALIZATION, VALIDATION, DETECTION, ANALYSIS, DECISION, POLICY, REPORT, CERTIFICATION |
| Loaded By | SKILL.md (orchestration layer) |
| Dependencies | Decision Engine, Policy Engine, Rule Registry, Report Engine, Plugin SDK |
| Outputs | Certification status (READY TO SHIP / READY WITH WARNINGS / NOT READY), exit code, final report |
| Consumers | User, CI/CD pipelines, OpenCode |
| Applies To | All audits |

The Certification Engine orchestrates the complete certification process. It coordinates the Policy Engine, Rule Registry, Decision Engine, and Report Engine to produce a deterministic, traceable certification result.

## Certification Pipeline

The certification pipeline has 8 stages:

```
1. INITIALIZATION
   ↓
2. VALIDATION
   ↓
3. DETECTION
   ↓
4. ANALYSIS
   ↓
5. DECISION
   ↓
6. POLICY EVALUATION
   ↓
7. REPORT GENERATION
   ↓
8. CERTIFICATION OUTPUT
```

### Stage 1: Initialization

- Load configuration
- Load active policy
- Load Rule Registry
- Load framework profiles
- Initialize Report Engine

### Stage 2: Validation

- Validate self-consistency (no duplicate rules, no broken references)
- Validate configuration
- Validate policy
- Validate plugin registrations
- Stop execution if validation fails

### Stage 3: Detection

- Detect project type and frameworks
- Load applicable framework profiles
- Merge framework-specific rules with Core rules
- Detect project structure

### Stage 4: Analysis

- Execute Quality Gate checks (13 gates)
- Execute Security Gate 2.0
- Apply Rule Registry rules
- Apply framework-specific rules
- Collect evidence for each finding

### Stage 5: Decision

- Classify findings (Confirmed Defect / Security Vulnerability / Engineering Recommendation)
- Calibrate severity (Critical / High / Medium / Low / Informational)
- Determine release impact
- Apply blocking rules
- Calculate Health Score

### Stage 6: Policy Evaluation

- Check blocking conditions
- Verify minimum score
- Check gate requirements
- Check documentation requirements
- Check testing requirements
- Determine certification status

### Stage 7: Report Generation

- Generate Executive Dashboard
- Generate all 37 report sections
- Apply Explainability Engine to all findings
- Apply Health Score Explanation
- Generate Certification Summary

### Stage 8: Certification Output

- Determine certification status (READY TO SHIP / READY WITH WARNINGS / NOT READY)
- Set exit code (0-3)
- Generate Executive Decision Summary
- Generate Migration Notes if applicable
- Output final report

## Certification Status

### READY TO SHIP

The project meets all requirements:
- No Critical or High findings blocking certification
- Health Score >= policy minimum
- All required gates pass
- All blocking conditions satisfied
- Exit code: 0

### READY WITH WARNINGS

The project meets minimum requirements but has warnings:
- No Critical findings blocking certification
- Some High or Medium findings present
- Health Score >= policy minimum
- Some non-required gates fail
- Exit code: 1

### NOT READY

The project does not meet requirements:
- Critical findings blocking certification
- Health Score < policy minimum
- Required gates fail
- Blocking conditions not satisfied
- Exit code: 2

### NO PROJECT FOUND

No valid project detected:
- Target path does not exist
- No recognized project structure
- Exit code: 3

## Exit Codes

| Code | Status | Meaning |
|---|---|---|
| 0 | READY TO SHIP | Project is production-ready |
| 1 | READY WITH WARNINGS | Project has warnings but is deployable |
| 2 | NOT READY | Project has blocking issues |
| 3 | NO PROJECT FOUND | No valid project detected |

## Evidence Collection

Every finding must have evidence:

```json
{
  "ruleId": "RULE-SEC-001",
  "evidence": {
    "file": "src/config.ts",
    "line": 42,
    "column": 5,
    "code": "API_KEY = \"sk-abc123\"",
    "context": "Hardcoded API key in source code",
    "expected": "Use environment variable for API key",
    "references": ["OWASP-S1", "CWE-798"]
  }
}
```

## Deterministic Results

The Certification Engine produces deterministic results:

- Same input → same output
- Same configuration → same output
- Same policy → same output
- No random behavior
- No external API calls
- No time-dependent behavior

## Performance

The Certification Engine optimizes performance:

- Lazy load reference documents
- Skip non-applicable gates
- Cache framework detection results
- Parallelize independent checks
- Avoid redundant analysis

## Error Handling

The Certification Engine handles errors gracefully:

- Invalid configuration → stop with error
- Invalid policy → stop with error
- Invalid Rule Registry → stop with error
- Plugin failure → skip plugin, continue with Core
- Analysis failure → skip analysis, report as unknown
- Report generation failure → use minimal report

## Self Validation

Before execution, the Certification Engine validates:

1. No duplicate rule IDs in Rule Registry
2. No duplicate finding IDs in report
3. No missing references
4. No invalid profiles
5. No broken plugin registrations
6. No invalid report sections
7. No inconsistent policies

If validation fails, execution stops with an error message identifying the issue.

## Architecture Explainability

### Responsibilities

- Orchestrate the complete certification pipeline
- Coordinate all engines
- Determine certification status
- Set exit code
- Handle errors gracefully

### Non-Responsibilities

- Classifying findings (Decision Engine)
- Generating the report (Report Engine)
- Loading policies (Policy Engine)
- Storing rules (Rule Registry)
- Calculating Health Score (Health Score Engine)

### Owned Decisions

- Pipeline orchestration
- Certification status determination
- Exit code assignment
- Error handling

### Consumed Decisions

- Classified findings (from Decision Engine)
- Policy evaluation (from Policy Engine)
- Report generation (from Report Engine)
- Health Score (from Health Score Engine)

### Produced Decisions

- Certification status (READY TO SHIP / READY WITH WARNINGS / NOT READY)
- Exit code (0-3)
- Final report

## Repository Discoverability

### Related Documents

- `core/decision-engine.md` — classifies findings
- `core/report-engine.md` — generates report
- `core/policy-engine.md` — provides policy
- `core/rule-registry.md` — provides rules
- `plugins/sdk.md` — loads plugins
- `plugins/profiles.md` — loads framework profiles
- `references/configuration.md` — provides configuration
- `references/architecture.md` — provides system overview

### Used By

- SKILL.md (orchestration layer)
- OpenCode (execution environment)
- User (final output)

### Depends On

- Decision Engine (for finding classification)
- Report Engine (for report generation)
- Policy Engine (for policy)
- Rule Registry (for rules)
- Plugin SDK (for plugins)
- Framework Profiles (for framework detection)
- Configuration System (for configuration)
