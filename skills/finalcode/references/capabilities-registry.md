# FinalCode — Capability Registry (Unified)

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Unified registry for all capability components: categories, registration, discovery, selection, dependency graph, composition, conflict detection, recommendations, optimization, health, and dashboard |
| Execution Stage | PLANNING, ANALYSIS, ORCHESTRATION, REPORTING |
| Loaded By | SKILL.md (orchestration layer), Planning Engine |
| Dependencies | Capability Registry (data), Repository Intelligence Engine |
| Outputs | Capability discovery reports, selections with reasoning, dependency graphs, compositions, conflict resolutions, recommendations, health scores, capability dashboards |
| Consumers | All operating modes, Workflow Orchestration, Learning Engine, User |
| Applies To | All engineering operations |

This document consolidates the former `core/capability-*.md` files (11 components) into a single reference registry. The standalone files are archived under `archive/core/`. Every capability must be discoverable, selectable, composable, measurable, and explainable through the components defined here.

> Architecture boundaries (apply to all components in this registry): each capability component is responsible only for its own stage's decisions; it does not make findings (Decision Engine), classify findings (Finding Classification), generate reports (Report Engine), or calculate repository health scores (Health Score).

## 1. Capability Categories

Defines standardized categories for organizing capabilities. Every capability belongs to exactly one primary category. Categories organize capabilities logically, making discovery and selection more efficient.

| Category | Description | Typical Capabilities |
|----------|-------------|----------------------|
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

**Total: 16 categories.** Category output reports each category with its capability count and status (e.g., `1. Analysis (12 capabilities)`), followed by `Category Status: ✅ All categories defined`.

## 2. Capability Registration

The Capability Registry is a centralized registry where every capability must register. Capabilities become discoverable instead of implicit. Without a registry, capabilities are implicit and hidden; a registry makes all capabilities explicit and discoverable, enabling intelligent selection.

### Registration Fields

| Field | Meaning |
|-------|---------|
| `id` | Unique capability identifier |
| `name` | Human-readable name |
| `purpose` | What the capability does |
| `description` | Detailed description |
| `owner` | Who owns the capability |
| `version` | Capability version |
| `category` | Capability category (see § 1) |
| `inputs` | Required inputs |
| `outputs` | Produced outputs |
| `dependencies` | Required dependencies |
| `requiredVerification` | Verification requirements |
| `riskLevel` | Risk level |
| `automationLevel` | Automation level |
| `approvalRequirement` | Approval requirements |
| `engineeringValue` | Engineering value |
| `typicalUseCases` | Typical use cases |

### Registry Output Format

```
CAPABILITY REGISTRY
==================================================
Total Capabilities: 42
Registered Capabilities:
  1. engineering-review (Analysis) v1.0.0
  2. security-audit (Security) v1.0.0
  3. performance-audit (Performance) v1.0.0
  ...
Registry Statistics:
  Total: 42
  Active: 40
  Deprecated: 1
  Experimental: 1
Registry Status: ✅ All capabilities registered
==================================================
```

## 3. Capability Discovery

Before every mission, automatically discover available capabilities, compatible capabilities, required capabilities, optional capabilities, deprecated capabilities, and unavailable capabilities. Generate a discovery report. Manual capability discovery is error-prone and incomplete; automatic discovery ensures all relevant capabilities are considered.

### Discovery Methods

| Method | Description |
|--------|-------------|
| Goal analysis | Analyze goal to determine required capabilities |
| Repository analysis | Analyze repository to determine compatible capabilities |
| Dependency analysis | Analyze dependencies to determine required capabilities |
| Policy analysis | Analyze policies to determine allowed capabilities |
| History analysis | Analyze history to determine useful capabilities |

### Discovery Report Format

The report lists `Available Capabilities`, `Compatible Capabilities`, `Required Capabilities`, `Optional Capabilities`, `Deprecated Capabilities` (with the deprecated version), and `Unavailable Capabilities` (with the reason, e.g., "No database detected"), then `Discovery Status: ✅ Complete`.

## 4. Capability Selection

Instead of manually selecting workflows, evaluate goal, repository state, risk, policies, previous engineering history, approval requirements, and verification requirements. Automatically choose the best capabilities. Every selection must include reasoning. Manual selection is subjective and inconsistent; automatic selection ensures optimal capability choice based on evidence.

### Selection Criteria

| Criterion | Weight | Description |
|-----------|--------|-------------|
| Goal alignment | 30% | How well capability aligns with goal |
| Repository fit | 25% | How well capability fits repository |
| Risk level | 20% | Acceptable risk level |
| Policy compliance | 15% | Policy compliance |
| Historical success | 10% | Past success rate |

### Selection Report Format

The report lists each selected capability with `Reason`, `Confidence`, and `Risk`; an execution graph by phase; and `Alternatives Considered` with why each was not selected, then `Selection Status: ✅ Complete`.

## 5. Capability Dependency Graph

Build a graph between capabilities. Detect missing dependencies, circular dependencies, unused capabilities, duplicate capabilities, and broken capability chains. Dependency issues cause runtime failures; detecting them early prevents errors.

### Dependency Analysis

| Analysis | Description |
|----------|-------------|
| Missing dependencies | Required but not available |
| Circular dependencies | Dependencies that loop |
| Unused capabilities | Registered but never used |
| Duplicate capabilities | Multiple capabilities for same purpose |
| Broken chains | Interrupted dependency chains |

### Graph Report Format

The report shows the dependency arrows (`capability → [dependencies]`), counts of each analysis category (unused capabilities listed individually with reason), and `Graph Status: ✅ Healthy` or listing issues.

## 6. Capability Composition

