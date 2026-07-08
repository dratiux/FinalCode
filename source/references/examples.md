# FinalCode — Example Outputs & Test Cases

Three worked examples covering the required test scenarios: a clean repository, a repository with multiple issues, and a missing repository. A fourth short excerpt shows the Repair Mode execution plan. Use these as the formatting template — same section order, same level of evidence detail, same exit code convention as SKILL.md. All examples reflect FinalCode v1.8.1 (OpenCode Edition): 13 Quality Gates, Security Gate 2.0 (14 categories), the v1.7.0 Engineering Intelligence, the v1.8.0 configurable platform, and the v1.8.1 report-quality and decision-support features (Executive Dashboard, Health Score Formula, Confidence Model 2.0, Risk Matrix, Engineering Effort, Smart Finding Classification, Certification Checklist, Trend Summary, Runtime Capability Disclosure, Execution Metrics, Repository Quality Grade, Better Recommendation Engine).

---

## Test Case 1: Clean Repository (Certify Mode → READY TO SHIP)

**Prompt:** "Run FinalCode in Certify Mode on this repo, it's about to ship."

**Expected behavior:** Full audit, all 13 gates pass, no Confirmed Defects or Security Vulnerabilities, certifies READY TO SHIP (exit 0). The v1.8.1 dashboard, formula, confidence model, risk matrix, checklist, and grade all appear in their default/no-action states.

**Example output (excerpt):**

