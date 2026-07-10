# Report Format Reference

Detailed report template and section specifications for FinalCode Certification Reports.

## FinalCode Certification Report

This is the fixed, standardized output format for every mode. Always produce the full structure below — omit only the sections marked mode-specific where they don't apply.

```
==================================================
FINALCODE CERTIFICATION REPORT
==================================================

EXECUTIVE ENGINEERING DASHBOARD
--------------------------------------------------
Overall Status:         READY TO SHIP | READY WITH WARNINGS | NOT READY
Overall Risk:            Low | Medium | High
Health Score:            XX / 100 (Class)
Engineering Grade:       A+ | A | A- | B+ | B | B- | C | D | F
Grade Justification:     <why this grade was assigned — strengths and weaknesses>
Production Readiness:    XX%  (Health Score vs policy target)
Security Rating:         A+ | A | B | C | D | F
Maintainability Rating:  A+ | A | B | C | D | F
Testing Status:          Pass | Fail | Not Measured
Estimated Remaining Effort:  Small | Medium | Large

--------------------------------------------------
AUDIT METADATA
--------------------------------------------------
Specification Version:  2.6.0
Audit Engine Version:    <internal version>
Report Version:          <increments per re-run>
Repository Version:      <tag or branch name>
Git Commit:              <short hash, if available>
Audit Date:              <ISO date>
Mode:                    Inspect | Repair | Refactor | Certify
Profile:                 <selected project profile, e.g. production | mvp | library>
Inspection Type:         Full | Incremental | Dependency Based
Configuration Source:    finalcode.config.json | .finalcode/config.json | default production policy
Active Policy:           <selected policy, e.g. POLICY-DEFAULT>

--------------------------------------------------
REPOSITORY METADATA
--------------------------------------------------
Project Root:       <path>
Framework:           <framework + version, or "auto-detected: <framework>">
Language(s):        <languages>
Build System:        <build system>
Package Manager:     <package manager>
Entry Points:        <entry points>
Active Plugins:      <list of activated plugins, or "none">
Active Profiles:     <list of active framework profiles, or "none">

--------------------------------------------------
REPOSITORY COVERAGE
--------------------------------------------------
Files Scanned:            <count and/or list>
Files Ignored:             <count + reason, e.g. node_modules, dist, binaries>
Files Skipped:             <count + specific reason, e.g. inaccessible, too large>
Directories Scanned:       <list or count>
Languages Detected:        <languages>
Configuration Reviewed:    <e.g. package.json, tsconfig.json, .env.example>
Assets Inspected:          <e.g. images, fonts, static UI assets>
Uninspectable Portions:     <none, or explicitly flagged paths and why>
Coverage Percentage:        <XX%>
Coverage Limitations:       <e.g. database unavailable, external APIs unavailable>

-------------------------------------------------
RISK MATRIX
-------------------------------------------------
Critical:           0
High:               1
Medium:             2
Low:                15
Informational:      4

Blocking Issues:      1   (Critical/High failing a mandatory gate)
Non-Blocking Issues:  21  (Low/Informational or non-blocking recommendations)

-------------------------------------------------
QUALITY GATE SUMMARY
-------------------------------------------------
Architecture:         PASS | FAIL | WARNING | SKIP
  Reason: <why this gate passed — key evidence that supports the PASS>
  Evidence: <what was verified — specific files, patterns, or checks>
Code Quality:         PASS | FAIL | WARNING | SKIP
  Reason: <why this gate passed>
  Evidence: <what was verified>
Dead Code:            PASS | FAIL | WARNING | SKIP
  Reason: <why this gate passed>
  Evidence: <what was verified>
Dependencies:         PASS | FAIL | WARNING | SKIP
  Reason: <why this gate passed>
  Evidence: <what was verified>
Type Safety:          PASS | FAIL | WARNING | SKIP
  Reason: <why this gate passed>
  Evidence: <what was verified>
Error Handling:       PASS | FAIL | WARNING | SKIP
  Reason: <why this gate passed>
  Evidence: <what was verified>
Testing:              PASS | FAIL | WARNING | SKIP
  Reason: <why this gate passed>
  Evidence: <what was verified>
Performance:          PASS | FAIL | WARNING | SKIP
  Reason: <why this gate passed>
  Evidence: <what was verified>
Security:             PASS | FAIL | WARNING | SKIP
  Reason: <why this gate passed>
  Evidence: <what was verified>
Accessibility:        PASS | FAIL | WARNING | SKIP
  Reason: <why this gate passed>
  Evidence: <what was verified>
UI Consistency:       PASS | FAIL | WARNING | SKIP
  Reason: <why this gate passed>
  Evidence: <what was verified>
Documentation:        PASS | FAIL | WARNING | SKIP
  Reason: <why this gate passed>
  Evidence: <what was verified>
GitHub Readiness:     PASS | FAIL | WARNING | SKIP
  Reason: <why this gate passed>
  Evidence: <what was verified>

(A failing mandatory row blocks certification per the Release Blocking Policy.)

-------------------------------------------------
ENGINEERING POLICY
-------------------------------------------------
Profile:              <project profile>
Policy:               <active policy>
Enabled Gates:        <list of enabled gates>
Disabled Gates:       <list of disabled gates>
Required Gates:       <list of required gates>
Minimum Score:        <policy minimum score>
Blocking Conditions:  <list of blocking conditions>

-------------------------------------------------
FINDINGS
-------------------------------------------------
<Findings grouped by Quality Gate, each with full Finding Format>

-------------------------------------------------
SECURITY REPORT
-------------------------------------------------
Security Rating:      A+ | A | B | C | D | F
Categories:
  Authentication:           Clean | Warning | Fail | Not Verified
  Authorization:            Clean | Warning | Fail | Not Verified
  Session Management:       Clean | Warning | Fail | Not Verified
  Input Validation:         Clean | Warning | Fail | Not Verified
  Secrets Management:       Clean | Warning | Fail | Not Verified
  Dependency Security:      Clean | Warning | Fail | Not Verified
  API Security:             Clean | Warning | Fail | Not Verified
  Frontend Security:        Clean | Warning | Fail | Not Verified
  Backend Security:         Clean | Warning | Fail | Not Verified
  Deployment Security:      Clean | Warning | Fail | Not Verified
  Cloud Configuration:      Clean | Warning | Fail | Not Verified
  Rate Limiting:            Clean | Warning | Fail | Not Verified
  Security Headers:         Clean | Warning | Fail | Not Verified
  Environment Security:     Clean | Warning | Fail | Not Verified

-------------------------------------------------
FIXES APPLIED (Repair Mode only)
-------------------------------------------------
<What was changed, verification results, and regression analysis>

-------------------------------------------------
REFACTORS APPLIED (Refactor Mode only)
-------------------------------------------------
<What was refactored, engineering justification, and verification>

-------------------------------------------------
INTELLIGENT REPAIR STOP (Repair Mode only)
-------------------------------------------------
<Why no further automatic repairs are possible>

-------------------------------------------------
AUDIT STATISTICS
-------------------------------------------------
Files Scanned:        <count>
Gates Executed:       <count>
Issues Found:         <count>
Issues Fixed:         <count> (Repair Mode only)
Issues Remaining:     <count>
Tool Calls:           <count>

-------------------------------------------------
EVIDENCE SUMMARY (v2.2.0)
-------------------------------------------------
This section summarizes audit evidence quality, not repository quality.

Evidence Breakdown:
  Direct Evidence:        <count> findings
  Strong Evidence:        <count> findings
  Indirect Evidence:      <count> findings
  Weak Evidence:          <count> findings
  Assumptions:            <count> findings
  Needs Verification:     <count> findings

Verified Resources:
  Files Verified:         <count>
  Configurations Verified: <count>
  Commands Verified:      <count>
  Outputs Verified:       <count>

Unavailable Evidence:
  <list of resources that could not be verified and why>

-------------------------------------------------
ENGINEERING ASSUMPTIONS (v2.2.0)
-------------------------------------------------
This section documents all inferences made during the audit.

| Assumption | Reason | Confidence | Verification Required |
|------------|--------|------------|----------------------|
| <inference> | <basis for inference> | High/Medium/Low | <what would verify it> |

Rule: Assumptions must never be presented as verified facts.

-------------------------------------------------
ANALYSIS TRACE (v2.2.0)
-------------------------------------------------
This section shows exactly what was analyzed during the audit.

Repository Discovery:      Completed | Skipped
  Reason: <why skipped if applicable>

Configuration Analysis:    Completed | Skipped
  Reason: <why skipped if applicable>

Architecture Analysis:     Completed | Skipped
  Reason: <why skipped if applicable>

Security Inspection:       Completed | Skipped
  Reason: <why skipped if applicable>

Testing Inspection:        Completed | Skipped
  Reason: <why skipped if applicable>

Performance Analysis:      Completed | Skipped
  Reason: <why skipped if applicable>

Documentation Review:      Completed | Skipped
  Reason: <why skipped if applicable>

Dependency Analysis:       Completed | Skipped
  Reason: <why skipped if applicable>

Build Verification:        Completed | Skipped
  Reason: <why skipped if applicable>

Rule: Every analysis step must report Completed or Skipped with reason.
This provides audit reproducibility.

-------------------------------------------------
REPORT COMPLETENESS (v2.2.0)
-------------------------------------------------
This metric measures the completeness of the audit itself.

Report Completeness:       XX%

Verified Resources:        <count>
Scanned Resources:         <count>
Skipped Resources:         <count>
Unavailable Resources:     <count>
Estimated Coverage:        <XX%>

Note: Report Completeness is separate from:
  - Health Score (repository quality)
  - Overall Reliability (evidence completeness)
  - Certification (release readiness)

-------------------------------------------------
CONFIDENCE MODEL 2.0
-------------------------------------------------
Analysis Confidence:        XX%  (<justification>)
Evidence Coverage:          XX%  (<justification>)
Verification Coverage:      XX%  (<justification>)
Runtime Coverage:           XX%  (<justification>)
Repository Coverage:        XX%  (<justification>)
Overall Reliability:        XX%  (<weighted synthesis>)

-------------------------------------------------
CERTIFICATION CONFIDENCE MODEL
-------------------------------------------------
Static Analysis:       XX%
Testing:               XX%
Runtime:               XX%
Documentation:         XX%
Deployment:            XX%
Overall Reliability:   XX%

-------------------------------------------------
RUNTIME CAPABILITY DISCLOSURE
-------------------------------------------------
Build Verification:         Verified | Executed | Not Executed | Assumed
Type Checking:              Verified | Executed | Not Executed | Assumed
Lint Checking:              Verified | Executed | Not Executed | Assumed
Test Execution:             Verified | Executed | Not Executed | Assumed
Security Scan:              Verified | Executed | Not Executed | Assumed
Dependency Audit:           Verified | Executed | Not Executed | Assumed

-------------------------------------------------
ENGINEERING METRICS
-------------------------------------------------
Cyclomatic Complexity:      <average> | Not Measured
Average Function Length:    <lines> | Not Measured
Average File Length:        <lines> | Not Measured
Largest File:               <file> | Not Measured
Largest Function:           <function> | Not Measured
Duplicate Code Percentage:  <XX%> | Not Measured
Type Coverage:              <XX%> | Not Measured
Documentation Coverage:     <XX%> | Not Measured
Lint Status:                Pass | Fail | Not Configured
Test Coverage:              <XX%> | Not Measured
Build Success:              Pass | Fail
Type Check:                 Pass | Fail | Not Configured

-------------------------------------------------
REPOSITORY HEALTH SCORE
-------------------------------------------------
Health Score:  XX / 100 (Classification)

Weighted Formula:
| Category | Weight | Score | Contribution |
|----------|--------|-------|--------------|
| Security | High | XX | XX |
| Architecture | High | XX | XX |
| Maintainability | High | XX | XX |
| Performance | Medium | XX | XX |
| Documentation | Medium | XX | XX |
| Accessibility | Medium | XX | XX |
| Testing | High | XX | XX |
| Type Safety | Medium | XX | XX |
| GitHub Readiness | Low | XX | XX |
| Dead Code | Low | XX | XX |

Grade Justification:  <why this grade was assigned>
How to Gain the Next 5 Points:  <specific actions>

-------------------------------------------------
ARCHITECTURE OVERVIEW (v2.3.0)
-------------------------------------------------
System Layers:
  <list of identified layers with descriptions>

Major Modules:
  <list of major modules with responsibilities>

Entry Points:
  <list of application entry points>

Shared Components:
  <list of shared utilities, libraries, or services>

External Integrations:
  <list of external APIs, databases, or services>

Data Flow:
  <description of how data moves through the system>

Dependency Flow:
  <description of how components depend on each other>

-------------------------------------------------
MODULE HEALTH (v2.3.0)
-------------------------------------------------
For each significant module:

<ModuleName>

Health: XX / 100
Responsibilities: <what this module does>
Dependencies: <what this module depends on>
Complexity: Low | Medium | High
Risk: Low | Medium | High
Recommendations: <specific improvements>

-------------------------------------------------
RESPONSIBILITY ANALYSIS (v2.3.0)
-------------------------------------------------
God Objects:
  <list of classes/modules with too many responsibilities>

God Components:
  <list of components that do too much>

God Services:
  <list of services with excessive scope>

Utility Overload:
  <list of utility files that should be split>

Mixed Responsibilities:
  <list of modules mixing unrelated concerns>

Feature Leakage:
  <list of features implemented in wrong layers>

Cross Layer Coupling:
  <list of inappropriate cross-layer dependencies>

-------------------------------------------------
DEPENDENCY ANALYSIS (v2.3.0)
-------------------------------------------------
Circular Dependencies:
  <list of circular dependency chains>

Dependency Direction:
  <description of dependency flow direction>

Layer Violations:
  <list of dependencies that cross layer boundaries>

Tight Coupling:
  <list of tightly coupled components>

High Fan-in:
  <list of components with many dependents>

High Fan-out:
  <list of components with many dependencies>

Dependency Concentration:
  <analysis of dependency distribution>

Overall Dependency Health:
  <summary assessment>

-------------------------------------------------
SCALABILITY ASSESSMENT (v2.3.0)
-------------------------------------------------
Maintainability:    XX / 100  (<justification>)
Extensibility:      XX / 100  (<justification>)
Modularity:         XX / 100  (<justification>)
Testability:        XX / 100  (<justification>)
Replaceability:     XX / 100  (<justification>)
Deployment Flexibility: XX / 100  (<justification>)

-------------------------------------------------
TECHNICAL DEBT SUMMARY (v2.3.0)
-------------------------------------------------
Structural Debt:        <description>
Architectural Debt:     <description>
Testing Debt:           <description>
Documentation Debt:     <description>
Performance Debt:       <description>
Security Debt:          <description>
Configuration Debt:     <description>
Maintainability Debt:   <description>

Accumulated Debt:       <estimate>
Estimated Cleanup Effort: <estimate>
Engineering Risk:       Low | Medium | High

-------------------------------------------------
ARCHITECTURE RISK MATRIX (v2.3.0)
-------------------------------------------------
| Risk | Impact | Likelihood | Engineering Cost | Recommended Priority |
|------|--------|------------|------------------|---------------------|
| <risk> | <impact> | <likelihood> | <cost> | <priority> |

-------------------------------------------------
DESIGN PATTERNS (v2.3.0)
-------------------------------------------------
Recognized Patterns:
  <list of verified design patterns with evidence>

  Pattern: <name>
  Evidence: <specific files/classes>
  Benefit: <what this pattern provides>

-------------------------------------------------
ANTI-PATTERNS (v2.3.0)
-------------------------------------------------
Detected Anti-Patterns:
  <list of verified anti-patterns with evidence>

  Anti-Pattern: <name>
  Evidence: <specific files/classes>
  Impact: <engineering impact>
  Recommendation: <how to fix>

-------------------------------------------------
MAINTAINABILITY FORECAST (v2.3.0)
-------------------------------------------------
Current Maintainability:  High | Medium | Low

Primary Risks:
  <list of risks to future maintainability>

Expected Growth Impact:
  <how maintainability will change as codebase grows>

Recommended Refactors:
  <prioritized list of refactors>

-------------------------------------------------
REFACTOR OPPORTUNITY MAP (v2.3.0)
-------------------------------------------------
For each refactoring area:

<AreaName>

Refactors:
  - <refactor description>
  - <refactor description>

Estimated Benefit: <what will improve>
Estimated Cost: <effort required>
Priority: P0 | P1 | P2 | P3

-------------------------------------------------
ARCHITECTURE SUMMARY (v2.3.0)
-------------------------------------------------
Strongest Architectural Decisions:
  <list of best architectural choices>

Weakest Architectural Areas:
  <list of areas needing improvement>

Highest Engineering Risks:
  <list of highest risks>

Largest Technical Debt:
  <list of biggest debt items>

Highest ROI Improvements:
  <list of improvements with best return on investment>

-------------------------------------------------
REPOSITORY QUALITY GRADE
-------------------------------------------------
Grade:          A+ | A | A- | B+ | B | B- | C | D | F
Justification:  <why this grade was assigned>

-------------------------------------------------
EXECUTIVE SUMMARY
-------------------------------------------------
<30-second manager view of repository status>

-------------------------------------------------
REPOSITORY EVOLUTION
-------------------------------------------------
Health Score Progression:  <prior → current (delta)>
Findings Fixed:            <count>
New Findings Introduced:   <count>
Remaining Findings:        <count vs prior>
Overall Trend:             Improving | Stable | Regressing

-------------------------------------------------
IMPROVEMENT DELTA
-------------------------------------------------
Resolved:    <list of resolved findings>
New:         <list of new findings>
Regressed:   <list of regressed findings>
Unchanged:   <list of unchanged findings>

-------------------------------------------------
BASELINE ANALYSIS
-------------------------------------------------
<Comparison against .finalcode/BASELINE.md>

-------------------------------------------------
DECISION ANALYSIS
-------------------------------------------------
<Findings requiring human decisions>

-------------------------------------------------
ENGINEERING ROADMAP
-------------------------------------------------
Immediate:   <findings blocking certification>
Short Term:  <findings to fix this cycle>
Medium Term: <planned improvements>
Long Term:   <strategic improvements>

-------------------------------------------------
RELEASE READINESS PREDICTOR
-------------------------------------------------
Current Certification:         <verdict>
Probability of READY TO SHIP:  <estimate>
Remaining Engineering Work:    <count>
Estimated Completion Effort:   <Small | Medium | Large>

-------------------------------------------------
EXECUTIVE DECISION SUMMARY
-------------------------------------------------
Automatic Fixes Completed:    <count> (Repair Mode only)
Human Decisions Required:     <count>
Blocking Decisions:           <count>
Recommended Next Action:      <action>
Estimated Effort Remaining:   <Small | Medium | Large>

-------------------------------------------------
ENGINEERING PRIORITY MATRIX
-------------------------------------------------
<Findings prioritized by P0-P3>

-------------------------------------------------
HUMAN OVERRIDE AWARENESS
-------------------------------------------------
Accepted Recommendations:     <FC-IDs or none>
Deferred Recommendations:     <FC-IDs or none>
Re-Raised Recommendations:    <FC-IDs or none>

-------------------------------------------------
PULL REQUEST ANALYSIS (Inspect/Certify Mode, when Git + target branch available)
-------------------------------------------------
Target Branch:           <branch compared against, e.g. main>
Files Changed:           <count + list>
New Findings:            <findings introduced on this branch>
Resolved Findings:       <findings fixed vs target>
Regression Summary:      <findings that worsened vs target>
Risk Level:              Low | Medium | High
Estimated Review Time:   <e.g. ≈ 25 min>
(If not available: "No Git / target branch information — PR analysis skipped")

-------------------------------------------------
EXECUTION METRICS
-------------------------------------------------
Execution Time:       <wall-clock duration>
Files Scanned:        <count>
Directories:          <count>
Rules Executed:       <gate + plugin checks run>
Tool Calls:           <build/lint/test/scan invocations>
Reports Generated:    <Markdown + JSON + SARIF count>

-------------------------------------------------
TREND SUMMARY (when a baseline exists)
-------------------------------------------------
Health Score:        Previous → Current (Δ)
Resolved Findings:    <count>
New Findings:         <count>
Regressions:          <count>
Improvement Percentage:  <derived from Health Score delta vs start>

-------------------------------------------------
TREND SNAPSHOT
-------------------------------------------------
<appended to .finalcode/TREND.md — not duplicated in report>

-------------------------------------------------
BASELINE COMPARISON
-------------------------------------------------
<compared against .finalcode/BASELINE.md if it exists>

-------------------------------------------------
CERTIFICATION CHECKLIST
-------------------------------------------------
Build:                PASS | FAIL | Not Configured
Type Check:           PASS | FAIL | Not Configured
Lint:                 PASS | FAIL | Not Configured
Tests:                PASS | FAIL | Not Measured
Security:             PASS | FAIL
Documentation:        PASS | FAIL
Accessibility:        PASS | FAIL
CI/CD:                PASS | WARNING | Not Configured
GitHub Ready:         PASS | FAIL

(A failing mandatory row blocks certification per the Release Blocking Policy.)

-------------------------------------------------
RELEASE DECISION SUMMARY
-------------------------------------------------
Release Decision:  READY TO SHIP | READY WITH WARNINGS | NOT READY

Why:
  <exact reason — which gates pass/fail, which blockers exist, which conditions apply>

What Remains:
  <FC-ID>  <one-line description> (<classification> — <blocking status>)
  ...

Estimated Work Remaining:
  To reach READY TO SHIP (unconditional):  <time estimate>
    - <FC-ID>: <effort> (<what needs to be done>)
    ...
  Current deployment target: <whether READY TO SHIP is achievable without resolving Conditional Blockers>

-------------------------------------------------
CERTIFICATION
-------------------------------------------------
FinalCode provides engineering certification based on repository inspection.
It does not guarantee the absence of bugs, security vulnerabilities,
runtime failures, or production incidents.

Overall Reliability:  XX%  (from Confidence Model 2.0)
Certification Status: READY TO SHIP | READY WITH WARNINGS | NOT READY | NO PROJECT FOUND
Exit Code:            0 | 1 | 2 | 3
==================================================

Machine-Readable Reports: this run also emitted
  .finalcode/reports/<timestamp>-<mode>.json   (every finding: id, severity, category, confidence, gate, status, files, recommendation)
  .finalcode/reports/<timestamp>-<mode>.sarif  (SARIF 2.1.0, GitHub Code Scanning compatible)
==================================================
```

