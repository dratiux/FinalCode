# FinalCode Goal-Oriented Planning

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Transforms user requests into structured engineering goals |
| Execution Stage | PLANNING |
| Loaded By | All operating modes |
| Dependencies | Repository Intelligence Engine, Engineering Memory |
| Outputs | Structured goal with workflows and strategy |
| Consumers | Planning Engine, Workflow Orchestration, User |
| Applies To | All engineering operations |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| userRequest | string | Yes | User |
| repositoryProfile | object | Yes | Repository Intelligence Engine |
| engineeringMemory | object | Yes | Engineering Memory |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| goal | object | Structured engineering goal |
| goalType | string | Type of goal |
| requiredWorkflows | array | Required workflows |
| estimatedComplexity | string | Estimated complexity |
| confidence | number | Confidence in goal understanding |

### Preconditions

- Repository Profile must be generated
- Engineering Memory must be available
- User request must be provided

### Postconditions

- Goal is understood
- Workflows are identified
- Strategy is defined

## Purpose

Goal-Oriented Planning transforms user requests into structured engineering goals. Every request begins with a Goal. FinalCode infers the required workflows automatically based on the goal.

**Why this matters:** Users express goals in natural language. FinalCode must understand these goals and translate them into actionable engineering workflows. This eliminates the need for users to manually select operating modes.

## Goal Types

### Production Readiness

| Example Request | Workflows Required |
|-----------------|-------------------|
| "Make this repository production ready" | Engineering Review → Security Audit → Performance Audit → Testing → Documentation → Certification |
| "Is this ready to ship?" | Certification → Production Audit |
| "Prepare for release" | Certification → Release Evolution → Documentation |

### Quality Improvement

| Example Request | Workflows Required |
|-----------------|-------------------|
| "Reduce technical debt" | Debt Analysis → Refactoring → Verification |
| "Improve architecture" | Architecture Review → Architecture Refactoring → Verification |
| "Fix all issues" | Engineering Review → Repair → Verification |

### Security

| Example Request | Workflows Required |
|-----------------|-------------------|
| "Harden security" | Security Audit → Security Hardening → Verification |
| "Fix vulnerabilities" | Security Audit → Security Repair → Verification |

### Performance

| Example Request | Workflows Required |
|-----------------|-------------------|
| "Improve performance" | Performance Audit → Performance Optimization → Verification |
| "Optimize bundle size" | Performance Audit → Bundle Optimization → Verification |

### Review

| Example Request | Workflows Required |
|-----------------|-------------------|
| "Review this pull request" | PR Review → Engineering Review |
| "Audit this codebase" | Engineering Review → Security Audit |

## Goal Output

```
GOAL-ORIENTED PLANNING
==================================================
User Request: "Make this repository production ready"

Goal Analysis:
  Goal Type: Production Readiness
  Primary Objective: Achieve production readiness
  Secondary Objectives: Security, Performance, Testing, Documentation
  Estimated Complexity: High
  Confidence: 95%

Required Workflows:
  1. Engineering Review (Priority: Critical)
  2. Security Audit (Priority: Critical)
  3. Performance Audit (Priority: High)
  4. Testing Workflow (Priority: High)
  5. Documentation Workflow (Priority: Medium)
  6. Certification (Priority: Critical)

Execution Order:
  Phase 1: Engineering Review + Security Audit
  Phase 2: Performance Audit + Testing Workflow
  Phase 3: Documentation Workflow
  Phase 4: Certification

Estimated Duration: 4-6 hours
Expected Engineering Gain: +15%
Risk Level: Medium

Goal Status: ✅ Ready for planning
==================================================
```

## Architecture Explainability

### Responsibilities

- Parse user request
- Identify goal type
- Determine required workflows
- Estimate complexity
- Calculate confidence

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Goal identification
- Workflow selection
- Complexity estimation

### Consumed Decisions

- Repository Profile (from Repository Intelligence Engine)
- Engineering Memory (from Engineering Memory)

### Produced Decisions

- Structured goal
- Required workflows
- Execution strategy
