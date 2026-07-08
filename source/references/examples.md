# FinalCode — Example Outputs & Test Cases

Three worked examples covering the required test scenarios: a clean repository, a repository with multiple issues, and a missing repository. A fourth short excerpt shows the Repair Mode execution plan. Use these as the formatting template — same section order, same level of evidence detail, same exit code convention as SKILL.md. All examples reflect FinalCode v1.8.0 (OpenCode Edition): 13 Quality Gates, Security Gate 2.0 (14 categories), the v1.7.0 Engineering Intelligence sections, and the v1.8.0 configurable platform (Engineering Policy, Baseline, Ignore, Incremental/PR inspection, Machine-Readable Reports, Plugins).

---

## Test Case 1: Clean Repository (Certify Mode → READY TO SHIP)

**Prompt:** "Run FinalCode in Certify Mode on this repo, it's about to ship."

**Expected behavior:** Phase 0/1 discovery runs fully, all 13 gates are checked, no Confirmed Defects or Security Vulnerabilities exist, so the report certifies READY TO SHIP with exit code 0. The v1.8.0 sections appear with their default/no-action states (default production policy, no config file, no baseline, no PR context).

**Example output:**

```
==================================================
FINALCODE CERTIFICATION REPORT
==================================================

AUDIT METADATA
--------------------------------------------------
Specification Version:  1.8.0 (OpenCode Edition)
Audit Engine Version:    <internal version>
Report Version:          1
Repository Version:      v2.3.0
Git Commit:              a1b2c3d
Audit Date:              2026-07-08
Mode:                    Certify
Profile:                 production
Inspection Type:         Full
Configuration Source:    default production policy (no config file found)

--------------------------------------------------
REPOSITORY METADATA
--------------------------------------------------
Project Root:       /repo
Framework:           Next.js 14 (App Router)
Language(s):        TypeScript
Build System:        Next.js / Turbopack
Package Manager:     pnpm
Entry Points:        app/layout.tsx, app/page.tsx
Active Plugins:      none

--------------------------------------------------
REPOSITORY COVERAGE
--------------------------------------------------
Files Scanned:            142
Files Ignored:            1,204 (node_modules, .next build output — generated/vendored)
Files Skipped:             0
Directories Scanned:       app/, components/, lib/, public/, tests/
Languages Detected:        TypeScript, CSS
Configuration Reviewed:    package.json, tsconfig.json, next.config.js, .env.example
Assets Inspected:          public/ icons and images (12 files)
Uninspectable Portions:     none
Coverage Percentage:        100%

--------------------------------------------------
QUALITY GATE SUMMARY
--------------------------------------------------
Architecture         PASS
Code Quality         PASS
Dead Code            PASS
Dependencies         PASS
Type Safety          PASS
Error Handling       PASS
Testing              PASS
Performance          PASS
Security             PASS
Accessibility        PASS
UI Consistency       PASS
Documentation        PASS
GitHub Readiness     PASS

-------------------------------------------------
ENGINEERING POLICY
-------------------------------------------------
Profile:                 production
Enabled Rules:           all 13 gates; policy: any forbidden, max complexity 15, Security Gate mandatory, tests required, health target 90
Disabled Rules:          none
Configuration Source:    default production policy (no config file found)
Policy Version:          policy-1
Health Score Target:     90

--------------------------------------------------
FINDINGS
--------------------------------------------------
Documentation Gate:
- Classification: Engineering Recommendation
- Severity: Low
- Category: Missing changelog entry
- Affected Files: CHANGELOG.md
- Status: Non-blocking (Recommendations never block certification)

No Confirmed Defects or Security Vulnerabilities across any of the 13 gates.

--------------------------------------------------
FINALCODE SECURITY REPORT
--------------------------------------------------
Authentication:        clean
Authorization:          clean
Session Management:     clean
Input Validation:       clean
Secrets:                clean
Dependencies:            clean
API Security:            clean
Frontend Security:       clean
Backend Security:        clean
Deployment Security:     clean
Cloud Configuration:     clean
Rate Limiting:           clean
Security Headers:        clean
Environment Config:      clean
Overall Security Rating: A+

--------------------------------------------------
REPOSITORY EVOLUTION
-------------------------------------------------
Health Score Progression:  94 (first execution — baseline established this run)
Findings Fixed:            0 (first execution)
New Findings Introduced:   1 (Engineering Recommendation, non-blocking)
Remaining Findings:        1
Overall Engineering Improvement:  N/A (first execution)

-------------------------------------------------
BASELINE ANALYSIS
-------------------------------------------------
No baseline configured (.finalcode/baseline.json not present)

-------------------------------------------------
DECISION ANALYSIS — HUMAN DECISIONS REQUIRED
-------------------------------------------------
(none — no non-automatable findings this run)

-------------------------------------------------
ENGINEERING ROADMAP
-------------------------------------------------
Immediate / Short Term / Medium Term / Long Term:  (none)

-------------------------------------------------
RELEASE READINESS PREDICTOR
-------------------------------------------------
Current Certification:     READY TO SHIP
Probability of READY TO SHIP:  100% (all mandatory gates pass, clean security, 100% coverage)
Remaining Engineering Work:     none
Estimated Completion Effort:    None (already READY TO SHIP)

-------------------------------------------------
EXECUTIVE DECISION SUMMARY
-------------------------------------------------
Automatic Fixes Completed:  0 (Certify Mode does not apply fixes)
Human Decisions Required:   0
Blocking Decisions:         none
Recommended Next Action:    Ship — repository is READY TO SHIP
Estimated Engineering Effort Remaining:  None

-------------------------------------------------
HUMAN OVERRIDE AWARENESS
-------------------------------------------------
Accepted Recommendations:   none
Deferred Recommendations:   none
Re-Raised (condition changed):  none

-------------------------------------------------
PULL REQUEST ANALYSIS
-------------------------------------------------
No Git / target branch information — PR analysis skipped

-------------------------------------------------
AUDIT STATISTICS
--------------------------------------------------
Files Reviewed:        142
Files Modified:         0
Quality Gates Passed:    13 / 13
Quality Gates Failed:    0 / 13
Issues Found:            1 (Engineering Recommendation — non-blocking)
Issues Fixed:            0 (Certify Mode does not apply fixes)
Issues Remaining:        1
Security Findings:       0
Repository Coverage:     100%

-------------------------------------------------
CONFIDENCE BREAKDOWN
-------------------------------------------------
Architecture:         99%
Code Quality:         99%
Security:             100%
Testing:              98%
Type Safety:          99%
Accessibility:        99%
UI Consistency:       99%
Repository Coverage:  100%
Verification:         99%
Final Confidence:     99%

-------------------------------------------------
RELIABILITY STATEMENT
-------------------------------------------------
Verified:
  Static Analysis, Repository Structure, Architecture, Type Checking,
  Build Verification, Documentation, Dead Code Analysis, UI Review, Security Inspection
Not Performed:
  Runtime Load Testing, Penetration Testing, Cross-browser Testing, Real-user Testing,
  Production Deployment Validation

-------------------------------------------------
ENGINEERING METRICS
-------------------------------------------------
Cyclomatic Complexity:     4.2 (average)
Average Function Length:   28 lines
Average File Length:       142 lines
Largest File:              app/dashboard.tsx (612 lines)
Largest Function:          useReportData() (94 lines)
Duplicate Code:            1.4%
Type Coverage:             98%
Documentation Coverage:    91%
Lint Status:               Pass
Test Coverage:             86%
Build Success:             Pass
Type Check:                Pass

-------------------------------------------------
REPOSITORY HEALTH SCORE
-------------------------------------------------
Health Score:              94 / 100 (Excellent)

Category Breakdown:
  Security: 97  Architecture: 95  Maintainability: 93  Performance: 90
  Documentation: 91  Accessibility: 96  Testing: 92  Type Safety: 98
  GitHub Readiness: 95  Dead Code: 99

-------------------------------------------------
EXECUTIVE SUMMARY
-------------------------------------------------
Repository Status:    Production Ready
Health Score:         94 / 100 (Excellent)
Strengths:
  1. Comprehensive test coverage (86%)
  2. Strong type safety (98% type coverage)
  3. Clean security posture (A+)
  4. Consistent UI
  5. Clear architecture
Weaknesses:
  1. CHANGELOG missing latest release entry (non-blocking)
Most Critical Remaining Risk: None
Recommended Next Action:      Ship — READY TO SHIP
Estimated Effort:             None
Risk Assessment:              Low
Release Recommendation:       Go

-------------------------------------------------
TREND SNAPSHOT
-------------------------------------------------
<appended to .finalcode/TREND.md — not duplicated in report>

-------------------------------------------------
BASELINE COMPARISON
-------------------------------------------------
<baseline established this run; no prior baseline to compare>

-------------------------------------------------
CERTIFICATION
-------------------------------------------------
Overall Confidence:   99% (13/13 gates passed, 100% coverage, clean security)
Certification Status: READY TO SHIP
Exit Code:            0

Machine-Readable Reports: this run also emitted
  .finalcode/reports/<timestamp>-certify.json
  .finalcode/reports/<timestamp>-certify.sarif
==================================================
```