```
==================================================
FINALCODE CERTIFICATION REPORT
==================================================

EXECUTIVE ENGINEERING DASHBOARD
--------------------------------------------------
Overall Status:         READY TO SHIP
Overall Risk:            Low
Health Score:           94 / 100 (Excellent)
Engineering Grade:       A
Production Readiness:    94%  (target 90)
Security Rating:         A+
Maintainability Rating:  A
Testing Status:          Pass
Estimated Remaining Effort:  None

--------------------------------------------------
AUDIT METADATA
--------------------------------------------------
Specification Version:  1.8.1 (OpenCode Edition)
Mode:                    Certify
Profile:                 production
Inspection Type:         Full
Configuration Source:    default production policy (no config file found)

--------------------------------------------------
REPOSITORY METADATA
--------------------------------------------------
Framework:           Next.js 14 (App Router)
Active Plugins:      none

--------------------------------------------------
REPOSITORY COVERAGE
--------------------------------------------------
Files Scanned:            142
Files Ignored:            1,204 (node_modules, .next generated)
Coverage Percentage:        100%

-------------------------------------------------
RISK MATRIX
-------------------------------------------------
Critical:           0
High:               0
Medium:             0
Low:                1
Informational:      0
Blocking Issues:      0
Non-Blocking Issues:  1  (Documentation recommendation)

--------------------------------------------------
QUALITY GATE SUMMARY
--------------------------------------------------
Architecture         PASS
... (all 13 PASS) ...
GitHub Readiness     PASS

--------------------------------------------------
FINDINGS
--------------------------------------------------
Documentation Gate:
- Engineering Category: Documentation
- Estimated Effort: 30 minutes
- Severity: Low
- Category: Missing changelog entry
- Status: Non-blocking
- Recommendation: Priority P3, Effort 30 minutes, Impact "complete release notes", Prerequisites "none", Verification "changelog entry present"

(No Confirmed Defects or Security Vulnerabilities across any of the 13 gates.)

--------------------------------------------------
FINALCODE SECURITY REPORT
--------------------------------------------------
... (14 categories, all clean) ...
Overall Security Rating: A+

--------------------------------------------------
ENGINEERING POLICY
--------------------------------------------------
Profile: production | Enabled Rules: all 13 gates | Disabled: none | Policy: any forbidden, Security Gate mandatory | Health Target: 90

--------------------------------------------------
ENGINEERING METRICS
--------------------------------------------------
Cyclomatic Complexity: 4.2 | Type Coverage: 98% | Test Coverage: 86% | Build: Pass | Type Check: Pass | Lint: Pass

-------------------------------------------------
REPOSITORY HEALTH SCORE
-------------------------------------------------
Weighted Formula:
  Category        Weight  Score  Contribution
  Security        20%     97     19.4
  Architecture    15%     95     14.3
  Maintainability 15%     93     13.9
  Performance     10%     90     09.0
  Documentation   10%     91     09.1
  Accessibility   10%     96     09.6
  Testing         10%     92     09.2
  Type Safety      5%     98     04.9
  GitHub Ready     5%     95     04.8
  Dead Code        0%     99     00.0
  Final Health Score 100%          94 / 100

-------------------------------------------------
REPOSITORY QUALITY GRADE
-------------------------------------------------
Engineering Grade: A  (Health Score 94 → A range 90–94)

-------------------------------------------------
CONFIDENCE MODEL 2.0
-------------------------------------------------
Analysis Confidence:   99%  (why: checks deterministic and evidence-backed)
Evidence Coverage:     100% (why: 1/1 findings evidenced)
Verification Coverage: 99%  (why: build+lint+type check passed; tests 86%)
Runtime Coverage:      95%  (why: no runtime harness; static + build verification)
Repository Coverage:   100% (why: 100% of repo scanned)
Overall Reliability:   99%  (weighted synthesis)

-------------------------------------------------
RUNTIME CAPABILITY DISCLOSURE
-------------------------------------------------
Verified: Static Analysis, Architecture, Type Checking, Build, Dead Code, UI, Security
Runtime Executed: none this execution
Not Executed: Runtime Load Testing (no harness), Penetration Testing (out of scope)
Assumed: Dependency scan not executed; static review found no obvious vulnerable patterns

-------------------------------------------------
EXECUTION METRICS
-------------------------------------------------
Execution Time: 18.4s | Files Scanned: 142 | Directories: 5 | Rules Executed: 13 | Tool Calls: 4 | Reports Generated: 3

-------------------------------------------------
EXECUTIVE SUMMARY
-------------------------------------------------
Repository Status: Production Ready | Health Score: 94/100 | Grade: A | Overall Reliability: 99%
Strengths: comprehensive tests, strong types, clean security
Weaknesses: missing changelog entry (non-blocking)
Most Critical Remaining Risk: none | Recommended Next Action: ship | Release: Go

-------------------------------------------------
REPOSITORY EVOLUTION / BASELINE ANALYSIS / DECISION / ROADMAP / RELEASE PREDICTOR
-------------------------------------------------
(first run — baseline established; no prior baseline; no human decisions; roadmap empty;
 READY TO SHIP, probability 100%)

-------------------------------------------------
PULL REQUEST ANALYSIS
-------------------------------------------------
No Git / target branch information — PR analysis skipped

-------------------------------------------------
TREND SUMMARY
-------------------------------------------------
No baseline exists (first execution)

-------------------------------------------------
CERTIFICATION CHECKLIST
-------------------------------------------------
Build: PASS | Type Check: PASS | Lint: PASS | Tests: PASS | Security: PASS
Documentation: PASS | Accessibility: PASS | CI/CD: Not Configured | GitHub Ready: PASS

-------------------------------------------------
CERTIFICATION
-------------------------------------------------
Overall Reliability: 99%
Certification Status: READY TO SHIP
Exit Code: 0

Machine-Readable Reports: this run also emitted
  .finalcode/reports/<timestamp>-certify.json
  .finalcode/reports/<timestamp>-certify.sarif
==================================================
```

---

## Test Case 2: Repository With Multiple Issues (Inspect Mode → NOT READY)

**Prompt:** "Audit this repo before we merge to main." (branch `feature/settings-page`)

**Expected behavior:** Multiple findings; demonstrates Smart Finding Classification (engineering categories + occurrence Safe/Needs Review/Unsafe), per-finding Estimated Effort, Decision Analysis, Deployment Intelligence, Risk Matrix with blocking issues, Health Score formula, Confidence Model 2.0, Grade (e.g. C/D), Runtime Capability Disclosure, Execution Metrics, Certification Checklist (Tests FAIL), Trend Summary vs baseline, and PR Analysis. Verdict NOT READY (exit 2).

**Example output (excerpt):**

