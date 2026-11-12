# FinalCode — Workflow Registry (Unified)

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Unified registry for all workflow components: engine stages, orchestration, verification, recovery, templates, metrics, and optimization |
| Execution Stage | ORCHESTRATION, EXECUTION, VERIFICATION, RECOVERY, ANALYSIS |
| Loaded By | SKILL.md (orchestration layer), all operating modes |
| Dependencies | Repository Intelligence Engine, Engineering Memory, Approval Gate |
| Outputs | Workflow executions, verification results, recovery plans, metrics, optimization recommendations |
| Consumers | All operating modes, Objective Tracking, Learning Engine, User |
| Applies To | All engineering operations |

This document consolidates the former `core/workflow-*.md` files (7 components) into a single reference registry. The standalone files are archived under `archive/core/`. Every engineering action follows the standardized workflow lifecycle defined here, and no workflow completes before verification passes.

## 1. Workflow Engine (Standard Pipeline)

The Workflow Engine is a reusable pipeline shared by every operating mode. Without a standardized workflow, operations are ad-hoc and inconsistent; the engine ensures every operation follows the same quality process, reducing risk and improving reliability.

### The 11 Workflow Stages

| Stage | Steps |
|-------|-------|
| 1. Discovery | Identify target files, analyze context, map dependencies, load engineering history |
| 2. Analysis | Code analysis, architecture analysis, security analysis, performance analysis |
| 3. Impact Prediction | Dependency impact, change impact, regression prediction, risk assessment |
| 4. Execution Planning | Create execution plan, estimate effort, identify dependencies, plan verification |
| 5. Approval Check | Check approval requirements, request approval if needed, wait for approval, document approval |
| 6. Execution | Execute plan, track progress, handle errors, record changes |
| 7. Verification | Run TypeScript, Lint, Tests, Build (see § 3) |
| 8. Regression Validation | Run regression tests, compare with baseline, identify regressions, document results |
| 9. Certification | Calculate health score, generate report, determine verdict, document certification |
| 10. Engineering Memory Update | Update memory, record decisions, update timeline, update knowledge |
| 11. Roadmap Update | Update continuous roadmap, add new tasks, remove completed, reprioritize |

### Workflow Output Format

The report shows per-stage progress (with durations), `Total Duration`, verification results (TypeScript / Lint / Tests / Build), and the `Engineering Delta` (Health, Technical Debt, Regression Risk), ending with `Workflow Status: ✅ Completed successfully`.

## 2. Workflow Orchestration

Workflow Orchestration composes workflows dynamically. It executes workflows in the planned order, handles dependencies, manages approval gates, and tracks progress. Every workflow remains reusable. Orchestration ensures workflows execute in the correct order, with proper dependencies and approvals.

### Orchestration Patterns

| Pattern | Description |
|---------|-------------|
| Sequential | One after another; each workflow depends on previous; failure stops execution |
| Parallel | Simultaneous; independent workflows; a failure doesn't affect others |
| Mixed | Phase-based grouping; parallel within phase, sequential between phases |

### Orchestration Report Format

The report shows each phase with per-step status (`✅ Completed (45m)`, `🔄 In Progress`, `⏳ Waiting`), phase durations, overall progress percentages, the state of `Approval Gates` (approved/waiting), `Current Stage`, and `Orchestration Status: ✅ On track`.

## 3. Workflow Verification (Mandatory)

Workflow Verification defines mandatory verification for every workflow. **No workflow completes before verification passes.** Verification is the safety net that catches issues before they reach production; mandatory verification ensures every change is validated. Never continue after a failed verification (see § 4 Recovery).

### Verification Types

| Type | Checks |
|------|--------|
| TypeScript | Compilation succeeds; no type errors; strict mode compliance |
| Lint | No ESLint errors; Prettier formatting correct; style guide compliance |
| Unit Tests | All tests execute; all tests pass; coverage maintained |
| Integration Tests | All tests execute; all tests pass; API compatibility maintained |
| Build | Build completes successfully; no build warnings; output size acceptable |
| Security | Vulnerability scan clean; no secrets exposed; permissions correct |
| Performance | Bundle size acceptable; load time acceptable; memory usage acceptable |
| Architecture | No circular dependencies; module coupling within limits; pattern compliance |

### Verification Report Format

```
WORKFLOW VERIFICATION
==================================================
Workflow: <type>
Status: Passed
TypeScript: ✅ Passed
  Compilation: Success
  Type errors: 0
Lint: ✅ Passed
  ESLint: 0 errors
Unit Tests: ✅ Passed
  Executed: N / Passed: N / Failed: 0 / Coverage: N%
Build: ✅ Passed
Security: ✅ Passed
Performance: ✅ Passed
Architecture: ✅ Passed
Overall Result: ✅ All verifications passed
Workflow can proceed to completion
==================================================
```

A single failed check fails the whole verification and triggers the recovery process (§ 4).

## 4. Workflow Recovery

Workflow Recovery handles workflow failures. If execution fails, it stops immediately and generates failure analysis, root cause, safe recovery, remaining work, and recommended next action. **Never continue after a failed verification.** Failures happen; a structured recovery process ensures you can recover quickly and safely without introducing additional issues.

### Recovery Components

| Component | Captures |
|-----------|----------|
| Failure Analysis | Failure point, error type, error message, stack trace (if available), context at failure |
| Root Cause Identification | Error analysis, context analysis, dependency analysis, history analysis (similar past failures) |
| Safe Recovery | Stop immediately → assess damage → rollback changes → verify state → document failure |
| Remaining Work | Completed work, partially completed, not started, affected dependencies |
| Recommended Next Action | Immediate action, short-term action, long-term action, prevention |

### Recovery Report Format