## Exit Code Convention

| Exit Code | Meaning |
|---|---|
| 0 | READY TO SHIP — all mandatory gates PASS |
| 1 | READY WITH WARNINGS — mandatory gates PASS but warnings exist |
| 2 | NOT READY — one or more mandatory gates FAIL |
| 3 | NO PROJECT FOUND — no valid project detected |

## Report Engine Section Registry

The Report Engine produces 53 documented sections in a fixed order:

1. Executive Dashboard
2. Audit Metadata
3. Repository Metadata
4. Repository Coverage
5. Warning Analysis
6. Release Blocker Summary
7. Risk Matrix
8. Quality Gate Summary
9. Engineering Policy
10. Findings
11. Security Report
12. Fixes Applied (Repair Mode)
13. Refactors Applied (Refactor Mode)
14. Intelligent Repair Stop (Repair Mode)
15. Audit Statistics
16. Evidence Summary (v2.2.0)
17. Engineering Assumptions (v2.2.0)
18. Analysis Trace (v2.2.0)
19. Report Completeness (v2.2.0)
20. Confidence Model 2.0
21. Certification Confidence Model
22. Runtime Capability Disclosure
23. Engineering Metrics
24. Repository Health Score
25. Architecture Overview (v2.3.0)
26. Module Health (v2.3.0)
27. Responsibility Analysis (v2.3.0)
28. Dependency Analysis (v2.3.0)
29. Scalability Assessment (v2.3.0)
30. Technical Debt Summary (v2.3.0)
31. Architecture Risk Matrix (v2.3.0)
32. Design Patterns (v2.3.0)
33. Anti-Patterns (v2.3.0)
34. Maintainability Forecast (v2.3.0)
35. Refactor Opportunity Map (v2.3.0)
36. Architecture Summary (v2.3.0)
37. Repository Quality Grade
38. Executive Summary
39. Repository Evolution
40. Improvement Delta
41. Baseline Analysis
42. Decision Analysis
43. Engineering Roadmap
44. Release Readiness Predictor
45. Executive Decision Summary
46. Engineering Priority Matrix
47. Human Override Awareness
48. Pull Request Analysis
49. Execution Metrics
50. Trend Summary
51. Trend Snapshot
52. Baseline Comparison
53. Certification Checklist
54. Release Decision Summary
55. Certification

See `core/report-engine.md` for the complete section specifications and formatting rules.
