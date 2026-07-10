# Certification Rules Reference

Detailed certification rules for FinalCode audits. These rules are mandatory during every audit, in every mode.

## Finding Status

Every finding must use exactly one status:

| Status | Meaning |
|---|---|
| Confirmed | Verified through execution, build, type-check, lint, runtime inspection, or objective repository evidence |
| Needs Verification | Evidence exists but FinalCode could not fully verify |
| Not Verified | Insufficient evidence |

## Finding Classification

Every finding must be classified into exactly one category:

| Classification | Meaning | Affects certification? |
|---|---|---|
| Confirmed Defect | Objective engineering issue supported by evidence | Yes |
| Security Vulnerability | Verified security weakness or insecure implementation | Yes |
| Engineering Recommendation | Improvement that increases maintainability or scalability (includes OpenCode convention deviations) | No |
| Architectural Suggestion | Alternative architectural approach | No |
| Style Recommendation | Cosmetic or stylistic suggestion | No |

Only **Confirmed Defect** and **Security Vulnerability** may fail a mandatory Quality Gate or block certification. Recommendations and Suggestions are reported for the user's benefit but must never fail a gate or block a verdict.

## Finding IDs

Every finding must have a stable, unique identifier. IDs follow the format `FC-<CATEGORY>-<NUMBER>`:

| Category | Prefix | Example |
|---|---|---|
| Security | SEC | FC-SEC-001 |
| Code Quality | CODE | FC-CODE-003 |
| Performance | PERF | FC-PERF-002 |
| Architecture | ARCH | FC-ARCH-001 |
| Refactor | REF | FC-REF-004 |
| Type Safety | TYPE | FC-TYPE-001 |
| Dead Code | DEAD | FC-DEAD-001 |
| Error Handling | ERR | FC-ERR-001 |
| Testing | TEST | FC-TEST-001 |
| Accessibility | A11Y | FC-A11Y-001 |
| UI Consistency | UI | FC-UI-001 |
| Documentation | DOC | FC-DOC-001 |
| Dependencies | DEP | FC-DEP-001 |
| GitHub Readiness | GH | FC-GH-001 |

IDs must remain stable across re-runs. Never renumber previous IDs. When a finding is fixed, its ID is recorded in `CHANGE_REPORT.md` with the resolution details.

## Severity Calibration

Severity must reflect actual engineering impact. Never assume Engineering Recommendations are Low.

| Severity | Meaning |
|---|---|
| Critical | Immediate security risk, data loss, or complete functionality failure |
| High | Significant defect or security weakness requiring prompt attention |
| Medium | Moderate impact on maintainability, correctness, or security |
| Low | Minor issue with limited impact |
| Informational | Noteworthy observation that does not constitute a defect |

Every severity must include justification explaining why that level was chosen based on actual engineering impact.

## Evidence-Based Findings

Every reported issue must be supported by objective evidence — file paths, line numbers, build output, type-check results, lint results, dependency analysis, accessibility inspection, runtime observations, static analysis, or UI inspection. Never report speculative findings. If sufficient evidence is unavailable, classify the finding as **Needs Verification** rather than a confirmed defect.

## Fix Verification

Never assume a fix is correct. Every applied fix (Repair Mode only) must be verified before being marked resolved, via one or more of: code inspection, successful build, successful type-check, successful lint, regression review, dependency validation, or UI consistency verification. If verification cannot be completed, clearly state that limitation in the report rather than marking the fix as confirmed.

## Release Blocking Policy

- **Critical** issues always block release.
- **High** severity issues block release unless explicitly justified — a justification must be recorded in the report (who/what accepted the risk and why) before a High finding can be treated as non-blocking.
- **Medium** severity issues may allow READY WITH WARNINGS.
- **Low** severity issues never block certification.
- **Informational** observations never block certification.
- **Engineering Recommendations, Architectural Suggestions, and Style Recommendations never block certification**, regardless of severity language used to describe them.
- Only certify READY TO SHIP when every mandatory Quality Gate has passed.

## Confidence Model 2.0

FinalCode v1.8.1 replaces the single confidence number (and the older per-category breakdown) with a six-metric model where every metric states **why** it has that value. See the **Report Quality & Decision Support (v1.8.1)** section for the full definitions. The model is:

| Metric | Meaning |
|---|---|
| Analysis Confidence | Confidence in the analytical correctness of findings |
| Evidence Coverage | Share of findings backed by concrete evidence |
| Verification Coverage | Share of fixes/claims actually verified |
| Runtime Coverage | Share of runtime behavior actually observed |
| Repository Coverage | Share of the repo actually inspected |
| Overall Reliability | Weighted synthesis — the certification confidence basis |

