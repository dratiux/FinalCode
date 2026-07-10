# FinalCode Health Score

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Defines the Health Score formula, weights, and grade assignment |
| Execution Stage | DECISION, REPORT |
| Loaded By | Report Engine, Certification Engine |
| Dependencies | None (standalone) |
| Outputs | Health Score (0-100), grade, category breakdown, deductions |
| Consumers | Report Engine, Certification Engine |
| Applies To | All audits |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| findings | array | Yes | Decision Engine |
| gateResults | object | Yes | Quality Gate execution |
| policy | object | Yes | Policy Engine |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| healthScore | number | Composite score 0-100 |
| grade | string | Letter grade (A+ through F) |
| categoryBreakdown | object | Per-category scores and contributions |
| deductions | array | List of deductions with finding references |
| recommendations | array | Actions to improve score |

### Preconditions

- Findings must be classified and severity-calibrated
- Gate results must be determined
- Policy must be loaded

### Postconditions

- Health Score is deterministic for same inputs
- Every deduction references at least one finding
- Grade assignment follows the defined thresholds

### Required Evidence

| Evidence | Purpose |
|----------|---------|
| Finding classifications | Determine which categories are affected |
| Gate pass/fail status | Weight gate contributions |
| Policy thresholds | Determine grade boundaries |

### Generated Decisions

| Decision | Rule |
|----------|------|
| Health Score value | Weighted sum of category scores |
| Grade assignment | Threshold-based mapping |
| Category contributions | Per-category weight × score |

### Possible Outcomes

| Outcome | Condition |
|---------|-----------|
| Score 90-100 (Excellent) | All gates pass, few findings |
| Score 75-89 (Good) | Most gates pass, moderate findings |
| Score 50-74 (Fair) | Some gates fail, significant findings |
| Score 0-49 (Poor) | Multiple gates fail, critical findings |

The Health Score is a composite score from 0 to 100 measuring overall repository quality. It is reproducible, explainable, and every deduction references the findings that caused it.

## Score Range

0–100

## Classification

| Range | Classification |
|---|---|
| 90–100 | Excellent |
| 75–89 | Good |
| 50–74 | Fair |
| 0–49 | Poor |

## Weighted Categories

| Category | Weight |
|---|---|
| Security | 20% |
| Architecture | 15% |
| Maintainability | 15% |
| Performance | 10% |
| Documentation | 10% |
| Accessibility | 10% |
| Testing | 10% |
| Type Safety | 5% |
| GitHub Readiness | 5% |
| Dead Code | 0%* |

*Dead Code contributes via Maintainability in the weighted model.

**Note:** Weights may be overridden by project profile. The actual weights used this run are shown in the report.

## Calculation

### Step 1: Calculate Category Scores

Each category score (0–100) is calculated from findings in that category:

```
Category Score = 100 - (deduction per finding)
```

### Deduction Rules

| Severity | Deduction |
|---|---|
| Critical | -25 points |
| High | -15 points |
| Medium | -8 points |
| Low | -3 points |
| Informational | -1 point |

**Maximum deduction per category:** 100 points (score cannot go below 0)

### Step 2: Apply Weights

```
Contribution = Category Score × Weight
```

### Step 3: Sum Contributions

```
Health Score = Sum of all Contributions
```

### Step 4: Apply Policy Target

If a policy target is configured (e.g., 90 for production), the Health Score is compared against it for certification purposes, but the displayed score is the raw calculated value.

## Explanation Requirements

Every Health Score must include:

### Weighted Formula

```
REPOSITORY HEALTH SCORE
-------------------------------------------------
Health Score: XX / 100 (Excellent | Good | Fair | Poor)

Weighted Formula:
  Category        Weight  Score  Contribution
  Security        20%     XX     XX.X
  Architecture    15%     XX     XX.X
  Maintainability 15%     XX     XX.X
  Performance     10%     XX     XX.X
  Documentation   10%     XX     XX.X
  Accessibility   10%     XX     XX.X
  Testing         10%     XX     XX.X
  Type Safety      5%     XX     XX.X
  GitHub Ready     5%     XX     XX.X
  Dead Code        0%*    XX     00.0
  Final Health Score 100%          XX / 100
```

### Category Breakdown

```
Category Breakdown:
  Security:          XX/100
  Architecture:      XX/100
  Maintainability:   XX/100
  Performance:       XX/100
  Documentation:     XX/100
  Accessibility:     XX/100
  Testing:           XX/100
  Type Safety:       XX/100
  GitHub Readiness:  XX/100
  Dead Code:         XX/100
```

### Major Contributors

List the categories contributing most to the score:

```
Major Contributors:
  Security (19.2) — strong authentication and secrets management
  Architecture (13.2) — clean separation of concerns, no circular dependencies
  Maintainability (13.0) — well-structured modules, low duplication
```

### Largest Deductions

List the categories with the largest deductions:

```
Largest Deductions:
  Performance (-1.5) — bundle size slightly above target; lazy loading not fully applied
  Testing (-1.8) — integration test coverage below 80% threshold
```

### How to Gain the Next 5 Points

Provide actionable steps to improve the score:

```
How to Gain the Next 5 Points (target: 95):
  1. Increase test coverage from 82% to 90% (+1.8 points)
  2. Apply lazy loading to remaining route components (+0.8 points)
  3. Reduce bundle size by 10% via tree-shaking (+0.5 points)
  4. Add missing API documentation (+0.3 points)
  Total potential gain: +3.4 points (to 93.4; remaining 1.6 requires architecture improvements)
```

## Grade Assignment

The Health Score maps to a letter grade:

| Grade | Health Score Range |
|---|---|
| A+ | 95–100 |
| A | 90–94 |
| A- | 85–89 |
| B+ | 80–84 |
| B | 75–79 |
| B- | 70–74 |
| C | 60–69 |
| D | 50–59 |
| F | 0–49 |

### Grade Justification

Every grade must be justified:

```
REPOSITORY QUALITY GRADE
-------------------------------------------------
Engineering Grade: A-

Reason:
  Excellent architecture — clean separation of concerns, no circular dependencies.
  Strong security — no Critical/High findings, secrets properly managed.
  Testing coverage still below target — 82% vs 90% policy target.
  Minor documentation inconsistencies — two API endpoints lack JSDoc.
```

**Rule:** The grade must exactly match the Health Score per the documented rules. Never report Health Score 64 and Grade A.

## Reproducibility

Given the same findings, the Health Score must produce the same result:

- Same category scores
- Same weighted contributions
- Same final score
- Same grade

**Rule:** The Health Score is a pure function of its inputs (findings and weights). No randomness, no time-dependent behavior.

## Integration with Other Engines

The Health Score consumes:

- **Findings** (from Decision Engine) — severity and category
- **Configuration** — policy target and weight overrides

The Health Score produces:

- Health Score (report section)
- Grade (report section)
- Grade Justification (report section)
- Health Score Explanation (report section)
- Dashboard fields (Health Score, Grade, Production Readiness)
