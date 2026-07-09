# FinalCode Report Engine

The Report Engine is responsible for producing the standardized FinalCode Certification Report. It ensures consistent ordering, consistent wording, deterministic output, and no duplicated formatting logic.

## Report Section Responsibilities

Every report section has a documented responsibility. The Report Engine orchestrates section generation in a fixed order.

### Section Registry

| # | Section | Responsibility | Data Source |
|---|---------|---------------|-------------|
| 1 | Executive Dashboard | Compact status view with Grade Justification | Health Score, Grade, Certification |
| 2 | Audit Metadata | Execution context (version, mode, profile, config) | Pipeline context |
| 3 | Repository Metadata | Project structure (framework, language, build) | Phase 0 Discovery |
| 4 | Repository Coverage | What was inspected and what was not | Coverage analysis |
| 5 | Warning Analysis | Lint/diagnostics breakdown with top 5 | Lint output |
| 6 | Release Blocker Summary | Blocking vs non-blocking classification | Release Blocker Engine |
| 7 | Risk Matrix | Severity counts with blocking split | Findings |
| 8 | Quality Gate Summary | 13 gate statuses | Gate execution |
| 9 | Engineering Policy | Profile, enabled/disabled rules, config | Configuration |
| 10 | Findings | Grouped by Quality Gate with full details | Decision Engine |
| 11 | Security Report | 14-category security summary | Security Gate 2.0 |
| 12 | Fixes Applied | Repair Mode only: what changed and verification | Repair pipeline |
| 13 | Refactors Applied | Refactor Mode only: what was refactored | Refactor pipeline |
| 14 | Intelligent Repair Stop | Repair Mode only: why automation stopped | Repair pipeline |
| 15 | Audit Statistics | Counts of files, gates, issues | Aggregation |
| 16 | Confidence Model 2.0 | Analysis/Evidence/Verification/Runtime/Repository | Confidence calculation |
| 17 | Certification Confidence Model | Static/Testing/Runtime/Docs/Deployment + Overall | Confidence calculation |
| 18 | Runtime Capability Disclosure | Verified/Executed/Not Executed/Assumed | Capability tracking |
| 19 | Engineering Metrics | Complexity, coverage, duplication | Static analysis |
| 20 | Repository Health Score | Weighted formula with explanation | Health Score engine |
| 21 | Repository Quality Grade | Letter grade with justification | Health Score |
| 22 | Executive Summary | 30-second manager view | Aggregation |
| 23 | Repository Evolution | Health progression vs prior runs | Trend analysis |
| 24 | Improvement Delta | Resolved/New/Regressed/Unchanged | Baseline comparison |
| 25 | Baseline Analysis | Known-issue comparison | baseline.json |
| 26 | Decision Analysis | Human decisions required | Decision Engine |
| 27 | Engineering Roadmap | Immediate/Short/Medium/Long term | Findings + priority |
| 28 | Release Readiness Predictor | Probability of READY TO SHIP | Certification + trends |
| 29 | Executive Decision Summary | Fixes, decisions, blockers, next action | Aggregation |
| 30 | Engineering Priority Matrix | Priority/Business Impact/Effort/Risk/Sprint | Findings + priority |
| 31 | Release Decision Summary | Decision, reason, what remains, estimated work | Release Engine |
| 32 | Human Override Awareness | Accepted/deferred recommendations | OVERRIDES.md |
| 33 | Pull Request Analysis | Branch vs target diff | Git diff |
| 34 | Execution Metrics | Time, scope, rules, tool calls | Pipeline instrumentation |
| 35 | Trend Summary | Health delta vs baseline | Trend analysis |
| 36 | Certification Checklist | Build/Type/Lint/Test/Security/CI status | Gate execution |
| 37 | Certification | Final verdict with Overall Reliability | Certification logic |

## Report Generation Rules

### Ordering

Sections must appear in the fixed order listed above. This order is designed for progressive disclosure:

1. **Dashboard first** — readers see status immediately
2. **Context second** — metadata and coverage set the stage
3. **Findings third** — the core content
4. **Analysis fourth** — health, grade, confidence, trends
5. **Decision support fifth** — roadmap, priority, release decision
6. **Certification last** — the final verdict

### Wording Consistency

- Use the exact terminology from this document
- Never use synonyms (e.g., never use "score" when "Health Score" is the term)
- Never abbreviate terms without definition
- Use consistent tense (present for findings, past for resolved items)

### Deterministic Output

Given the same input, the Report Engine must produce identical output:

- Same section order
- Same wording
- Same formatting
- Same data presentation

**Rule:** The Report Engine is a pure function of its inputs. No randomness, no time-dependent behavior.

### No Duplicated Formatting

Every section uses the same formatting primitives:

- `---` for section separators
- `| Field | Value |` for key-value data
- Code blocks for structured data
- Tables for comparisons

**Rule:** Never invent new formatting for a section. Reuse existing patterns.

## Section Details

### Executive Dashboard

**Responsibility:** Provide a compact, at-a-glance status view.

**Required Fields:**
- Overall Status (READY TO SHIP / READY WITH WARNINGS / NOT READY)
- Overall Risk (Low / Medium / High)
- Health Score (XX / 100 (Class))
- Engineering Grade (A+ … F)
- Grade Justification (why this grade was assigned)
- Production Readiness (XX%)
- Security Rating (A+ … F)
- Maintainability Rating (A+ … F)
- Testing Status (Pass / Fail / Not Measured)
- Estimated Remaining Effort (Small / Medium / Large)

### Findings

**Responsibility:** Present every finding with complete details.

**Required Fields per Finding:**
- FinalCode ID
- Classification
- Severity
- Status
- Category
- Release Blocker Classification
- Engineering Category
- Estimated Effort
- Engineering Cost
- Risk if Ignored
- Confidence
- Evidence
- Affected Files
- Root Cause
- Root Cause Classification
- Preventive Recommendation
- Impact
- Recommended Fix
- Verification Method
- Decision Analysis (if non-automatable)
- Smart Finding Classification (if high-frequency)
- Deployment Intelligence (if infrastructure)
- Explainability Block (see `explainability.md`)

### Repository Health Score

**Responsibility:** Present the Health Score with full explanation.

**Required Elements:**
- Weighted Formula (Category / Weight / Score / Contribution)
- Category Breakdown
- Major Contributors
- Largest Deductions
- How to Gain the Next 5 Points

### Certification

**Responsibility:** Present the final certification decision.

**Required Elements:**
- Overall Reliability (from Certification Confidence Model)
- Certification Status (READY TO SHIP / READY WITH WARNINGS / NOT READY / NO PROJECT FOUND)
- Exit Code (0 / 1 / 2 / 3)
- Traceability (generated from gates, blockers, findings)

## Report Template

The complete report template is defined in the SKILL.md file. The Report Engine implements this template exactly. No sections may be added, removed, or reordered without updating both the template and this document.
