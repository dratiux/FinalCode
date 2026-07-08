# FinalCode — Example Outputs & Test Cases

Three worked examples covering the required test scenarios: a clean repository, a repository with multiple issues, and a missing repository. A fourth short excerpt shows the Repair Mode execution plan. Use these as the formatting template — same section order, same level of evidence detail, same exit code convention as SKILL.md.

---

## Test Case 1: Clean Repository (Certify Mode → READY TO SHIP)

**Prompt:** "Run FinalCode in Certify Mode on this repo, it's about to ship."

**Expected behavior:** Phase 0/1 discovery runs fully, all 12 gates are checked, no Confirmed Defects or Security Vulnerabilities exist, so the report certifies READY TO SHIP with exit code 0. Repository Coverage is complete, Confidence is derived from full coverage + all gates passing + a clean Security Summary.

**Example output:**

```
==================================================
FINALCODE CERTIFICATION REPORT
==================================================

AUDIT METADATA
--------------------------------------------------
FinalCode Version:   1.3 (OpenCode Edition)
Audit Version:       1
Repository Name:     acme-checkout-service
Current Branch:      main
Commit Hash:         a1b2c3d
Audit Date:          2026-07-08
Mode:                Certify

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
Files Ignored:             1,204 (node_modules, .next build output — generated/vendored)
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

No Confirmed Defects or Security Vulnerabilities across any of the 12 gates.

--------------------------------------------------
FINALCODE SECURITY REPORT
--------------------------------------------------
Authentication:        clean
Authorization:          clean
Input Validation:       clean
Secrets:                clean
Dependencies:            clean
API Security:            clean
Frontend Security:       clean
Backend Security:        clean
Deployment Security:     clean
Overall Security Rating: A+

--------------------------------------------------
AUDIT STATISTICS
--------------------------------------------------
Files Reviewed:        142
Files Modified:         0
Quality Gates Passed:    12 / 12
Quality Gates Failed:    0 / 12
Issues Found:            1 (Engineering Recommendation — non-blocking)
Issues Fixed:            0 (Certify Mode does not apply fixes)
Issues Remaining:        1
Security Findings:       0
Repository Coverage:     100%
Overall Confidence:      97%

--------------------------------------------------
CERTIFICATION
--------------------------------------------------
Overall Confidence:   97% (12/12 gates passed, 100% coverage, clean security review; 3-point deduction for one open recommendation)
Certification Status: READY TO SHIP
Exit Code:            0
==================================================
```

---

## Test Case 2: Repository With Multiple Issues (Inspect Mode → NOT READY)

**Prompt:** "Audit this repo before we merge to main."

**Expected behavior:** Full findings with the complete Finding Format (Classification, Severity, Category, Confidence, Evidence, Affected Files, Root Cause, Impact, Recommended Fix, Verification Method, Status) for each issue, grouped by gate, plus the UI Evidence format for any UI Consistency finding and the extra Attack Vector / CVE Category fields for Security Vulnerabilities. At least one mandatory gate FAILs due to a Confirmed Defect or Security Vulnerability, so the verdict is NOT READY with exit code 2. No code is changed since this is Inspect Mode, so Files Modified / Issues Fixed are 0.

**Example output (excerpt):**