---

## Test Case 2: Repository With Multiple Issues (Inspect Mode → NOT READY)

**Prompt:** "Audit this repo before we merge to main." (run on branch `feature/settings-page`)

**Expected behavior:** Full findings with the complete Finding Format, grouped by gate. Demonstrates Smart Finding Classification, Deployment Intelligence, Decision Analysis. The v1.8.0 sections show: a selected profile (`web-application`), a configured baseline (Baseline/New/Resolved/Regression findings), a `.finalcodeignore` (build/ dist/ ignored and shown in coverage), an Incremental→Full escalation note, a PR analysis (branch vs `main`), active plugins (e.g. `react`), and machine-readable output. At least one mandatory gate FAILs, so verdict is NOT READY, exit code 2.

**Example output (excerpt):**

```
AUDIT METADATA
--------------------------------------------------
Specification Version:  1.8.0 (OpenCode Edition)
Repository Version:     feature/settings-page
Git Commit:             9f3e21a
Mode:                    Inspect
Profile:                 web-application
Inspection Type:         Full (escalated from Incremental — issues found outside changed set)
Configuration Source:    finalcode.config.json

REPOSITORY METADATA
--------------------------------------------------
Framework:           React 18 + Vite
Active Plugins:      react (detected via package.json)

REPOSITORY COVERAGE
--------------------------------------------------
Files Scanned:            238
Files Ignored:            1,852 (node_modules, dist/ generated; build/ matched .finalcodeignore)
Files Skipped:             2 (binary test fixtures)
...
Coverage Percentage:        99%

QUALITY GATE SUMMARY
--------------------------------------------------
Architecture         PASS
Code Quality         FAIL
Dead Code            FAIL
Dependencies         PASS
Type Safety          FAIL
Error Handling       FAIL
Performance          PASS
Security             FAIL
Accessibility        FAIL
UI Consistency       PASS
Documentation        FAIL
GitHub Readiness     PASS

ENGINEERING POLICY
-------------------------------------------------
Profile:                 web-application
Enabled Rules:           all 13 gates; react plugin gate (react-best-practices); policy: any forbidden, Security Gate mandatory
Disabled Rules:          none
Configuration Source:    finalcode.config.json
Policy Version:          policy-1
Health Score Target:     90

FINDINGS
--------------------------------------------------
[Security Gate]
- Classification: Security Vulnerability
- Severity: Critical
- Category: Hardcoded secret
... (full Finding Format as in v1.7.0 example) ...
- Decision Analysis:
    Why a Human Decision Is Required: Key rotation is a business/security action.
    Available Options: (A) Rotate now; (B) During maintenance window; (C) Accept risk.
    Final Recommendation: Option A — rotate immediately, then re-run Certify.

[Type Safety Gate — Smart Finding Classification]
- Category: Unsafe `any` on API boundary (38 occurrences)
- Smart Finding Classification:
    Safe (collapsed): 29 occurrences (FC-TYPE-001 ×29 safe) — not expanded.
    Needs Review: 7 occurrences (FC-TYPE-002 ×7).
    Unsafe (expanded): 2 occurrences — FC-TYPE-003 (public fetchUser() boundary).

[Performance Gate — Deployment Intelligence]
- Category: In-memory cache not suitable for multi-instance deployment
... (full Finding Format) ...
- Deployment Intelligence:
    Suitable Environments: single-instance, local/dev
    Unsupported Environments: multi-instance / load-balanced, serverless, edge
    Production Risks: cache incoherence under scale
    Recommended Alternatives: Redis, Cloudflare KV

(... remaining gate findings omitted for brevity; every failing gate lists its confirmed findings ...)

FINALCODE SECURITY REPORT
--------------------------------------------------
... (14 categories; Secrets: 1 Critical) ...
Overall Security Rating: D

REPOSITORY EVOLUTION
-------------------------------------------------
Health Score Progression:  71 → 64 (regressing)
Findings Fixed:            3 (vs prior run)
New Findings Introduced:   2
Remaining Findings:        9 (was 8 prior run)
Overall Engineering Improvement:  Regressing

BASELINE ANALYSIS
-------------------------------------------------
Baseline Findings:        FC-A11Y-002 (known, accepted), FC-DOC-001 (known)
New Findings:             FC-SEC-001 (hardcoded key), FC-PERF-001 (cache)
Resolved Findings:        FC-DEAD-002 (removed in this branch)
Regression Findings:      FC-TYPE-003 (was Needs Review, now Unsafe)
Severity Changes:         FC-TYPE-003 Medium → High

DECISION ANALYSIS — HUMAN DECISIONS REQUIRED
-------------------------------------------------
FC-SEC-001: Rotate exposed Stripe key (business/security action) — recommended Option A.

ENGINEERING ROADMAP
-------------------------------------------------
Immediate:   FC-SEC-001 (blocks READY TO SHIP)
Short Term:  FC-TYPE-003, FC-PERF-001, FC-DEAD-001, FC-A11Y-001
Medium Term: FC-DOC-001, FC-TYPE-002
Long Term:   harden type policy across boundaries

RELEASE READINESS PREDICTOR
-------------------------------------------------
Current Certification:     NOT READY
Probability of READY TO SHIP:  Low (~20%) — one Critical security finding blocks
Remaining Engineering Work:    9 findings + 2 new
Estimated Completion Effort:   Medium

EXECUTIVE DECISION SUMMARY
-------------------------------------------------
Automatic Fixes Completed:  0 (Inspect Mode)
Human Decisions Required:   1 (FC-SEC-001)
Blocking Decisions:         FC-SEC-001
Recommended Next Action:    Rotate the Stripe key, then run Repair Mode
Estimated Engineering Effort Remaining:  Medium

HUMAN OVERRIDE AWARENESS
-------------------------------------------------
Accepted Recommendations:   none
Deferred Recommendations:   FC-A11Y-002 (accepted as known issue in baseline)
Re-Raised (condition changed):  FC-TYPE-003 (severity increased — now warrants attention)

PULL REQUEST ANALYSIS
-------------------------------------------------
Target Branch:           main
Files Changed:           14 (src/api/users.ts, src/lib/cache.ts, src/pages/Settings.tsx, ...)
New Findings:            FC-SEC-001, FC-PERF-001, FC-TYPE-003 (Unsafe)
Resolved Findings:       FC-DEAD-002
Regression Summary:      FC-TYPE-003 severity Medium → High
Risk Level:              High
Estimated Review Time:   ≈ 35 min

AUDIT STATISTICS
--------------------------------------------------
Files Reviewed:        238
Quality Gates Passed:    6 / 13
Quality Gates Failed:    7 / 13
Issues Found:            9
Security Findings:       1
Repository Coverage:     99%

... (Confidence Breakdown, Reliability Statement, Engineering Metrics, Health Score, Executive Summary as in v1.7.0 example) ...

CERTIFICATION
-------------------------------------------------
Overall Confidence:   90%
Certification Status: NOT READY
Exit Code:            2

Machine-Readable Reports: this run also emitted
  .finalcode/reports/<timestamp>-inspect.json
  .finalcode/reports/<timestamp>-inspect.sarif
==================================================
```