The report ends with `Recovery Plan Status: ✅ Ready to execute`. Example next-action block:

```
Recommended Next Action:
  Immediate: Complete rollback and verify restoration
  Short-term: Update imports before removing modules
  Long-term: Add import dependency checking to verification
  Prevention: Add pre-refactoring dependency analysis
```

## 5. Workflow Templates

Reusable templates for common engineering operations. Each template defines required inputs, execution stages, verification rules, rollback policy, approval requirements, and completion criteria. Common operations repeat frequently; templates ensure consistent execution, reduce planning time, and standardize best practices.

### The 10 Templates

| Template | Required Inputs | Stages | Verification Rules | Rollback Policy | Approval | Completion Criteria |
|----------|----------------|--------|--------------------|-----------------|----------|---------------------|
| Repair | Target files, issue description | All 11 | TypeScript, Lint, Tests, Build | Restore original files, re-run verification | Minor (critical files) | All verifications pass, no regressions |
| Refactor | Target files, refactoring goal | All 11 | TypeScript, Lint, Tests, Build, Architecture | Restore original files, re-run verification | Architecture | All verifications pass, no behavior changes |
| Certification | Repository path | Discovery, Analysis, Certification, Memory Update | None (read-only) | None (no modifications) | None | Certification report generated |
| Production Release | Release version, release notes | All 11 | TypeScript, Lint, Tests, Build, Security, Performance | Restore previous version, re-deploy | Architecture, Security, Business Logic | All verifications pass, no regressions, security clean |
| Security Hardening | Security issue description | All 11 | TypeScript, Lint, Tests, Build, Security | Restore original files, re-run verification | Security | Security issue resolved, no new vulnerabilities |
| Performance Optimization | Performance issue description | All 11 | TypeScript, Lint, Tests, Build, Performance | Restore original files, re-run verification | Minor | Performance improved, no regressions |
| Architecture Refactoring | Architecture issue description | All 11 | TypeScript, Lint, Tests, Build, Architecture | Restore original files, re-run verification | Architecture | Architecture improved, no behavior changes |
| Documentation | Documentation target | Discovery, Analysis, Execution Planning, Execution, Verification, Memory Update | Documentation completeness, accuracy | Restore original documentation | None | Documentation complete and accurate |
| Dependency Upgrade | Dependency list | All 11 | TypeScript, Lint, Tests, Build, Security | Restore previous dependency versions | Security | Dependencies upgraded, no breaking changes |
| Testing | Testing target | Discovery, Analysis, Execution Planning, Execution, Verification, Memory Update | Test coverage, test pass rate | Remove added tests | None | Tests added and passing |

"Stages: All 11" = Discovery, Analysis, Impact Prediction, Execution Planning, Approval Check, Execution, Verification, Regression Validation, Certification, Memory Update, Roadmap Update (§ 1).

## 6. Workflow Metrics

Workflow Metrics measure workflow performance and effectiveness. These metrics help identify bottlenecks, improve processes, and optimize engineering workflows. You can't improve what you don't measure; metrics provide the data needed to optimize engineering processes.

### Metric Categories

| Category | Metrics |
|----------|---------|
| Performance | Average Session Duration (total duration / sessions), Average Files Changed (files / sessions), Session Duration Trend (moving average) |
| Quality | Verification Success Rate (passed / total), Repair Success Rate (successful / total), Regression Prevention Rate (prevented / total) |
| Efficiency | Approval Frequency (approval sessions / total), Automation Coverage (automatable / total), Workflow Completion Rate (completed / total) |
| Trend | Duration Trend, Success Rate Trend, Automation Trend (all moving averages) |

### Metrics Report Format

The report shows each category's values with trend arrows, a `Trend Analysis` block, generated `Insights`, and `Recommendations` (e.g., "Increase automation coverage to 80%"), ending with `Metrics Status: ✅ All metrics healthy`.

## 7. Workflow Optimization

Analyze completed workflows. Measure average duration, failure rate, rollback frequency, verification success, and approval frequency. Automatically recommend workflow improvements. Workflow analysis reveals inefficiencies; optimizing workflows improves engineering productivity.

### Optimization Areas

| Area | Description |
|------|-------------|
| Duration | Reduce execution time |
| Failure Rate | Reduce failures |
| Rollback | Reduce rollbacks |
| Verification | Improve verification success |
| Approval | Optimize approval process |

### Optimization Report Format

Each recommendation states the improvement, its `Impact` (e.g., `-15% duration`), and `Confidence`. The report also lists current metrics (Average Duration, Failure Rate, Rollback Frequency, Verification Success, Approval Frequency) and ends with `Optimization Status: ✅ Active`. Example recommendations:

```
1. Parallelize independent workflows        Impact: -15% duration    Confidence: 85%
2. Add pre-verification checks              Impact: -20% failure rate Confidence: 80%
3. Automate approval for low-risk changes   Impact: -30% approval time Confidence: 90%
```

## Component Index

| Component | Section | Execution Stage | Key Inputs | Key Outputs |
|-----------|---------|-----------------|-----------|-------------|
| Workflow Engine | § 1 | ORCHESTRATION | repository profile, engineering memory | 11-stage execution |
| Workflow Orchestration | § 2 | EXECUTION | execution strategy, approval gates | orchestrated execution + progress |
| Workflow Verification | § 3 | VERIFICATION | workflow type, target files | pass/fail verification results |
| Workflow Recovery | § 4 | RECOVERY | failure point, rollback plan | recovery plan + root cause |
| Workflow Templates | § 5 | PLANNING | workflow type | 10 reusable templates |
| Workflow Metrics | § 6 | ANALYSIS | engineering memory, execution sessions | metrics + insights |
| Workflow Optimization | § 7 | ANALYSIS | decision history, workflow metrics | optimization recommendations |
