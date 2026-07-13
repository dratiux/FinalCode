# FinalCode Policy Evaluation

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Reports policy consultation, decision, reason, evidence, confidence, and version for every engineering decision |
| Execution Stage | EXECUTION |
| Loaded By | Policy Engine |
| Dependencies | Policy Engine, Policy Profiles |
| Outputs | Policy evaluation report with full decision details |
| Consumers | Policy Engine, Report Engine, User |
| Applies To | All engineering operations |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| decisionType | string | Yes | Operating mode |
| context | object | Yes | Current context |
| activePolicies | array | Yes | Policy Profile |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| policyEvaluation | object | Complete policy evaluation |
| policyConsulted | string | Policy consulted |
| decisionTaken | string | Decision taken |
| reason | string | Reason for decision |
| evidence | object | Supporting evidence |
| confidence | number | Decision confidence |
| policyVersion | string | Policy version |

### Preconditions

- Policy must be consulted
- Decision context must be available

### Postconditions

- Policy evaluation is recorded
- Decision is documented
- Evidence is captured

## Purpose

Every engineering decision must report policy consulted, decision taken, reason, evidence, confidence, and policy version. No silent decisions. This ensures transparency and accountability.

**Why this matters:** Transparent decision-making enables auditing, learning, and improvement. By documenting every policy decision, FinalCode creates a complete audit trail.

## Evaluation Components

### Policy Consulted

| Component | Description |
|-----------|-------------|
| Policy name | Name of policy consulted |
| Policy category | Category of policy |
| Policy version | Version of policy |
| Consultation time | When policy was consulted |

### Decision Taken

| Component | Description |
|-----------|-------------|
| Decision | Decision made |
| Decision type | Type of decision |
| Decision scope | Scope of decision |
| Decision impact | Impact of decision |

### Reason

| Component | Description |
|-----------|-------------|
| Primary reason | Main reason for decision |
| Supporting reasons | Additional reasons |
| Context | Contextual factors |
| Constraints | Constraints considered |

### Evidence

| Component | Description |
|-----------|-------------|
| Supporting evidence | Evidence supporting decision |
| Counter evidence | Evidence against decision |
| Data sources | Sources of evidence |
| Confidence level | Confidence in evidence |

### Confidence

| Component | Description |
|-----------|-------------|
| Overall confidence | Overall decision confidence |
| Evidence confidence | Confidence in evidence |
| Policy confidence | Confidence in policy |
| Context confidence | Confidence in context |

### Policy Version

| Component | Description |
|-----------|-------------|
| Policy version | Version of policy used |
| Policy owner | Owner of policy |
| Policy status | Status of policy |
| Policy compatibility | Compatibility with other policies |

## Evaluation Output

```
POLICY EVALUATION
==================================================
Decision Type: Repair
Policy Consulted: Security Policy

Policy Evaluation:
  Policy Name: Security Policy
  Policy Category: Security
  Policy Version: 1.2.0
  Consultation Time: 2026-07-12T10:00:00Z

Decision Taken:
  Decision: Safe to repair with verification
  Decision Type: Approval
  Decision Scope: File-level
  Decision Impact: Low risk

Reason:
  Primary: All security policies satisfied
  Supporting: No vulnerabilities detected
  Context: Production repository
  Constraints: Preserve existing architecture

Evidence:
  Supporting: Security gate passed, No vulnerabilities
  Counter: None
  Data sources: Security audit, Vulnerability scan
  Confidence: High

Confidence:
  Overall: 95%
  Evidence: 98%
  Policy: 95%
  Context: 92%

Policy Version:
  Version: 1.2.0
  Owner: Security Team
  Status: Active
  Compatibility: Compatible with all policies

Evaluation Status: ✅ Policy consulted
==================================================
```

## Architecture Explainability

### Responsibilities

- Record policy consultation
- Document decision taken
- Capture reason
- Record evidence
- Calculate confidence
- Track policy version

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Evaluation recording
- Decision documentation
- Evidence capture

### Consumed Decisions

- Policy (from Policy Engine)
- Active Policies (from Policy Profile)

### Produced Decisions

- Policy evaluation
- Decision documentation
- Evidence record