The certification references **Overall Reliability**, never a single arbitrary confidence number. Confidence must always be derived from measurable evidence — never generated arbitrarily.

## Repository Coverage

Every report must state what was actually inspected: files scanned, files ignored (and why — e.g. generated code, vendored deps, binaries), files skipped (and the specific reason), directories scanned, languages detected, configuration files reviewed, assets inspected, coverage percentage, and coverage limitations.

Coverage limitations must explicitly list what could not be inspected:

- Database unavailable
- Production environment unavailable
- External APIs unavailable
- Runtime behavior not executed

Clearly flag any portion of the repository that could not be inspected (e.g. inaccessible paths, binary files, submodules).

## Reliability Statement

Every report must clearly state what was verified and what was not performed. Use the following categories:

| Status | Meaning |
|---|---|
| Verified | Confirmed through execution, inspection, or objective evidence |
| Performed | Action was taken but results are not independently verifiable |
| Skipped | Not executed for this run |
| Not Verifiable | Cannot be verified with available tools or access |
| Unknown | Insufficient information to determine status |

**Verified:**
- Static Analysis
- Repository Structure
- Architecture
- Type Checking
- Build Verification
- Documentation
- Dead Code Analysis
- UI Review
- Security Inspection

**Not Performed:**
- Runtime Load Testing
- Penetration Testing
- Cross-browser Testing
- Real-user Testing
- Production Deployment Validation

The assistant must never claim verification unless it was actually performed.

## Certification Integrity

Every report must clearly state: FinalCode provides engineering certification based on repository inspection. It does not guarantee the absence of bugs, security vulnerabilities, runtime failures, or production incidents.

## Change Budget

Always prefer the smallest safe modification. When multiple valid fixes exist, choose the one with the smallest patch, the lowest regression risk, preserved architecture, and the highest readability. Avoid unnecessary refactoring — this reinforces the Non-Goals, OpenCode Integration, and Repair Rules above.

## Regression Protection

After every applied fix: review the surrounding code, review related modules, review dependent components, and verify no regressions were introduced — before moving to the next fix or re-running the gates.

## UI Evidence Requirements

Every UI Consistency Gate finding must use this structure instead of the generic Finding Format: **Component**, **Objective Observation**, **Expected Behavior**, **User Impact**, **Recommended Correction**. Never report subjective design opinions, and never fail certification because of subjective UI preferences — only measurable usability or consistency issues (e.g. inconsistent spacing values across the same component, a contrast ratio below WCAG AA, a missing focus state).

## Security Gate 2.0

The Security Gate's checklist is significantly expanded — covering authentication, authorization, session management, input validation, secrets management, dependency security, API security, frontend security, backend security, deployment security, cloud configuration, rate limiting, security headers, and environment configuration. See `references/security-gate.md` for the full checklist; every audit must apply it in full, not just the condensed summary in the Phase 2 table. Every discovered vulnerability must report: Severity, CVE category (if applicable), Affected Files, Attack Vector, Potential Impact, Recommended Mitigation, Verification Method. Every report must also include a FinalCode Security Report with a per-category rating and an overall Security Rating (A+ through F) — see the report format below.

## Security Evidence Rules

Never report a category as **clean** unless objective evidence exists to support that conclusion.

Differentiate between **Verified** and **Assumed** security status:

- If dependency scanners were not executed, state: "Dependency vulnerability scan not executed. Static repository inspection found no obvious vulnerable patterns."
- If runtime security testing was not performed, state it explicitly.
- Never claim a clean security posture without evidence.

## Root Cause Intelligence

Every finding must include a **Root Cause Classification** and a **Preventive Recommendation**. Never leave Root Cause blank.

**Root Cause Classification** (exactly one):

| Classification | Meaning |
|---|---|
| Human Error | Mistake in implementation or logic |
| Architecture | Structural design issue |
| Dependency | Issue caused by third-party package |
| Configuration | Incorrect or missing configuration |
| Framework | Issue inherent to or caused by the framework |
| External Library | Issue in an external library |
| Build System | Build pipeline or tooling issue |
| Security Misconfiguration | Insecure default or misconfigured setting |
| Technical Debt | Accumulated shortcuts or deferred improvements |
| Legacy Code | Outdated code that needs modernization |

**Preventive Recommendation:** explain how to prevent recurrence of this class of issue. Never leave blank — every finding must include actionable prevention guidance.

## Repair Quality Assessment

Every Repair Mode execution must calculate a **Repair Quality** score after completing all repairs.

