# FinalCode Capability Categories

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Defines standardized categories for organizing capabilities |
| Execution Stage | CONFIGURATION |
| Loaded By | Capability Registry, Capability Discovery Engine |
| Dependencies | Capability Registry |
| Outputs | Capability categories with descriptions |
| Consumers | Capability Registry, User |
| Applies To | All engineering operations |

## Reference Contract

| Input | Type | Required | Source |
|-------|------|----------|--------|
| categoryName | string | Yes | Configuration |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| category | object | Complete capability category |
| capabilities | array | Capabilities in category |
| description | string | Category description |

### Preconditions

- Category name must be provided

### Postconditions

- Category is defined
- Capabilities are categorized
- Category is available

## Purpose

Capability Categories support standardized categories. Every capability belongs to exactly one primary category. This enables organized capability discovery and management.

**Why this matters:** Categories organize capabilities logically, making discovery and selection more efficient.

## Available Categories

| Category | Description | Typical Capabilities |
|----------|-------------|---------------------|
| Analysis | Analysis capabilities | Engineering Review, Dependency Impact, Change Impact |
| Repair | Repair capabilities | Repair, Fix Issues, Resolve Bugs |
| Refactor | Refactoring capabilities | Refactor, Architecture Refactoring, Code Cleanup |
| Verification | Verification capabilities | TypeScript, Lint, Tests, Build |
| Certification | Certification capabilities | Certification, Production Audit |
| Architecture | Architecture capabilities | Architecture Review, Architecture Metrics |
| Performance | Performance capabilities | Performance Audit, Performance Optimization |
| Security | Security capabilities | Security Audit, Security Hardening |
| Testing | Testing capabilities | Testing Workflow, Test Coverage |
| Documentation | Documentation capabilities | Documentation Workflow, API Documentation |
| Deployment | Deployment capabilities | CI/CD Audit, Release Evolution |
| Workflow | Workflow capabilities | Workflow Engine, Workflow Orchestration |
| Planning | Planning capabilities | Goal-Oriented Planning, Planning Engine |
| Policy | Policy capabilities | Policy Engine, Policy Evaluation |
| Engineering Memory | Memory capabilities | Engineering Memory, Knowledge Evolution |
| Continuous Engineering | Continuous capabilities | Engineering Timeline, Trend Analysis |

## Category Output

```
CAPABILITY CATEGORIES
==================================================
Total Categories: 16

1. Analysis (12 capabilities)
   - engineering-review
   - dependency-impact
   - change-impact
   - cross-file-refactor
   - architecture-metrics
   - api-contract
   - database-consistency
   - cicd-audit
   - regression-prediction
   - engineering-graph
   - confidence-model
   - knowledge-base

2. Repair (5 capabilities)
   - repair
   - fix-issues
   - resolve-bugs
   - security-repair
   - performance-repair

3. Refactor (4 capabilities)
   - refactor
   - architecture-refactoring
   - code-cleanup
   - dependency-upgrade

4. Verification (4 capabilities)
   - typescript-verification
   - lint-verification
   - test-verification
   - build-verification

5. Certification (3 capabilities)
   - certification
   - production-audit
   - release-certification

6. Architecture (3 capabilities)
   - architecture-review
   - architecture-metrics
   - architecture-refactoring

7. Performance (3 capabilities)
   - performance-audit
   - performance-optimization
   - performance-monitoring

8. Security (3 capabilities)
   - security-audit
   - security-hardening
   - vulnerability-scan

9. Testing (3 capabilities)
   - testing-workflow
   - test-coverage
   - test-generation

10. Documentation (3 capabilities)
    - documentation-workflow
    - api-documentation
    - changelog-generation

11. Deployment (2 capabilities)
    - cicd-audit
    - release-evolution

12. Workflow (2 capabilities)
    - workflow-engine
    - workflow-orchestration

13. Planning (2 capabilities)
    - goal-oriented-planning
    - planning-engine

14. Policy (2 capabilities)
    - policy-engine
    - policy-evaluation

15. Engineering Memory (2 capabilities)
    - engineering-memory
    - knowledge-evolution

16. Continuous Engineering (2 capabilities)
    - engineering-timeline
    - trend-analysis

Category Status: ✅ All categories defined
==================================================
```

## Architecture Explainability

### Responsibilities

- Define capability categories
- Organize capabilities by category
- Provide category lookup
- Track category usage

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Category definition
- Capability organization
- Category lookup

### Consumed Decisions

- Capability Registry (from Capability Registry)

### Produced Decisions

- Capability categories
- Organized capabilities
- Category statistics