```
EXECUTIVE ENGINEERING DASHBOARD
--------------------------------------------------
Overall Status:         NOT READY
Overall Risk:            High
Health Score:           64 / 100 (Fair)
Engineering Grade:       D
Production Readiness:    64%  (target 90)
Security Rating:         D
Maintainability Rating:  C
Testing Status:          Fail
Estimated Remaining Effort:  Medium

RISK MATRIX
-------------------------------------------------
Critical: 1 | High: 1 | Medium: 2 | Low: 15 | Informational: 4
Blocking Issues: 1 (FC-SEC-001 Critical)
Non-Blocking Issues: 22

FINDINGS (excerpt)
--------------------------------------------------
[Security Gate] FC-SEC-001
- Engineering Category: Human Decision Required
- Estimated Effort: Multiple days
- Severity: Critical
- Decision Analysis: key rotation is a business action; recommended Option A
- Recommendation: Priority P0, Effort Multiple days, Impact "removes exposure",
  Prerequisites "rotate key + deploy", Verification "secret-scanner CI passes"

[Type Safety] FC-TYPE-003 (Unsafe subset)
- Engineering Category: Breaking Change (public API boundary)
- Estimated Effort: 2 hours
- Smart Finding Classification: Unsafe (expanded); Safe ×29 collapsed, Needs Review ×7
- Recommendation: Priority P1, Effort 2 hours, Impact "type safety", Prerequisites "API contract"

[Performance] FC-PERF-001
- Engineering Category: Infrastructure Decision
- Estimated Effort: Half day
- Deployment Intelligence: suitable single-instance; unsupported multi-instance/serverless;
  production risk cache incoherence; alternative Redis/Cloudflare KV

QUALITY GATE SUMMARY: 6/13 PASS, 7 FAIL
FINALCODE SECURITY REPORT: Secrets 1 Critical → Overall D

REPOSITORY HEALTH SCORE
-------------------------------------------------
Weighted Formula (example):
  Security 20% × 55 = 11.0
  Architecture 15% × 78 = 11.7
  ... → Final 64 / 100

REPOSITORY QUALITY GRADE: C (64 → C range 60–69)

CONFIDENCE MODEL 2.0
-------------------------------------------------
Analysis Confidence: 90% | Evidence Coverage: 100% (9/9 evidenced)
Verification Coverage: 80% (build pass, tests not measured)
Runtime Coverage: 70% (no runtime) | Repository Coverage: 99%
Overall Reliability: 90%

RUNTIME CAPABILITY DISCLOSURE
-------------------------------------------------
Verified: static + build + type + dead code + UI + security
Not Executed: load/pen testing
Assumed: dependency scan not executed

EXECUTION METRICS: Time 42.1s | Files 238 | Dirs 3 | Rules 13 | Tool Calls 6 | Reports 3

CERTIFICATION CHECKLIST
-------------------------------------------------
Build: PASS | Type Check: FAIL | Lint: FAIL | Tests: Not Measured | Security: FAIL
Documentation: FAIL | Accessibility: FAIL | CI/CD: WARNING | GitHub Ready: PASS

TREND SUMMARY (baseline exists)
-------------------------------------------------
Health Score: 71 → 64 (Δ -7)
Resolved Findings: 3 | New Findings: 2 | Regressions: 1 (FC-TYPE-003 Medium→High)
Improvement Percentage: -9.9%

PULL REQUEST ANALYSIS
-------------------------------------------------
Target: main | Files Changed: 14 | New: FC-SEC-001, FC-PERF-001 | Resolved: FC-DEAD-002
Regression: FC-TYPE-003 | Risk: High | Est. Review: ≈ 35 min

CERTIFICATION
-------------------------------------------------
Overall Reliability: 90%
Certification Status: NOT READY
Exit Code: 2
```

---

## Test Case 3: Missing Repository (Any Mode → NO PROJECT FOUND)

**Prompt:** "Run FinalCode on this project" (empty directory).

**Expected behavior:** Phase 0 fails; skip all sections; dashboard shows N/A; NO PROJECT FOUND (exit 3).

```
EXECUTIVE ENGINEERING DASHBOARD
--------------------------------------------------
Overall Status: NO PROJECT FOUND
(other dashboard fields: N/A)

AUDIT METADATA: Mode: Inspect | Profile/Inspection Type/Config Source: N/A
REPOSITORY METADATA: N/A — no repository detected
... (Coverage, Gates, Findings, Security, Dashboard metrics: skipped) ...

CERTIFICATION
-------------------------------------------------
Overall Reliability: N/A
Certification Status: NO PROJECT FOUND
Exit Code: 3
```

---

## Repair Mode Execution Plan (excerpt)

Repair Mode loads config/profile/baseline/ignore, activates plugins, and for each automatable item runs the Automatic Verification Pipeline, then emits Dashboard, Risk Matrix, Confidence Model 2.0, Certification Checklist, and machine-readable reports. FC-SEC-001 (Human Decision Required) carries a Decision Analysis and is excluded from automatic repair; when only it remains, Repair Mode issues an Intelligent Repair Stop.
