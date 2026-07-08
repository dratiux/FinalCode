# FinalCode — Example Outputs & Test Cases

Three worked examples covering the required test scenarios: a clean repository, a repository with multiple issues, and a missing repository. A fourth short excerpt shows the Repair Mode execution plan. Use these as the formatting template — same section order, same level of evidence detail, same exit code convention as SKILL.md. All examples reflect FinalCode v1.7.0 (OpenCode Edition): 13 Quality Gates, Security Gate 2.0 (14 categories), and the Engineering Intelligence sections introduced in v1.7.0.

---

## Test Case 1: Clean Repository (Certify Mode → READY TO SHIP)

**Prompt:** "Run FinalCode in Certify Mode on this repo, it's about to ship."

**Expected behavior:** Phase 0/1 discovery runs fully, all 13 gates are checked, no Confirmed Defects or Security Vulnerabilities exist, so the report certifies READY TO SHIP with exit code 0. Repository Coverage is complete, Confidence is derived from full coverage + all gates passing + a clean Security Summary. The v1.7.0 intelligence sections appear with their first-run / no-action states.

**Example output:**

```
==================================================
FINALCODE CERTIFICATION REPORT
==================================================

AUDIT METADATA
--------------------------------------------------
Specification Version:  1.7.0 (OpenCode Edition)
Audit Engine Version:    <internal version>
Report Version:          1
Repository Version:      v2.3.0
Git Commit:              a1b2c3d
Audit Date:              2026-07-08
Mode:                    Certify

--------------------------------------------------
REPOSITORY METADATA
--------------------------------------------------
Project Root:       /repo
Framework:           Next.js 14 (App Router)
Language(s):        TypeScript
Build System:        Next.js / Turbopack
Package Manager:     pnpm
Entry Points:        app/layout.tsx, app/page.tsx

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

--------------------------------------------------
DECISION ANALYSIS — HUMAN DECISIONS REQUIRED
-------------------------------------------------
(none — no non-automatable findings this run)

-------------------------------------------------
ENGINEERING ROADMAP
-------------------------------------------------
Immediate:
  (none)
Short Term:
  (none)
Medium Term:
  (none)
Long Term:
  (none)

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
  Static Analysis
  Repository Structure
  Architecture
  Type Checking
  Build Verification
  Documentation
  Dead Code Analysis
  UI Review
  Security Inspection

Not Performed:
  Runtime Load Testing
  Penetration Testing
  Cross-browser Testing
  Real-user Testing
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
  Security:          97/100
  Architecture:      95/100
  Maintainability:   93/100
  Performance:       90/100
  Documentation:     91/100
  Accessibility:     96/100
  Testing:           92/100
  Type Safety:       98/100
  GitHub Readiness:  95/100
  Dead Code:         99/100

-------------------------------------------------
EXECUTIVE SUMMARY
-------------------------------------------------
Repository Status:    Production Ready
Health Score:         94 / 100 (Excellent)

Strengths:
  1. Comprehensive test coverage (86%) with critical paths covered
  2. Strong type safety (98% type coverage, no unsafe boundaries)
  3. Clean security posture across all 14 categories (A+)
  4. Consistent UI implementation
  5. Well-structured architecture with clear separation of concerns

Weaknesses:
  1. CHANGELOG missing the latest release entry (non-blocking)
  2. (none material)

Most Critical Remaining Risk: None — repository is production ready
Recommended Next Action:      Ship — repository is READY TO SHIP
Estimated Effort:             None
Expected Improvement:         N/A
Risk Assessment:              Low — all gates pass, clean security
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
FinalCode provides engineering certification based on repository inspection.
It does not guarantee the absence of bugs, security vulnerabilities,
runtime failures, or production incidents.

Overall Confidence:   99% (13/13 gates passed, 100% coverage, clean security review; 1-point deduction for one open recommendation)
Certification Status: READY TO SHIP
Exit Code:            0
==================================================
```

