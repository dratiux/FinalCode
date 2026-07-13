# FinalCode Architecture Metrics

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Measures architecture quality with quantitative metrics |
| Execution Stage | ANALYSIS |
| Loaded By | Engineering Review Mode, Architecture Mode |
| Dependencies | Repository Intelligence Engine, Engineering Graph |
| Outputs | Measurable architecture metrics with scores |
| Consumers | Report Engine, User |
| Applies To | All audits |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| repositoryProfile | object | Yes | Repository Intelligence Engine |
| engineeringGraph | object | Yes | Engineering Graph |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| metrics | object | Architecture metrics with scores |
| scores | object | Scores for each metric |
| recommendations | array | Improvement recommendations |

### Preconditions

- Repository Profile must be generated
- Engineering Graph must be built

### Postconditions

- Architecture metrics are calculated
- Scores are assigned
- Recommendations are generated

## Purpose

Architecture Metrics moves beyond qualitative reviews to provide measurable values for architecture quality. This enables objective comparison and tracking of architecture improvements.

**Why this matters:** Qualitative reviews are subjective. Measurable metrics enable objective comparison, tracking improvements, and making data-driven architecture decisions.

## Metrics

### Cyclomatic Complexity

Measure code complexity:

| Metric | Description | Threshold |
|--------|-------------|-----------|
| Function Complexity | Complexity per function | < 10 (Good), 10-20 (Medium), > 20 (High) |
| File Complexity | Complexity per file | < 50 (Good), 50-100 (Medium), > 100 (High) |
| Module Complexity | Complexity per module | < 200 (Good), 200-500 (Medium), > 500 (High) |

**Calculation:**
```
Cyclomatic Complexity = Count of decision points + 1
Decision points: if, else if, while, for, switch case, catch, &&, ||, ?:
```

### Module Coupling

Measure dependencies between modules:

| Metric | Description | Threshold |
|--------|-------------|-----------|
| Afferent Coupling (Ca) | Incoming dependencies | < 5 (Low), 5-10 (Medium), > 10 (High) |
| Efferent Coupling (Ce) | Outgoing dependencies | < 5 (Low), 5-10 (Medium), > 10 (High) |
| Instability (I) | Ce / (Ca + Ce) | 0-0.5 (Stable), 0.5-1 (Unstable) |
| Abstractness (A) | Abstract classes / Total classes | 0-0.5 (Concrete), 0.5-1 (Abstract) |

### Module Cohesion

Measure how focused a module is:

| Metric | Description | Threshold |
|--------|-------------|-----------|
| LCOM (Lack of Cohesion) | Method sharing common data | < 2 (Good), 2-5 (Medium), > 5 (Low) |
| TCC (Tight Class Cohesion) | Related methods / Total methods | > 0.7 (Good), 0.5-0.7 (Medium), < 0.5 (Low) |
| LCC (Loose Class Cohesion) | Related methods (direct + indirect) / Total methods | > 0.8 (Good), 0.6-0.8 (Medium), < 0.6 (Low) |

### Dependency Depth

Measure how deep dependencies go:

| Metric | Description | Threshold |
|--------|-------------|-----------|
| Maximum Depth | Deepest dependency chain | < 5 (Good), 5-10 (Medium), > 10 (High) |
| Average Depth | Average dependency depth | < 3 (Good), 3-5 (Medium), > 5 (High) |
| Depth Violations | Dependencies exceeding threshold | 0 (Good), 1-3 (Medium), > 3 (High) |

### Layer Violations

Measure violations of layer architecture:

| Metric | Description | Threshold |
|--------|-------------|-----------|
| Skip Violations | Skipping layers | 0 (Good), 1-2 (Medium), > 2 (High) |
| Upward Violations | Importing from higher layers | 0 (Good), 1-3 (Medium), > 3 (High) |
| Lateral Violations | Importing from same layer (if not allowed) | 0 (Good), 1-5 (Medium), > 5 (High) |

### File Size Metrics

Measure file sizes:

| Metric | Description | Threshold |
|--------|-------------|-----------|
| Average File Size | Average lines per file | < 200 (Good), 200-500 (Medium), > 500 (High) |
| Large Files | Files > 500 lines | 0 (Good), 1-3 (Medium), > 3 (High) |
| Very Large Files | Files > 1000 lines | 0 (Good), 1-2 (Medium), > 2 (High) |

### Function Size Metrics

Measure function sizes:

| Metric | Description | Threshold |
|--------|-------------|-----------|
| Average Function Size | Average lines per function | < 30 (Good), 30-50 (Medium), > 50 (High) |
| Large Functions | Functions > 50 lines | 0 (Good), 1-5 (Medium), > 5 (High) |
| Very Large Functions | Functions > 100 lines | 0 (Good), 1-2 (Medium), > 2 (High) |

