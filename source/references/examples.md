# FinalCode — Example Outputs & Test Cases

Three worked examples covering the required test scenarios: a clean repository, a repository with multiple issues, and a missing repository. A fourth short excerpt shows the Repair Mode execution plan. Use these as the formatting template — same section order, same level of evidence detail, same exit code convention as SKILL.md. All examples reflect FinalCode v1.9.0 (OpenCode Edition): 13 Quality Gates, Security Gate 2.0 (14 categories), the v1.7.0 Engineering Intelligence, the v1.8.0 configurable platform, the v1.8.1 report-quality and decision-support features, the v1.8.2 decision engine and report precision features, and the v1.9.0 modular engineering architecture with Explainability Engine.

---

## Test Case 1: Clean Repository (Certify Mode → READY TO SHIP)

**Prompt:** "Run FinalCode in Certify Mode on this repo, it's about to ship."

**Expected behavior:** Full audit, all 13 gates pass, no Confirmed Defects or Security Vulnerabilities, certifies READY TO SHIP (exit 0). The v1.8.2 dashboard with Grade Justification, Warning Analysis, Release Blocker Summary, Health Score Explanation, Certification Confidence Model, Improvement Delta, Engineering Priority Matrix, and Release Decision Summary all appear in their default/no-action states.

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
Grade Justification:     Excellent architecture — clean separation of concerns, no circular dependencies.
                         Strong security — no Critical/High findings, secrets properly managed.
                         Strong testing — 86% coverage with comprehensive unit and integration tests.
                         Minor documentation gap — missing changelog entry (non-blocking).
Production Readiness:    94%  (target 90)
Security Rating:         A+
Maintainability Rating:  A
Testing Status:          Pass
Estimated Remaining Effort:  None

--------------------------------------------------
AUDIT METADATA
--------------------------------------------------
Specification Version:  1.8.2 (OpenCode Edition)
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

--------------------------------------------------
WARNING ANALYSIS
--------------------------------------------------
Warning Breakdown:
  no-explicit-any ............ 3
  no-console ................. 0
  unused variables ........... 1
  deprecated APIs ............ 0
  other ...................... 0
  Total warnings:              4

Top 5 Warning Categories:
  1. no-explicit-any (3) — estimated 15 minutes to review, low type-safety impact
  2. unused variables (1) — estimated 5 minutes, low impact

Estimated Total Cleanup Effort:  ~20 minutes
Expected Engineering Impact:    Low — minor type safety improvements; no security or performance impact

--------------------------------------------------
RELEASE BLOCKER SUMMARY
--------------------------------------------------
Release Blockers:           0
Conditional Blockers:       0
Engineering Recommendations: 1  (documentation)
Informational:              0

Blocking Conditions:
  No blocking conditions active for current deployment target.

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
- Release Blocker Classification: Engineering Recommendation
- Engineering Category: Documentation
- Engineering Cost: Low
- Estimated Effort: 30 minutes
- Risk if Ignored: Maintainability
- Severity: Low
- Category: Missing changelog entry
- Status: Non-blocking
- Recommendation: Priority P3, Effort 30 minutes, Impact "complete release notes", Prerequisites "none", Verification "changelog entry present"

EXPLAINABILITY:
  Observed Evidence: No CHANGELOG.md found in repository root.
  Applicable Rule: Documentation Gate — "CHANGELOG.md must exist with version history."
  Reasoning: The repository lacks a changelog, which is a documentation best practice.
  Engineering Impact: Low — users cannot see version history.
  Severity Justification: Low because documentation gap has minimal engineering impact.
  Classification Justification: Engineering Recommendation because this is an improvement, not a defect.
  Release Impact Justification: Engineering Recommendations never block release.
  Alternative Decisions Considered: None — clear documentation gap.
  Human Assumptions: Assumed this is a new repository (first execution).
  Confidence Factors: + High confidence: file absence is verifiable.

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
Health Score: 94 / 100 (Excellent)

Weighted Breakdown:
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