---

## Test Case 2: Repository With Multiple Issues (Inspect Mode → NOT READY)

**Prompt:** "Audit this repo before we merge to main."

**Expected behavior:** Full findings with the complete Finding Format (Classification, Severity, Category, Confidence, Evidence, Affected Files, Root Cause, Impact, Recommended Fix, Verification Method, Status) for each issue, grouped by gate, plus the UI Evidence format for any UI Consistency finding and the extra Attack Vector / CVE Category fields for Security Vulnerabilities. A high-frequency Type Safety finding demonstrates Smart Finding Classification (Safe / Needs Review / Unsafe). An infrastructure finding demonstrates Deployment Intelligence. A non-automatable finding demonstrates Decision Analysis. At least one mandatory gate FAILs due to a Confirmed Defect or Security Vulnerability, so the verdict is NOT READY with exit code 2. No code is changed since this is Inspect Mode, so Files Modified / Issues Fixed are 0. The v1.7.0 intelligence sections are populated from the findings.

**Example output (excerpt):**

```
==================================================
FINALCODE CERTIFICATION REPORT
==================================================

AUDIT METADATA
--------------------------------------------------
Specification Version:  1.7.0 (OpenCode Edition)
Audit Engine Version:    <internal version>
Report Version:          1
Repository Name:     acme-admin-dashboard
Current Branch:      feature/settings-page
Commit Hash:         9f3e21a
Audit Date:          2026-07-08
Mode:                Inspect

--------------------------------------------------
REPOSITORY METADATA
--------------------------------------------------
Project Root:       /repo
Framework:           React 18 + Vite
Language(s):        TypeScript, JavaScript
Build System:        Vite
Package Manager:     npm
Entry Points:        src/main.tsx

--------------------------------------------------
REPOSITORY COVERAGE
--------------------------------------------------
Files Scanned:            238
Files Ignored:             1,850 (node_modules — vendored), dist/ (generated)
Files Skipped:             2 (binary test fixtures — not source code)
Directories Scanned:       src/, public/, tests/
Languages Detected:        TypeScript, JavaScript, CSS
Configuration Reviewed:    package.json, tsconfig.json, vite.config.ts
Assets Inspected:          src/assets/ (8 files)
Uninspectable Portions:     none
Coverage Percentage:        99%

--------------------------------------------------
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

--------------------------------------------------
FINDINGS
--------------------------------------------------

[Security Gate]
- Classification: Security Vulnerability
- Severity: Critical
- Category: Hardcoded secret
- CVE Category: N/A (credential exposure, not a package CVE)
- Confidence: 99%
- Evidence: Stripe secret key committed as a literal string
- Affected Files: src/lib/payments.ts:14
- Attack Vector: Anyone with read access to the repo or its git history can extract and use the live key
- Root Cause: API key was hardcoded during initial integration instead of read from env
- Root Cause Classification: Human Error
- Preventive Recommendation: Add secret scanning to CI; enforce env-var config via a startup assertion
- Impact: Key is exposed in git history and to anyone with repo access; could be used for unauthorized charges or data access
- Recommended Fix / Mitigation: Move to environment variable, rotate the exposed key, add the file pattern to secret-scanning config
- Verification Method: grep for the literal key returns zero matches after fix; secret-scanning CI check passes
- Status: Confirmed
- Decision Analysis:
    Why a Human Decision Is Required: Key rotation is a business/security action outside FinalCode's scope and may cause brief payment interruption.
    Available Options: (A) Rotate now and deploy; (B) Rotate during next maintenance window; (C) Accept risk temporarily.
    Pros and Cons: A — fastest risk removal, brief disruption. B — no disruption, window of exposure. C — no effort, continued exposure.
    Estimated Engineering Effort: A — Small, B — Small, C — None.
    Risk Level: A — Low, B — Medium (exposure window), C — Critical (ongoing exposure).
    Certification Impact: Until rotated, Security Gate remains FAIL → NOT READY.
    Final Recommendation: Option A — rotate immediately, then re-run Certify.

[Type Safety Gate — Smart Finding Classification]
- Classification: Confirmed Defect
- Severity: High (Unsafe subset) / Medium (Needs Review subset)
- Category: Unsafe `any` on API boundary (high-frequency: 38 occurrences)
- Smart Finding Classification:
    Safe (collapsed): 29 occurrences — `any` on fully trusted internal DTOs with no external boundary (e.g. FC-TYPE-001 ×29 safe). Not expanded.
    Needs Review (expanded, compact): 7 occurrences — `any` on internal helpers with partial external input (FC-TYPE-002 ×7). Human glance recommended.
    Unsafe (expanded, full format): 2 occurrences — `any` on the public fetchUser() boundary consumed by 6 components (FC-TYPE-003).
- FC-TYPE-003 (Unsafe, full format):
    - Confidence: 95%
    - Evidence: fetchUser() return type is typed `any`, consumed directly in 6 components without validation
    - Affected Files: src/api/users.ts:22
    - Root Cause: Response typing was skipped when the endpoint was first added
    - Root Cause Classification: Technical Debt
    - Preventive Recommendation: Generate API types from the contract; forbid `any` on public boundaries via lint rule
    - Impact: Silent runtime errors if the API shape changes; no compile-time safety for consumers
    - Recommended Fix: Define a `User` interface matching the API contract and type the fetch return
    - Verification Method: `tsc --noEmit` passes with `any` removed from this path
    - Status: Confirmed

[Performance Gate — Deployment Intelligence]
- Classification: Confirmed Defect
- Severity: Medium
- Category: In-memory cache not suitable for multi-instance deployment
- Confidence: 90%
- Evidence: src/lib/cache.ts uses a module-level Map as the sole cache; works for a single process only
- Affected Files: src/lib/cache.ts:8
- Root Cause: Cache implemented before horizontal scaling was considered
- Root Cause Classification: Architecture
- Preventive Recommendation: Choose a deployment-aware cache from the start for any shared state
- Impact: Stale/missing cache entries and inconsistent behavior across instances behind a load balancer
- Recommended Fix: Replace with a shared store (Redis) or a CDN/edge cache appropriate to the environment
- Verification Method: Deploy to a 2-instance test environment; confirm consistent cache hits across instances
- Status: Confirmed
- Deployment Intelligence:
    Suitable Environments: Single-instance Node server, local/dev, low-traffic prototypes
    Unsupported Environments: Multi-instance / load-balanced deployments, serverless (cold-start resets), edge workers
    Production Risks: Cache incoherence under scale; potential data inconsistency and support tickets
    Recommended Alternatives: Redis (managed), Cloudflare KV, or an external key-value store with TTL

[Dead Code Gate]
- Classification: Confirmed Defect
- Severity: Medium
- Category: Unused component
- Confidence: 92%
- Evidence: `LegacySidebar.tsx` has no imports anywhere in the codebase (verified via project-wide search)
- Affected Files: src/components/LegacySidebar.tsx
- Root Cause: Left over from a sidebar redesign; replaced by `Sidebar.tsx`
- Root Cause Classification: Legacy Code
- Preventive Recommendation: Enable unused-export lint rule in CI
- Impact: Dead weight in bundle and maintenance surface
- Recommended Fix: Delete the file
- Verification Method: Build succeeds and bundle size decreases after removal
- Status: Confirmed

[Accessibility Gate]
- Classification: Confirmed Defect
- Severity: Medium
- Category: Missing form labels
- Confidence: 90%
- Evidence: Three `<input>` elements in the settings form have no associated `<label>` or `aria-label`
- Affected Files: src/pages/Settings.tsx:44-61
- Root Cause: Placeholder text used in place of labels
- Root Cause Classification: Human Error
- Preventive Recommendation: Lint for label association in form components
- Impact: Screen reader users cannot identify these fields
- Recommended Fix: Add `<label>` elements tied to each input via `htmlFor`/`id`
- Verification Method: Automated a11y check (e.g. axe) reports zero label violations on the page
- Status: Confirmed

[Documentation Gate]
- Classification: Confirmed Defect
- Severity: Low
- Category: Missing setup instructions
- Confidence: 88%
- Evidence: README has no "Getting Started" or environment variable setup section
- Affected Files: README.md
- Root Cause: Not written yet
- Root Cause Classification: Human Error
- Preventive Recommendation: Add a docs checklist to the release template
- Impact: New contributors can't set up the project without asking the team
- Recommended Fix: Add install + env var setup section
- Verification Method: A developer unfamiliar with the repo can run it locally using only the README
- Status: Needs Verification

(Code Quality and Error Handling gate findings omitted here for brevity, but a real report lists every confirmed finding for every failing gate. UI Consistency passed here, so no UI Evidence findings apply.)

--------------------------------------------------
FINALCODE SECURITY REPORT
--------------------------------------------------
Authentication:        clean
Authorization:          clean
Session Management:     clean
Input Validation:       clean
Secrets:                1 finding (Critical — hardcoded Stripe key)
Dependencies:            clean
API Security:            clean
Frontend Security:       clean
Backend Security:        clean
Deployment Security:     clean
Cloud Configuration:     clean
Rate Limiting:           clean
Security Headers:        clean
Environment Config:      clean
Overall Security Rating: D (capped due to one unresolved Critical vulnerability)

--------------------------------------------------
REPOSITORY EVOLUTION
-------------------------------------------------
Health Score Progression:  71 → 94 (current run baseline: 94? no — prior 71, current run 64)
  (Example: prior run Health Score 71; this run 64 — regressing due to new Critical)
Findings Fixed:            3 (vs prior run)
New Findings Introduced:   2 (the hardcoded secret and the cache issue were not present before)
Remaining Findings:        9 (was 8 prior run; net +1 after fixes and new introductions)
Overall Engineering Improvement:  Regressing (new Critical security finding outweighs fixes)

--------------------------------------------------
DECISION ANALYSIS — HUMAN DECISIONS REQUIRED
-------------------------------------------------
FC-SEC-001: Rotate the exposed Stripe key (business/security action required) — recommended Option A.
FC-TYPE-003: Define public API boundary types — automatable, but listed if deferred by user.

-------------------------------------------------
ENGINEERING ROADMAP
-------------------------------------------------
Immediate:
  - FC-SEC-001  Rotate exposed Stripe key (blocks READY TO SHIP)
  - FC-TYPE-003 Define User type on fetchUser() boundary (High)
Short Term:
  - FC-PERF-001 Replace in-memory cache with shared store (Medium)
  - FC-DEAD-001 Delete LegacySidebar.tsx (Medium)
  - FC-A11Y-001 Add form labels (Medium)
Medium Term:
  - FC-DOC-001 Add README setup instructions (Low)
  - FC-TYPE-002 Review 7 Needs-Review `any` usages (Medium)
Long Term:
  - Harden type policy across all public boundaries (strategic)

-------------------------------------------------
RELEASE READINESS PREDICTOR
-------------------------------------------------
Current Certification:     NOT READY
Probability of READY TO SHIP:  Low (~20%) — one Critical security finding blocks; several Medium items remain
Remaining Engineering Work:    9 findings (1 Immediate, 3 Short Term, 2 Medium Term, 1 Long Term) + 2 new
Estimated Completion Effort:   Medium (key rotation + type boundary + cache refactor dominate)

-------------------------------------------------
EXECUTIVE DECISION SUMMARY
-------------------------------------------------
Automatic Fixes Completed:  0 (Inspect Mode does not apply fixes)
Human Decisions Required:   1 (FC-SEC-001 key rotation)
Blocking Decisions:         FC-SEC-001 (must rotate to unblock Security Gate)
Recommended Next Action:    Rotate the Stripe key, then run Repair Mode for the remaining defects
Estimated Engineering Effort Remaining:  Medium

-------------------------------------------------
HUMAN OVERRIDE AWARENESS
-------------------------------------------------
Accepted Recommendations:   none
Deferred Recommendations:   none
Re-Raised (condition changed):  none

-------------------------------------------------
AUDIT STATISTICS
--------------------------------------------------
Files Reviewed:        238
Files Modified:         0
Quality Gates Passed:    6 / 13
Quality Gates Failed:    7 / 13
Issues Found:            9 (1 Critical Security, 1 High, 2 Medium shown above + Unsafe type subset; remainder in omitted gates)
Issues Fixed:            0 (Inspect Mode does not apply fixes)
Issues Remaining:        9
Security Findings:       1
Repository Coverage:     99%

-------------------------------------------------
CONFIDENCE BREAKDOWN
-------------------------------------------------
Architecture:         92%
Code Quality:          85%
Security:              88%
Testing:              90%
Type Safety:           80%
Accessibility:         90%
UI Consistency:        95%
Repository Coverage:   99%
Verification:          93%
Final Confidence:      90%

-------------------------------------------------
RELIABILITY STATEMENT
-------------------------------------------------
Verified:
  Static Analysis
  Repository Structure
  Architecture
  Type Checking
  Build Verification
  Documentation
  Dead Code Analysis
  UI Review
  Security Inspection

Not Performed:
  Runtime Load Testing
  Penetration Testing
  Cross-browser Testing
  Real-user Testing
  Production Deployment Validation

-------------------------------------------------
ENGINEERING METRICS
-------------------------------------------------
Cyclomatic Complexity:     7.1 (average)
Average Function Length:   41 lines
Average File Length:       188 lines
Largest File:              src/lib/cache.ts (420 lines)
Largest Function:          transformPayload() (120 lines)
Duplicate Code:            4.8%
Type Coverage:             71%
Documentation Coverage:    62%
Lint Status:               Fail
Test Coverage:             Not Measured
Build Success:             Pass
Type Check:                Fail

-------------------------------------------------
REPOSITORY HEALTH SCORE
-------------------------------------------------
Health Score:              64 / 100 (Fair)

Category Breakdown:
  Security:          55/100
  Architecture:      78/100
  Maintainability:   70/100
  Performance:       72/100
  Documentation:     68/100
  Accessibility:     82/100
  Testing:           70/100
  Type Safety:       65/100
  GitHub Readiness:  88/100
  Dead Code:         80/100

-------------------------------------------------
EXECUTIVE SUMMARY
-------------------------------------------------
Repository Status:    Not Ready
Health Score:         64 / 100 (Fair)

Strengths:
  1. Clear architecture and component structure
  2. Good accessibility outside the flagged form
  3. Build succeeds
  4. Consistent UI implementation
  5. Dead code mostly contained

Weaknesses:
  1. Critical hardcoded secret (blocks release)
  2. Unsafe `any` on public API boundary
  3. In-memory cache unsuitable for scale
  4. Missing README setup docs
  5. Low type coverage (71%)

Most Critical Remaining Risk: Exposed Stripe secret in git history (Critical, blocks READY TO SHIP)
Recommended Next Action:      Rotate the Stripe key, then run Repair Mode
Estimated Effort:             Medium
Expected Improvement:         READY WITH WARNINGS after key rotation + type boundary fix
Risk Assessment:              High until the secret is rotated
Release Recommendation:       No-Go

-------------------------------------------------
TREND SNAPSHOT
-------------------------------------------------
<appended to .finalcode/TREND.md — not duplicated in report>

-------------------------------------------------
BASELINE COMPARISON
-------------------------------------------------
<compared against .finalcode/BASELINE.md if it exists>

-------------------------------------------------
CERTIFICATION
-------------------------------------------------
Overall Confidence:   90% (6/13 gates passed, 99% coverage, one unresolved Critical security finding drives most of the deduction)
Certification Status: NOT READY
Exit Code:            2
==================================================
```