**Possible Values:**

| Rating | Meaning |
|---|---|
| Excellent | All fixes verified, zero regressions, minimal files modified, high issue resolution rate, no new issues introduced, confidence maintained or improved |
| Good | Most fixes verified, zero or minor regressions, reasonable file modification count, good resolution rate |
| Fair | Some fixes unverified, minor regressions detected, or moderate new issues introduced |
| Poor | Multiple unverified fixes, regressions detected, or significant new issues introduced |

**Calculation Factors:**

| Factor | Weight |
|---|---|
| Verification Success Rate | High |
| Regression Count | High |
| Files Modified (relative to issues fixed) | Medium |
| Issues Resolved vs. Issues Remaining | Medium |
| New Issues Introduced | High |
| Confidence Change (delta) | Medium |

Always explain why the score was assigned, referencing the specific factors.

## Engineering Metrics

Every Inspect and Certify report must include an **Engineering Metrics** section. Measure what can be objectively measured; state "Not Measured" where measurement is not possible.

| Metric | Description |
|---|---|
| Cyclomatic Complexity | Average across codebase |
| Average Function Length | Lines per function |
| Average File Length | Lines per file |
| Largest File | File with most lines |
| Largest Function | Function with most lines |
| Duplicate Code Percentage | Percentage of duplicated code blocks |
| Type Coverage | Percentage of code with type annotations |
| Documentation Coverage | Percentage of public API with documentation |
| Lint Status | Pass / Fail / Not Configured |
| Test Coverage | Percentage of code covered by tests |
| Build Success | Pass / Fail |
| Type Check | Pass / Fail / Not Configured |

Where measurement cannot be performed, state **Not Measured**. Never fabricate values.

## Repository Health Score

Every report must include a **Repository Health Score** — a composite score from 0 to 100 measuring overall repository quality.

**Score Range:** 0–100

**Classification:**

| Range | Classification |
|---|---|
| 90–100 | Excellent |
| 75–89 | Good |
| 50–74 | Fair |
| 0–49 | Poor |

**Weighted Categories:**

| Category | Weight |
|---|---|
| Security | High |
| Architecture | High |
| Maintainability | High |
| Performance | Medium |
| Documentation | Medium |
| Accessibility | Medium |
| Testing | High |
| Type Safety | Medium |
| GitHub Readiness | Low |
| Dead Code | Low |

**Display:**

```
Health Score: 94 / 100 (Excellent)
```

Explain the calculation. This is independent from Confidence — Confidence measures audit certainty; Health Score measures repository quality.

## Historical Trend Analysis

Every execution appends a snapshot to `.finalcode/TREND.md`. This tracks repository quality over time.

**Tracked Fields per Snapshot:**

| Field | Description |
|---|---|
| Inspection Date | ISO date of execution |
| FinalCode Version | Version used |
| Repository Version | Tag or branch |
| Security Score | Security gate result (0–100) |
| Architecture Score | Architecture gate result (0–100) |
| Type Safety Score | Type safety gate result (0–100) |
| Performance Score | Performance gate result (0–100) |
| Documentation Score | Documentation gate result (0–100) |
| Accessibility Score | Accessibility gate result (0–100) |
| Issues Found | Total issues in this execution |
| Issues Fixed | Issues resolved in this execution |
| Issues Remaining | Unresolved issues |
| Certification | Verdict (READY TO SHIP / READY WITH WARNINGS / NOT READY) |
| Confidence | Overall confidence percentage |
| Health Score | Repository Health Score (0–100) |
| Technical Debt | Estimated debt level (High / Medium / Low / None) |

**Display Format:**

```
Security:     82  →  91  →  97
Issues:       34  →  17  →   2
Tech Debt:   High →  Med → Low
Health:       71  →  85  →  94
```

Never overwrite previous history. Always append.

## Baseline Analysis

The first time FinalCode executes on a repository, generate `.finalcode/BASELINE.md`. This stores the initial repository analysis. Future reports compare against this baseline.

**Baseline Fields:**

| Category | Baseline Value |
|---|---|
| Architecture | Score at first inspection |
| Security | Score at first inspection |
| Performance | Score at first inspection |
| Type Safety | Score at first inspection |
| Documentation | Score at first inspection |
| Accessibility | Score at first inspection |
| Testing | Score at first inspection |
| Maintainability | Score at first inspection |

**Comparison Display:**

```
Security:      +6   (82 → 88)
Architecture:  No Change
Testing:      +15   (45 → 60)
Dead Code:    -42%  (28 files → 16 files)
```

Only generate BASELINE.md once. Never overwrite it.