---

## Test Case 3: Missing Repository (Any Mode → NO PROJECT FOUND)

**Prompt:** "Run FinalCode on this project" (pointed at an empty directory).

**Expected behavior:** Phase 0 fails to locate a repository. Skip all inspection sections. The v1.8.0 metadata fields that depend on a repo (Profile, Inspection Type, Configuration Source, Active Plugins) are marked N/A. Return NO PROJECT FOUND / exit code 3.

**Example output:**

```
AUDIT METADATA
--------------------------------------------------
Specification Version:  1.8.0 (OpenCode Edition)
Mode:                    Inspect
Profile:                 N/A
Inspection Type:         N/A
Configuration Source:    N/A

REPOSITORY METADATA
--------------------------------------------------
Project Root:       N/A — no repository detected at the given path
... (all N/A) ...

REPOSITORY COVERAGE / QUALITY GATE SUMMARY / FINDINGS / SECURITY REPORT
--------------------------------------------------
(skipped — no repository to audit)

CERTIFICATION
-------------------------------------------------
Overall Confidence:   N/A
Certification Status: NO PROJECT FOUND
Exit Code:            3
==================================================
```

---

## Repair Mode Execution Plan (excerpt)

When Repair Mode runs on the Test Case 2 repository, it loads `finalcode.config.json` (profile `web-application`), activates the `react` plugin, reads `.finalcode/baseline.json`, and applies `.finalcodeignore`. The Repair Plan is emitted in priority order; non-automatable findings (FC-SEC-001) carry a Decision Analysis and are excluded from automatic repair. For each automatable item, Repair Mode runs the Automatic Verification Pipeline and emits `.json`/`.sarif` reports. When only FC-SEC-001 remains, it issues an Intelligent Repair Stop.

```
FINALCODE REPAIR PLAN
-------------------------------------------------
0. Config: profile=web-application, source=finalcode.config.json, plugins=[react], baseline loaded
1. [Critical Security] Hardcoded Stripe secret — src/lib/payments.ts:14
   → Decision Analysis (FC-SEC-001): requires human key rotation; not auto-repairable
2. [High]               Unsafe `any` on API boundary — src/api/users.ts:22
3. [Dead Code]          Unused LegacySidebar — src/components/LegacySidebar.tsx
4. [Accessibility]      Missing form labels — src/pages/Settings.tsx:44-61
5. [Performance]        In-memory cache — src/lib/cache.ts:8 → Deployment Intelligence (Redis)
6. [Documentation]      Missing setup instructions — README.md
-------------------------------------------------
```