---

## Test Case 3: Missing Repository (Any Mode → NO PROJECT FOUND)

**Prompt:** "Run FinalCode on this project" (pointed at an empty directory, or no repository context at all).

**Expected behavior:** Phase 0 fails to locate a repository. Skip Phase 1, Repository Coverage, all Quality Gates, Security Summary, and Audit Statistics entirely — there's nothing to measure. Return the report shell with metadata marked unavailable and the certification section set to NO PROJECT FOUND / exit code 3. The v1.7.0 intelligence sections are omitted because there is no execution to analyze.

**Example output:**

```
==================================================
FINALCODE CERTIFICATION REPORT
==================================================

AUDIT METADATA
--------------------------------------------------
Specification Version:  1.7.0 (OpenCode Edition)
Audit Engine Version:    <internal version>
Report Version:          1
Repository Name:     (not found)
Current Branch:      N/A
Commit Hash:         N/A
Audit Date:          2026-07-08
Mode:                Inspect

--------------------------------------------------
REPOSITORY METADATA
--------------------------------------------------
Project Root:       N/A — no repository detected at the given path
Framework:           N/A
Language(s):        N/A
Build System:        N/A
Package Manager:     N/A
Entry Points:        N/A

--------------------------------------------------
REPOSITORY COVERAGE
--------------------------------------------------
(skipped — no repository to inspect)

--------------------------------------------------
QUALITY GATE SUMMARY
--------------------------------------------------
(skipped — no repository to audit)

--------------------------------------------------
FINDINGS
--------------------------------------------------
(skipped — no repository to audit)

--------------------------------------------------
FINALCODE SECURITY REPORT
--------------------------------------------------
(skipped — no repository to audit)

--------------------------------------------------
CERTIFICATION
-------------------------------------------------
Overall Confidence:   N/A
Certification Status: NO PROJECT FOUND
Exit Code:            3
==================================================
```

