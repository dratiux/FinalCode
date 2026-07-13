# FinalCode Policy Dashboard

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Displays active profile, active policies, policy overrides, conflicts, decisions, and coverage |
| Execution Stage | REPORTING |
| Loaded By | All operating modes, Report Engine |
| Dependencies | Policy Engine, Policy Profiles, Policy Evaluation |
| Outputs | Policy dashboard with complete policy status |
| Consumers | Report Engine, User |
| Applies To | All engineering operations |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| activeProfile | object | Yes | Policy Profiles |
| activePolicies | array | Yes | Policy Engine |
| policyDecisions | array | Yes | Policy Evaluation |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| policyDashboard | object | Complete policy dashboard |
| activeProfile | object | Active profile |
| activePolicies | array | Active policies |
| policyOverrides | array | Policy overrides |
| policyConflicts | array | Policy conflicts |
| policyDecisions | array | Policy decisions |
| policyCoverage | object | Policy coverage |

### Preconditions

- Profile must be active
- Policies must be loaded
- Decisions must be recorded

### Postconditions

- Dashboard is displayed
- Status is visible
- Coverage is calculated

## Purpose

The Policy Dashboard displays active profile, active policies, policy overrides, policy conflicts, policy decisions, and policy coverage. Every report includes this dashboard.

**Why this matters:** A dashboard provides at-a-glance visibility into policy status. Users can quickly understand which policies are active and how they're being applied.

## Dashboard Components

### Active Profile

| Component | Description |
|-----------|-------------|
| Profile name | Current profile name |
| Profile description | Profile description |
| Enabled categories | Enabled policy categories |
| Overrides | Profile-specific overrides |

### Active Policies

| Component | Description |
|-----------|-------------|
| Policy name | Policy name |
| Policy category | Policy category |
| Policy version | Policy version |
| Policy status | Policy status |
| Policy priority | Policy priority |

### Policy Overrides

| Component | Description |
|-----------|-------------|
| Override source | Source of override |
| Override rule | Rule being overridden |
| Original value | Original value |
| New value | New value |
| Override reason | Reason for override |

### Policy Conflicts

| Component | Description |
|-----------|-------------|
| Conflict type | Type of conflict |
| Conflicting policies | Policies in conflict |
| Conflict rule | Rule causing conflict |
| Resolution | How conflict resolved |
| Resolution status | Status of resolution |

### Policy Decisions

| Component | Description |
|-----------|-------------|
| Decision type | Type of decision |
| Policy consulted | Policy consulted |
| Decision taken | Decision taken |
| Decision confidence | Decision confidence |
| Decision timestamp | When decision made |

### Policy Coverage

| Component | Description |
|-----------|-------------|
| Total decisions | Total decisions made |
| Policy-covered decisions | Decisions covered by policies |
| Coverage percentage | Coverage percentage |
| Uncovered decisions | Decisions not covered |

## Dashboard Output

```
POLICY DASHBOARD
==================================================
Active Profile: Default

Active Policies:
  1. Security Policy (v1.2.0) - Active
  2. Architecture Policy (v1.1.0) - Active
  3. Repair Policy (v1.0.0) - Active
  4. Testing Policy (v1.0.0) - Active
  5. Performance Policy (v1.0.0) - Active
  6. Documentation Policy (v1.0.0) - Active

Policy Overrides:
  1. Source: Custom Policy
     Rule: Security encryption level
     Original: Standard
     New: Maximum
     Reason: Company policy requirement

Policy Conflicts:
  None detected

Policy Decisions:
  1. Type: Repair
     Policy: Security Policy
     Decision: Safe to repair
     Confidence: 95%
     Timestamp: 2026-07-12T10:00:00Z

  2. Type: Refactor
     Policy: Architecture Policy
     Decision: Preserve patterns
     Confidence: 90%
     Timestamp: 2026-07-12T10:05:00Z

Policy Coverage:
  Total Decisions: 24
  Policy-Covered: 22
  Coverage: 92%
  Uncovered: 2 (non-critical)

Dashboard Status: ✅ All policies active
==================================================
```

## Architecture Explainability

### Responsibilities

- Display active profile
- List active policies
- Show policy overrides
- Show policy conflicts
- Show policy decisions
- Calculate policy coverage

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Dashboard display
- Status reporting
- Coverage calculation

### Consumed Decisions

- Active Profile (from Policy Profiles)
- Active Policies (from Policy Engine)
- Policy Decisions (from Policy Evaluation)

### Produced Decisions

- Policy dashboard
- Status display
- Coverage report