Major Contributors:
  Security (19.4) — strong authentication and secrets management
  Architecture (14.3) — clean separation of concerns, no circular dependencies
  Maintainability (13.9) — well-structured modules, low duplication

Largest Deductions:
  Performance (-1.0) — bundle size slightly above target
  Documentation (-0.9) — missing changelog entry

How to Gain the Next 5 Points (target: 99):
  1. Add changelog entry (+0.9 points)
  2. Optimize bundle size (+0.5 points)
  3. Add missing API documentation (+0.3 points)
  Total potential gain: +1.7 points (to 95.7; remaining 3.3 requires architecture improvements)

-------------------------------------------------
REPOSITORY QUALITY GRADE
-------------------------------------------------
Engineering Grade: A  (Health Score 94 → A range 90–94)

Reason:
  Excellent architecture — clean separation of concerns, no circular dependencies.
  Strong security — no Critical/High findings, secrets properly managed.
  Strong testing — 86% coverage with comprehensive unit and integration tests.
  Minor documentation gap — missing changelog entry (non-blocking).

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
CERTIFICATION CONFIDENCE MODEL
-------------------------------------------------
Static Analysis Confidence:    99%  (why: lint + type check passed; 3 warnings are informational)
Testing Confidence:            95%  (why: unit tests pass; integration tests at 86% coverage)
Runtime Confidence:            85%  (why: no runtime harness; static analysis only)
Documentation Confidence:      92%  (why: README complete; API docs 90%; architecture docs present)
Deployment Confidence:         98%  (why: build passes; CI configured; deployment target known)

Overall Reliability:           94%  (weighted: Static 25%, Testing 30%, Runtime 15%, Docs 15%, Deploy 15%)

Overall Reliability is NOT a probability. It represents evidence completeness — how much of the
repository's production readiness was actually verified versus assumed.

-------------------------------------------------
IMPROVEMENT DELTA
-------------------------------------------------
Compared against: none (first execution — baseline established this run)

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
Repository Status: Production Ready | Health Score: 94/100 | Grade: A | Overall Reliability: 94%
Strengths: comprehensive tests, strong types, clean security
Weaknesses: missing changelog entry (non-blocking)
Most Critical Remaining Risk: none | Recommended Next Action: ship | Release: Go

-------------------------------------------------
ENGINEERING PRIORITY MATRIX
-------------------------------------------------
Finding ID     Priority  Business Impact  Engineering Effort  Risk    Recommended Sprint
FC-DOC-001     P3        Low              30 minutes          None    Sprint 3 (optional)

-------------------------------------------------
RELEASE DECISION SUMMARY
-------------------------------------------------
Release Decision:  READY TO SHIP

Why:
  All mandatory Quality Gates pass (13/13).
  No Release Blockers found.
  No Conditional Blockers found.
  1 Engineering Recommendation remains (non-blocking).

What Remains:
  FC-DOC-001  — Missing changelog entry (Engineering Recommendation; non-blocking)

Estimated Work Remaining:
  To reach READY TO SHIP (unconditional):  ~20 minutes
    - FC-DOC-001: 20 minutes (add changelog entry)
  Current deployment target: READY TO SHIP is achievable.

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
Overall Reliability: 94%
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

**Expected behavior:** Multiple findings; demonstrates Release Blocker Engine (Conditional Blocker for FC-PERF-001), Warning Analyzer, Health Score Explanation, Grade Justification, Finding Impact Analysis, Improvement Delta, Certification Confidence Model, Engineering Priority Matrix, and Release Decision Summary. Verdict NOT READY (exit 2).

**Example output (excerpt):**