---

## Repair Mode Execution Plan (excerpt)

When Repair Mode is invoked on the Test Case 2 repository above, before touching any code it first emits an execution plan ordered per the **Repair Order** rule. Findings that cannot be safely automated carry a Decision Analysis and are excluded from automatic repair (they remain for the human and trigger an Intelligent Repair Stop when they are the only remaining items).

```
FINALCODE REPAIR PLAN
-------------------------------------------------
1. [Critical Security] Hardcoded Stripe secret — src/lib/payments.ts:14
   → Decision Analysis attached (FC-SEC-001): requires human key rotation; Repair Mode cannot automate the rotation itself
2. [High]               Unsafe `any` on API boundary — src/api/users.ts:22
3. [Dead Code]          Unused LegacySidebar component — src/components/LegacySidebar.tsx
4. [Accessibility]      Missing form labels — src/pages/Settings.tsx:44-61
5. [Performance]        In-memory cache — src/lib/cache.ts:8
   → Deployment Intelligence attached (FC-PERF-001): replaced with a shared store
6. [Documentation]      Missing setup instructions — README.md
-------------------------------------------------
```

For each automatable item, Repair Mode runs the **Automatic Verification Pipeline**: apply the fix, verify build / lint / tests, run a lightweight re-inspection of the affected gates (plus Security and Type Safety), and record the result. Fixes that fail verification are rolled back or substituted and recorded in FIXES APPLIED. When only FC-SEC-001 (the human-decision item) remains, Repair Mode issues an **Intelligent Repair Stop** explaining that no further automatic repair is possible and what the human must do (rotate the key, then re-run Certify).
