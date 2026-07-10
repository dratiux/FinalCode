# FinalCode Report Engine

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Defines the standardized 55-section report format and generation rules |
| Execution Stage | REPORT |
| Loaded By | Certification Engine |
| Dependencies | Decision Engine, Health Score Engine, Confidence Model |
| Outputs | FinalCode Certification Report (Markdown, JSON, SARIF) |
| Consumers | User, Certification Engine, CI/CD pipelines |
| Applies To | All audits |

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
| 8 | Quality Gate Summary | 13 gate statuses with reasons and evidence | Gate execution |
| 9 | Engineering Policy | Profile, enabled/disabled rules, config | Configuration |
| 10 | Findings | Grouped by Quality Gate with full details | Decision Engine |
| 11 | Security Report | 14-category security summary | Security Gate 2.0 |
| 12 | Fixes Applied | Repair Mode only: what changed and verification | Repair pipeline |
| 13 | Refactors Applied | Refactor Mode only: what was refactored | Refactor pipeline |
| 14 | Intelligent Repair Stop | Repair Mode only: why automation stopped | Repair pipeline |
| 15 | Audit Statistics | Counts of files, gates, issues | Aggregation |
| 16 | Evidence Summary (v2.2.0) | Audit evidence quality breakdown | Evidence analysis |
| 17 | Engineering Assumptions (v2.2.0) | All inferences documented | Inference tracking |
| 18 | Analysis Trace (v2.2.0) | What was analyzed and what was skipped | Pipeline execution |
| 19 | Report Completeness (v2.2.0) | Audit completeness metric | Coverage analysis |
| 20 | Confidence Model 2.0 | Analysis/Evidence/Verification/Runtime/Repository | Confidence calculation |
| 21 | Certification Confidence Model | Static/Testing/Runtime/Docs/Deployment + Overall | Confidence calculation |
| 22 | Runtime Capability Disclosure | Verified/Executed/Not Executed/Assumed | Capability tracking |
| 23 | Engineering Metrics | Complexity, coverage, duplication | Static analysis |
| 24 | Repository Health Score | Weighted formula with explanation | Health Score engine |
| 25 | Architecture Overview (v2.3.0) | System layers, modules, entry points, data flow | Architecture analysis |
| 26 | Module Health (v2.3.0) | Per-module health assessment | Architecture analysis |
| 27 | Responsibility Analysis (v2.3.0) | God objects, mixed responsibilities, feature leakage | Architecture analysis |
| 28 | Dependency Analysis (v2.3.0) | Circular deps, coupling, fan-in/fan-out | Architecture analysis |
| 29 | Scalability Assessment (v2.3.0) | Maintainability, extensibility, modularity scores | Architecture analysis |
| 30 | Technical Debt Summary (v2.3.0) | Debt classification, cleanup effort, risk | Architecture analysis |
| 31 | Architecture Risk Matrix (v2.3.0) | Risk, impact, likelihood, cost, priority | Architecture analysis |
| 32 | Design Patterns (v2.3.0) | Verified patterns with evidence | Architecture analysis |
| 33 | Anti-Patterns (v2.3.0) | Detected anti-patterns with evidence | Architecture analysis |
| 34 | Maintainability Forecast (v2.3.0) | Current maintainability, risks, growth impact | Architecture analysis |
| 35 | Refactor Opportunity Map (v2.3.0) | Grouped refactors with benefit/cost | Architecture analysis |
| 36 | Architecture Summary (v2.3.0) | Strongest/weakest areas, highest ROI improvements | Architecture analysis |
| 37 | Repository Quality Grade | Letter grade with justification | Health Score |
| 38 | Executive Summary | 30-second manager view | Aggregation |
| 39 | Repository Evolution | Health progression vs prior runs | Trend analysis |
| 40 | Improvement Delta | Resolved/New/Regressed/Unchanged | Baseline comparison |
| 41 | Baseline Analysis | Known-issue comparison | baseline.json |
| 42 | Decision Analysis | Human decisions required | Decision Engine |
| 43 | Engineering Roadmap | Immediate/Short/Medium/Long term | Findings + priority |
| 44 | Release Readiness Predictor | Probability of READY TO SHIP | Certification + trends |
| 45 | Executive Decision Summary | Fixes, decisions, blockers, next action | Aggregation |
| 46 | Engineering Priority Matrix | Priority/Business Impact/Effort/Risk/Sprint | Findings + priority |
| 47 | Release Decision Summary | Decision, reason, what remains, estimated work | Release Engine |
| 48 | Human Override Awareness | Accepted/deferred recommendations | OVERRIDES.md |
| 49 | Pull Request Analysis | Branch vs target diff | Git diff |
| 50 | Execution Metrics | Time, scope, rules, tool calls | Pipeline instrumentation |
| 51 | Trend Summary | Health delta vs baseline | Trend analysis |
| 52 | Certification Checklist | Build/Type/Lint/Test/Security/CI status | Gate execution |
| 53 | Certification | Final verdict with Overall Reliability | Certification logic |

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
- Explainability Block (see `../references/explainability.md`)
- Evidence Chain (v2.2.0) — Detection Method, Observed Evidence, Engineering Reasoning, Engineering Impact, Recommendation, Verification Method
- Evidence Quality Classification (v2.2.0) — Direct Evidence, Strong Evidence, Indirect Evidence, Weak Evidence, Assumption, Not Verified
- Detection Source (v2.2.0) — Static Analysis, Repository Structure, Configuration Analysis, Dependency Analysis, Build Output, ESLint, TypeScript, Security Inspection, Runtime Observation, Documentation Review, Manual Engineering Reasoning
- Finding Lifecycle (v2.2.0) — Detected, Verified, Fixed, Reopened, Deprecated, Ignored, Accepted Risk
- Recommendation Classification (v2.2.0) — Bug Fix, Refactor, Architecture, Performance, Security, Documentation, Developer Experience, Infrastructure, Testing, Technical Debt

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

## Architecture Explainability

### Responsibilities

- Generate the standardized 55-section report
- Ensure consistent ordering and formatting
- Produce deterministic output
- Apply Explainability Engine to findings
- Generate machine-readable reports (JSON, SARIF)

### Non-Responsibilities

- Classifying findings (Decision Engine)
- Calculating Health Score (Health Score Engine)
- Determining certification status (Certification Engine)
- Loading policies (Policy Engine)
- Storing rules (Rule Registry)

### Owned Decisions

- Report section ordering
- Formatting consistency
- Terminology consistency
- Deterministic output

### Consumed Decisions

- Classified findings (from Decision Engine)
- Health Score (from Health Score Engine)
- Confidence metrics (from Confidence Model)
- Certification status (from Certification Engine)

### Produced Decisions

- FinalCode Certification Report
- Machine-readable reports

## Repository Discoverability

### Related Documents

- `core/decision-engine.md` — provides classified findings
- `core/certification-engine.md` — orchestrates report generation
- `references/report-format.md` — defines report template
- `references/health-score.md` — provides Health Score
- `references/confidence-model.md` — provides confidence metrics
- `references/explainability.md` — defines explainability requirements
- `references/examples.md` — provides formatting examples

### Used By

- Certification Engine (for report generation)
- User (for reading reports)
- CI/CD pipelines (for machine-readable reports)

### Depends On

- Decision Engine (for classified findings)
- Health Score Engine (for Health Score)
- Confidence Model (for confidence metrics)
- Explainability Engine (for explainability blocks)
- Report Format (for template)