```
EXECUTIVE ENGINEERING DASHBOARD
--------------------------------------------------
Overall Status:         NOT READY
Overall Risk:            High
Health Score:           64 / 100 (Fair)
Engineering Grade:       D
Grade Justification:     Fair architecture — some circular dependencies detected.
                         Weak security — 1 Critical finding (hardcoded API key).
                         Low testing — integration tests not configured.
                         Poor documentation — missing architecture docs.
                         Performance issues — in-memory cache not suitable for multi-instance.
Production Readiness:    64%  (target 90)
Security Rating:         D
Maintainability Rating:  C
Testing Status:          Fail
Estimated Remaining Effort:  Medium

--------------------------------------------------
WARNING ANALYSIS
--------------------------------------------------
Warning Breakdown:
  no-explicit-any ............ 412
  no-console .................  67
  unused variables ...........   5
  react-hooks ................   0
  deprecated APIs ............   3
  other ......................   8
  Total warnings:              495

Top 5 Warning Categories:
  1. no-explicit-any (412) — estimated 4 hours to review, high type-safety impact
  2. no-console (67) — estimated 1 hour to clean, low impact
  3. unused variables (5) — estimated 10 minutes, low impact
  4. deprecated APIs (3) — estimated 30 minutes, medium security/maintenance impact
  5. other (8) — estimated 20 minutes, variable impact

Estimated Total Cleanup Effort:  ~6 hours
Expected Engineering Impact:    Moderate — type safety and maintainability improve significantly;
                                console cleanup is cosmetic; deprecated API removal reduces future risk.

--------------------------------------------------
RELEASE BLOCKER SUMMARY
--------------------------------------------------
Release Blockers:           1  (FC-SEC-001)
Conditional Blockers:       1  (FC-PERF-001)
Engineering Recommendations: 5
Informational:              3

Blocking Conditions:
  FC-PERF-001 — blocks when: multi-instance deployment, horizontal scaling, distributed Cloudflare Workers,
                or public API under heavy load

RISK MATRIX
-------------------------------------------------
Critical: 1 | High: 1 | Medium: 2 | Low: 15 | Informational: 4
Blocking Issues: 2 (FC-SEC-001 Critical, FC-PERF-001 Conditional in multi-instance)
Non-Blocking Issues: 21

FINDINGS (excerpt)
--------------------------------------------------
[Security Gate] FC-SEC-001
- Release Blocker Classification: Release Blocker
- Engineering Category: Human Decision Required
- Engineering Cost: Low
- Estimated Effort: 30 minutes
- Risk if Ignored: Security, Release
- Severity: Critical
- Decision Analysis: key rotation is a business action; recommended Option A
- Recommendation: Priority P0, Effort 30 minutes, Impact "removes exposure",
  Prerequisites "rotate key + deploy", Verification "secret-scanner CI passes"

EXPLAINABILITY:
  Observed Evidence: Hardcoded API key in src/config.ts:42.
  Applicable Rule: Security Gate 2.0 — Secrets Management.
  Reasoning: Key is visible in source code, exploitable immediately.
  Engineering Impact: Immediate security risk — unauthorized API access.
  Severity Justification: Critical — immediate security risk, data loss potential.
  Classification Justification: Security Vulnerability — verified security weakness.
  Release Impact Justification: Release Blocker — Critical severity security vulnerability.
  Alternative Decisions Considered: Engineering Recommendation (rejected — this is a vulnerability).
  Human Assumptions: Assumed key is production based on format.
  Confidence Factors: + High confidence: key format matches production API keys.

[Type Safety] FC-TYPE-003 (Unsafe subset)
- Release Blocker Classification: Engineering Recommendation
- Engineering Category: Breaking Change (public API boundary)
- Engineering Cost: Medium
- Estimated Effort: 2 hours
- Risk if Ignored: Maintainability, Release
- Smart Finding Classification: Unsafe (expanded); Safe ×29 collapsed, Needs Review ×7
- Recommendation: Priority P1, Effort 2 hours, Impact "type safety", Prerequisites "API contract"

EXPLAINABILITY:
  Observed Evidence: `any` type used in public API boundary (src/api/types.ts:15).
  Applicable Rule: Type Safety Gate — "No unsafe `any` in public API surfaces."
  Reasoning: `any` bypasses type checking, defeating TypeScript's safety guarantees.
  Engineering Impact: Medium — type safety compromised at API boundary.
  Severity Justification: Medium — maintainability impact, not immediate security risk.
  Classification Justification: Confirmed Defect — objective type safety violation.
  Release Impact Justification: Engineering Recommendation — does not block release.
  Alternative Decisions Considered: Low severity (rejected — API boundary is important).
  Human Assumptions: Assumed this is a public API based on file location.
  Confidence Factors: + High confidence: `any` is verifiable.

[Performance] FC-PERF-001
- Release Blocker Classification: Conditional Blocker
- Engineering Category: Infrastructure Decision
- Engineering Cost: Medium
- Estimated Effort: Half day
- Risk if Ignored: Performance, Release
- Deployment Intelligence: suitable single-instance; unsupported multi-instance/serverless;
  production risk cache incoherence; alternative Redis/Cloudflare KV
- Blocking Condition: multi-instance deployment, horizontal scaling, distributed workers

EXPLAINABILITY:
  Observed Evidence: In-memory cache in src/cache.ts:28.
  Applicable Rule: Performance Gate — "Cache must be suitable for deployment target."
  Reasoning: In-memory cache works for single instance but causes incoherence in multi-instance.
  Engineering Impact: High for multi-instance (cache incoherence), Low for single instance.
  Severity Justification: Medium — depends on deployment target.
  Classification Justification: Confirmed Defect for multi-instance, Engineering Recommendation for single.
  Release Impact Justification: Conditional Blocker — blocks only multi-instance deployment.
  Alternative Decisions Considered: Release Blocker (rejected — not applicable to all targets).
  Human Assumptions: Assumed single-instance deployment for this evaluation.
  Confidence Factors: + High confidence: cache implementation is verifiable.

QUALITY GATE SUMMARY: 6/13 PASS, 7 FAIL
FINALCODE SECURITY REPORT: Secrets 1 Critical → Overall D

REPOSITORY HEALTH SCORE
-------------------------------------------------
Health Score: 64 / 100 (Fair)

Weighted Breakdown:
  Category        Weight  Score  Contribution
  Security        20%     55     11.0
  Architecture    15%     78     11.7
  Maintainability 15%     72     10.8
  Performance     10%     60     06.0
  Documentation   10%     50     05.0
  Accessibility   10%     65     06.5
  Testing         10%     45     04.5
  Type Safety      5%     70     03.5
  GitHub Ready     5%     80     04.0
  Dead Code        0%     65     00.0
  Final Health Score 100%          64 / 100

Major Contributors:
  Architecture (11.7) — reasonable separation of concerns despite some issues
  Maintainability (10.8) — moderate code structure

Largest Deductions:
  Security (-9.0) — hardcoded API key (Critical finding)
  Testing (-5.5) — integration tests not configured
  Documentation (-5.0) — missing architecture docs

How to Gain the Next 5 Points (target: 69):
  1. Remove hardcoded API key (+4.5 points)
  2. Configure integration tests (+2.0 points)
  3. Add architecture documentation (+1.5 points)
  Total potential gain: +8.0 points (to 72; exceeds target)

REPOSITORY QUALITY GRADE: D (64 → D range 50–59)

Reason:
  Fair architecture — some circular dependencies detected.
  Weak security — 1 Critical finding (hardcoded API key).
  Low testing — integration tests not configured.
  Poor documentation — missing architecture docs.
  Performance issues — in-memory cache not suitable for multi-instance.

CONFIDENCE MODEL 2.0
-------------------------------------------------
Analysis Confidence: 90% | Evidence Coverage: 100% (9/9 evidenced)
Verification Coverage: 80% (build pass, tests not measured)
Runtime Coverage: 70% (no runtime) | Repository Coverage: 99%
Overall Reliability: 90%

CERTIFICATION CONFIDENCE MODEL
-------------------------------------------------
Static Analysis Confidence:    92%  (why: lint + type check passed; 495 warnings)
Testing Confidence:            60%  (why: unit tests pass; no integration tests; coverage unknown)
Runtime Confidence:            50%  (why: no runtime harness; static analysis only)
Documentation Confidence:      65%  (why: README present; missing architecture docs; API docs partial)
Deployment Confidence:         85%  (why: build passes; CI configured; deployment target known)

Overall Reliability:           72%  (weighted: Static 25%, Testing 30%, Runtime 15%, Docs 15%, Deploy 15%)

Overall Reliability is NOT a probability. It represents evidence completeness — how much of the
repository's production readiness was actually verified versus assumed.

IMPROVEMENT DELTA
-------------------------------------------------
Compared against: inspection 2026-07-08 (commit abc1234)

Resolved:
  FC-SEC-002  outdated dependency removed
  FC-DOC-001  README updated

New:
  FC-SEC-001  hardcoded API key (Critical)
  FC-PERF-001  in-memory cache incoherence

Regressed:
  FC-TYPE-003  Medium → High (new public API boundary exposed)

Unchanged:
  FC-TEST-001  missing integration tests (unchanged since baseline)
  FC-A11Y-002  missing ARIA labels (unchanged since baseline)

Net Change: +1 finding (2 resolved, 5 remaining from prior; 2 new, 2 unchanged)
Overall Direction: Regressing (Health Score -7 since baseline)

RUNTIME CAPABILITY DISCLOSURE
-------------------------------------------------
Verified: static + build + type + dead code + UI + security
Not Executed: load/pen testing
Assumed: dependency scan not executed

EXECUTION METRICS: Time 42.1s | Files 238 | Dirs 3 | Rules 13 | Tool Calls 6 | Reports 3

ENGINEERING PRIORITY MATRIX
-------------------------------------------------
Finding ID     Priority  Business Impact  Engineering Effort  Risk    Recommended Sprint
FC-SEC-001     P0        High             30 minutes          High    Sprint 0 (blocker)
FC-PERF-001    P1        High             Half day            Medium  Sprint 1
FC-TYPE-003    P1        Medium           2 hours             Medium  Sprint 1
FC-TEST-001    P2        Medium           Multiple days       Low     Sprint 2
FC-DOC-002     P3        Low              5 minutes           None    Sprint 3 (optional)

RELEASE DECISION SUMMARY
-------------------------------------------------
Release Decision:  NOT READY

Why:
  1 mandatory Quality Gate fails (Security).
  1 Release Blocker exists (FC-SEC-001 — hardcoded API key).
  1 Conditional Blocker exists (FC-PERF-001) that blocks multi-instance deployment.
  5 Engineering Recommendations remain (non-blocking).

What Remains:
  FC-SEC-001  — Hardcoded API key (Release Blocker; must resolve before any release)
  FC-PERF-001  — In-memory cache incoherence (Conditional Blocker; blocks multi-instance)
  FC-TYPE-003  — Unsafe `any` in public API (Engineering Recommendation)
  FC-TEST-001  — Missing integration tests (Engineering Recommendation)
  FC-DOC-002   — Missing API documentation (Engineering Recommendation)

Estimated Work Remaining:
  To reach READY TO SHIP (unconditional):  ~6 hours
    - FC-SEC-001: 30 minutes (rotate key + deploy)
    - FC-PERF-001: 4 hours (implement Redis/Cloudflare KV)
    - FC-TYPE-001: 2 hours (fix type safety)
    - FC-TEST-001: 4 hours (add integration tests)
    - FC-DOC-002: 30 minutes (add JSDoc)
  Current deployment target (single-instance): READY TO SHIP achievable after FC-SEC-001 resolved.

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
Overall Reliability: 72%
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

Repair Mode loads config/profile/baseline/ignore, activates plugins, and for each automatable item runs the Automatic Verification Pipeline, then emits Dashboard with Grade Justification, Warning Analysis, Release Blocker Summary, Health Score Explanation, Certification Confidence Model, Improvement Delta, Engineering Priority Matrix, Release Decision Summary, and machine-readable reports. FC-SEC-001 (Human Decision Required) carries a Decision Analysis and is excluded from automatic repair; when only it remains, Repair Mode issues an Intelligent Repair Stop.