Allow multiple capabilities to compose dynamically. Composition should be automatic whenever beneficial. Some operations require multiple capabilities working together; automatic composition ensures optimal execution.

### Composition Patterns

| Pattern | Description |
|---------|-------------|
| Sequential | Capabilities execute in sequence |
| Parallel | Capabilities execute simultaneously |
| Mixed | Combination of sequential and parallel |
| Conditional | Execution depends on conditions |

### Composition Report Format

The report shows the composed execution plan grouped by phase (each phase marked Parallel or Sequential), `Parallel Groups`, `Sequential Groups`, `Estimated Duration`, `Expected Gain`, and `Composition Status: ✅ Ready`.

## 7. Capability Conflict Detection

Detect conflicting capabilities, duplicated responsibilities, overlapping execution, and competing recommendations. Explain every conflict. Recommend resolution. Conflicts waste resources and produce inconsistent results; detecting them early prevents wasted effort.

### Conflict Types

| Type | Description |
|------|-------------|
| Conflicting capabilities | Capabilities that contradict each other |
| Duplicated responsibilities | Multiple capabilities for same task |
| Overlapping execution | Capabilities that do similar work |
| Competing recommendations | Capabilities that recommend different things |

### Conflict Report Format

Each conflict lists `Type`, the `Capabilities` involved, `Description`, `Impact`, and `Resolution`. The report ends with per-type counts and `Resolution Status: ✅ All conflicts resolved`.

## 8. Capability Recommendations

After every mission, recommend unused capabilities, higher-value alternatives, missing capabilities, deprecated capabilities, and potential capability combinations. Always explain WHY. Recommendations improve future missions by suggesting better capability usage.

### Recommendation Types

| Type | Description |
|------|-------------|
| Unused capabilities | Capabilities that could have been used |
| Higher-value alternatives | Better capabilities for the task |
| Missing capabilities | Capabilities that don't exist but should |
| Deprecated capabilities | Capabilities that should be replaced |
| Potential combinations | Capabilities that work well together |

### Recommendation Report Format

Each recommendation provides `Why`, `Value`, and `Recommendation` (e.g., "Consider parallel execution", "Remove from registry"), ending with `Recommendation Status: ✅ Generated`.

## 9. Capability Optimization

Evaluate capability usefulness, overlap, effectiveness, reliability, and execution cost. Recommend retain, improve, merge, or deprecate. Always explain why. Not all capabilities are equally useful; optimizing capability usage improves engineering efficiency.

### Optimization Actions

| Action | Description |
|--------|-------------|
| Retain | Keep capability as-is |
| Improve | Enhance capability |
| Merge | Combine with similar capability |
| Deprecate | Mark as deprecated |

### Optimization Report Format

Each recommendation lists the action, target capability, `Reason`, and `Confidence`. The report also includes `Capability Scores` (Usefulness, Overlap, Effectiveness, Reliability, Cost) and `Optimization Status: ✅ Active`.

## 10. Capability Health

Measure capability health including usage frequency, success rate, verification pass rate, average execution time, regression prevention, and engineering impact. Generate a health score for every capability. Health scores help identify underperforming capabilities and guide improvement efforts.

### Health Metrics

| Metric | Weight | Description |
|--------|--------|-------------|
| Usage Frequency | 20% | How often used |
| Success Rate | 25% | How often successful |
| Verification Pass Rate | 20% | How often verification passes |
| Average Execution Time | 15% | How long it takes |
| Regression Prevention | 10% | How often prevents regressions |
| Engineering Impact | 10% | Impact on engineering quality |

### Health Report Format

The report shows each metric's value and interpretation, `Health Score: N/100`, `Health Status` (e.g., `✅ Healthy`), `Health History` per capability version, and `Health Trend` (e.g., `↑ Improving`).

## 11. Capability Dashboard

Every report includes capabilities used, capabilities skipped, selection reasons, capability health, capability graph, capability coverage, engineering value, and unused opportunities. A capability dashboard provides visibility into how capabilities are being used and where improvements can be made.

### Dashboard Report Format

```
CAPABILITY DASHBOARD
==================================================
Mission: <goal>
Capabilities Used: N
  1. <capability> (<category>)
Capabilities Skipped: N
  1. <capability> (<reason>)
Selection Reasons:
  <capability>: <reason>
Capability Health:
  <capability>: N/100
Capability Coverage: N%
Engineering Value: +N%
Unused Opportunities: N
Dashboard Status: ✅ Complete
==================================================
```

## Component Index

| Component | Section | Execution Stage | Key Inputs | Key Outputs |
|-----------|---------|-----------------|-----------|-------------|
| Capability Categories | § 1 | CONFIGURATION | capability definitions | 16 categories |
| Capability Registry | § 2 | ORCHESTRATION | capability definitions | registered capability set |
| Capability Discovery | § 3 | PLANNING | goal, repository profile | discovery report |
| Capability Selection | § 4 | PLANNING | discovery report, policies | selected capabilities + reasoning |
| Capability Dependency Graph | § 5 | PLANNING | registered capabilities | dependency graph + issues |
| Capability Composition | § 6 | EXECUTION | selected capabilities, dependency graph | execution plan |
| Capability Conflict Detection | § 7 | ANALYSIS | capabilities, selection | conflicts + resolutions |
| Capability Recommendations | § 8 | ANALYSIS | completed mission, health | recommendations |
| Capability Optimization | § 9 | ANALYSIS | health, decision history | retain/improve/merge/deprecate |
| Capability Health | § 10 | ANALYSIS | usage history | health scores |
| Capability Dashboard | § 11 | REPORTING | registry, health, recommendations | capability dashboard |