```
==================================================
FINALCODE CERTIFICATION REPORT
==================================================

AUDIT METADATA
--------------------------------------------------
FinalCode Version:   1.3 (OpenCode Edition)
Audit Version:       1
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
- Potential Impact / Impact: Key is exposed in git history and to anyone with repo access; could be used for unauthorized charges or data access
- Recommended Fix / Mitigation: Move to environment variable, rotate the exposed key, add the file pattern to secret-scanning config
- Verification Method: grep for the literal key returns zero matches after fix; secret-scanning CI check passes
- Status: Confirmed

[Type Safety Gate]
- Classification: Confirmed Defect
- Severity: High
- Category: Unsafe `any` on API boundary
- Confidence: 95%
- Evidence: fetchUser() return type is typed `any`, consumed directly in 6 components without validation
- Affected Files: src/api/users.ts:22
- Root Cause: Response typing was skipped when the endpoint was first added
- Impact: Silent runtime errors if the API shape changes; no compile-time safety for consumers
- Recommended Fix: Define a `User` interface matching the API contract and type the fetch return
- Verification Method: `tsc --noEmit` passes with `any` removed from this path
- Status: Confirmed

[Dead Code Gate]
- Classification: Confirmed Defect
- Severity: Medium
- Category: Unused component
- Confidence: 92%
- Evidence: `LegacySidebar.tsx` has no imports anywhere in the codebase (verified via project-wide search)
- Affected Files: src/components/LegacySidebar.tsx
- Root Cause: Left over from a sidebar redesign; replaced by `Sidebar.tsx`
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
Input Validation:       clean
Secrets:                1 finding (Critical — hardcoded Stripe key)
Dependencies:            clean
API Security:            clean
Frontend Security:       clean
Backend Security:        clean
Deployment Security:     clean
Overall Security Rating: D (capped due to one unresolved Critical vulnerability)

--------------------------------------------------
AUDIT STATISTICS
--------------------------------------------------
Files Reviewed:        238
Files Modified:         0
Quality Gates Passed:    6 / 12
Quality Gates Failed:    6 / 12
Issues Found:            9 (1 Critical Security, 1 High, 2 Medium, 1 Low shown above; remainder in omitted gates)
Issues Fixed:            0 (Inspect Mode does not apply fixes)
Issues Remaining:        9
Security Findings:       1
Repository Coverage:     99%
Overall Confidence:      93%

--------------------------------------------------
CERTIFICATION
--------------------------------------------------
Overall Confidence:   93% (6/12 gates passed, 99% coverage, one unresolved Critical security finding drives most of the deduction)
Certification Status: NOT READY
Exit Code:            2
==================================================
```

---

## Test Case 3: Missing Repository (Any Mode → NO PROJECT FOUND)

**Prompt:** "Run FinalCode on this project" (pointed at an empty directory, or no repository context at all).

**Expected behavior:** Phase 0 fails to locate a repository. Skip Phase 1, Repository Coverage, all Quality Gates, Security Summary, and Audit Statistics entirely — there's nothing to measure. Return the report shell with metadata marked unavailable and the certification section set to NO PROJECT FOUND / exit code 3.

**Example output:**

```
==================================================
FINALCODE CERTIFICATION REPORT
==================================================

AUDIT METADATA
--------------------------------------------------
FinalCode Version:   1.3 (OpenCode Edition)
Audit Version:       1
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
AUDIT STATISTICS
--------------------------------------------------
(skipped — no repository to audit)

--------------------------------------------------
CERTIFICATION
--------------------------------------------------
Overall Confidence:   N/A
Certification Status: NO PROJECT FOUND
Exit Code:            3
==================================================
```

---

## Repair Mode Execution Plan (excerpt)

When Repair Mode is invoked on the Test Case 2 repository above, before touching any code it first emits an execution plan ordered per the **Repair Order** rule:

```
FINALCODE REPAIR PLAN
--------------------------------------------------
1. [Critical Security] Hardcoded Stripe secret — src/lib/payments.ts:14
2. [High]               Unsafe `any` on API boundary — src/api/users.ts:22
3. [Dead Code]           Unused LegacySidebar component — src/components/LegacySidebar.tsx
4. [Accessibility]       Missing form labels — src/pages/Settings.tsx:44-61
5. [Documentation]       Missing setup instructions — README.md
--------------------------------------------------
```

Fixes are then applied in this order, each followed by Fix Verification, Regression Protection, and a full gate restart before moving to the next item, per Repair Rules and the Repair Mode workflow in SKILL.md.