### Largest Components

Identify largest components:

| Metric | Description | Threshold |
|--------|-------------|-----------|
| Largest File | File with most lines | < 500 (Good), 500-1000 (Medium), > 1000 (High) |
| Largest Function | Function with most lines | < 50 (Good), 50-100 (Medium), > 100 (High) |
| Largest Module | Module with most files | < 10 (Good), 10-20 (Medium), > 20 (High) |

### Duplicate Logic

Measure code duplication:

| Metric | Description | Threshold |
|--------|-------------|-----------|
| Duplicate Lines | Lines duplicated | < 5% (Good), 5-15% (Medium), > 15% (High) |
| Duplicate Functions | Functions duplicated | 0 (Good), 1-3 (Medium), > 3 (High) |
| Duplicate Modules | Modules with similar logic | 0 (Good), 1-2 (Medium), > 2 (High) |

### Technical Debt Density

Measure technical debt per codebase:

| Metric | Description | Threshold |
|--------|-------------|-----------|
| Debt Items per 1000 Lines | Debt items / (Lines / 1000) | < 2 (Good), 2-5 (Medium), > 5 (High) |
| Debt Hours per 1000 Lines | Debt hours / (Lines / 1000) | < 4 (Good), 4-10 (Medium), > 10 (High) |
| Debt Cost per 1000 Lines | Debt cost / (Lines / 1000) | < 100 (Good), 100-500 (Medium), > 500 (High) |

## Score Calculation

### Metric Scores

Each metric is scored 0-100:

```
Metric Score = 100 - (Actual Value - Threshold) / Threshold * 100
```

### Overall Architecture Score

Calculate overall score as weighted average:

```
Architecture Score = Σ (Metric Score × Metric Weight)
```

### Metric Weights

| Metric | Weight | Rationale |
|--------|--------|-----------|
| Cyclomatic Complexity | 15% | Code maintainability |
| Module Coupling | 15% | Dependency management |
| Module Cohesion | 10% | Code organization |
| Dependency Depth | 10% | Architecture quality |
| Layer Violations | 10% | Architecture compliance |
| File Size | 10% | Code readability |
| Function Size | 10% | Code maintainability |
| Duplicate Logic | 10% | Code quality |
| Technical Debt | 10% | Long-term sustainability |

## Output Format

```
ARCHITECTURE METRICS
==================================================
Architecture Score: 88/100
Grade: A-

Cyclomatic Complexity: 85/100
  Average Function Complexity: 8.2 (Good)
  Average File Complexity: 42.5 (Good)
  Average Module Complexity: 165.3 (Good)

Module Coupling: 90/100
  Average Afferent Coupling: 4.2 (Good)
  Average Efferent Coupling: 3.8 (Good)
  Average Instability: 0.48 (Stable)

Module Cohesion: 85/100
  Average LCOM: 1.8 (Good)
  Average TCC: 0.75 (Good)
  Average LCC: 0.82 (Good)

Dependency Depth: 92/100
  Maximum Depth: 4 (Good)
  Average Depth: 2.8 (Good)
  Depth Violations: 0 (Good)

Layer Violations: 95/100
  Skip Violations: 0 (Good)
  Upward Violations: 1 (Good)
  Lateral Violations: 2 (Good)

File Size: 88/100
  Average File Size: 185 lines (Good)
  Large Files: 2 (Good)
  Very Large Files: 0 (Good)

Function Size: 90/100
  Average Function Size: 28 lines (Good)
  Large Functions: 3 (Good)
  Very Large Functions: 0 (Good)

Duplicate Logic: 85/100
  Duplicate Lines: 4.2% (Good)
  Duplicate Functions: 2 (Good)
  Duplicate Modules: 1 (Good)

Technical Debt: 82/100
  Debt Items per 1000 Lines: 1.8 (Good)
  Debt Hours per 1000 Lines: 3.5 (Good)
  Debt Cost per 1000 Lines: 85 (Good)

Recommendations:
  1. Reduce complexity in src/services/api.ts
  2. Extract shared logic from src/utils/helpers.ts
  3. Split large file src/components/DataGrid.tsx
==================================================
```

## Architecture Explainability

### Responsibilities

- Calculate architecture metrics
- Score each metric
- Generate recommendations
- Track improvements

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Metric calculation
- Score assignment
- Recommendation generation

### Consumed Decisions

- Repository Profile (from Repository Intelligence Engine)
- Engineering Graph (from Engineering Graph Engine)

### Produced Decisions

- Architecture metrics
- Scores
- Recommendations
