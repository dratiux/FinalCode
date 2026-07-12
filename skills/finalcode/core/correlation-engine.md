# FinalCode Cross-Finding Correlation Engine

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Identifies relationships between findings and detects root causes |
| Execution Stage | DECISION (post-classification) |
| Loaded By | Decision Engine, Report Engine |
| Dependencies | Decision Engine, Repository Intelligence Engine |
| Outputs | Correlated findings, root cause chains, finding clusters |
| Consumers | Report Engine, Execution Planner |
| Applies To | All audits |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| findings | array | Yes | Decision Engine |
| repositoryProfile | object | Yes | Repository Intelligence Engine |
| evidenceChains | array | Yes | Evidence collection |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| correlatedFindings | array | Findings with relationship information |
| rootCauseChains | array | Root cause → effect chains |
| findingClusters | array | Groups of related findings |
| engineeringThemes | array | Common themes across findings |
| consolidatedRecommendations | array | Merged recommendations |

### Preconditions

- Findings must be classified
- Repository Profile must be generated
- Evidence chains must be complete

### Postconditions

- Findings have relationship information
- Root causes are identified
- Related findings are clustered
- Recommendations are consolidated

## Purpose

The Cross-Finding Correlation Engine transforms independent findings into a connected engineering narrative. Instead of listing findings separately, it identifies how they relate to each other, what root causes they share, and what engineering themes they represent.

**Why this matters:** Engineering problems rarely exist in isolation. A missing test suite may correlate with weak CI, low coverage, and documentation gaps. By correlating findings, FinalCode can:

- Identify root causes instead of symptoms
- Reduce redundant recommendations
- Provide a coherent engineering narrative
- Enable prioritized execution planning

## Correlation Methods

### Root Cause Analysis

Identify the underlying cause of multiple findings:

```
Finding 1: Missing unit tests
Finding 2: Low test coverage
Finding 3: No CI testing

Root Cause: Testing infrastructure not established

↓

Root Cause Chain:
Testing infrastructure missing
  → No test framework configured
    → No test files written
      → No CI testing pipeline
        → Low coverage metrics
```

### Duplicate Finding Detection

Identify findings that describe the same issue from different angles:

| Duplicate Type | Detection Method | Action |
|----------------|-----------------|--------|
| Exact duplicate | Same file, same issue | Merge findings |
| Near duplicate | Same file, similar issue | Flag for review |
| Cross-file duplicate | Different files, same pattern | Group as cluster |
| Root cause duplicate | Different symptoms, same cause | Link to root cause |

### Finding Clusters

Group related findings that share characteristics:

| Cluster Type | Detection Method | Example |
|--------------|-----------------|---------|
| File cluster | Findings in same file | Multiple issues in one component |
| Module cluster | Findings in same module | Module-wide problems |
| Pattern cluster | Same anti-pattern | All `any` usage across codebase |
| Theme cluster | Same engineering theme | All testing-related issues |
| Cause cluster | Same root cause | All caused by missing infrastructure |

### Cause → Effect Chains

Map the chain from root cause to observed findings:

```
Root Cause: Missing TypeScript strict mode
  ↓
Effect 1: `any` types used throughout codebase
    ↓
Effect 2: Type errors not caught at compile time
      ↓
Effect 3: Runtime type errors in production
        ↓
Effect 4: Debugging complexity increased
```

### Engineering Themes

Identify common themes across findings:

| Theme | Description | Example Findings |
|-------|-------------|------------------|
| Testing | Testing-related issues | Missing tests, low coverage, no CI |
| Security | Security-related issues | Hardcoded secrets, missing validation |
| Performance | Performance-related issues | Large bundles, missing optimization |
| Documentation | Documentation-related issues | Missing README, no JSDoc |
| Architecture | Architecture-related issues | Tight coupling, layer violations |
| Maintainability | Maintainability-related issues | Complex code, large files |

### Dependency Relationships

Identify dependencies between findings:

| Relationship | Detection Method | Impact |
|--------------|-----------------|--------|
| Blocks | Finding A must be fixed before B | Priority ordering |
| Depends on | Finding A requires B to be fixed first | Dependency tracking |
| Related to | Finding A and B are related | Cluster grouping |
| Conflicts with | Fixing A may affect B | Trade-off evaluation |

## Correlation Output Format

### Correlated Finding

```
CORRELATED FINDING
-------------------------------------------------
Finding ID: FC-CODE-001
Original Classification: Engineering Recommendation
Correlation Type: Part of cluster

Root Cause: Testing infrastructure not established

Cluster:
  FC-CODE-001: Missing unit tests
  FC-TEST-001: Low test coverage
  FC-CI-001: No CI testing

Engineering Theme: Testing

Dependency Relationships:
  Blocks: FC-SEC-001 (security testing)
  Depends on: None

Consolidated Recommendation:
  Establish testing infrastructure including test framework,
  CI pipeline, and coverage tracking. This addresses all
  findings in this cluster.
```

### Root Cause Chain

```
ROOT CAUSE CHAIN
-------------------------------------------------
Root Cause: Testing infrastructure not established
Evidence:
  - No test framework in package.json
  - No test files in repository
  - No CI configuration with test step

Effect Chain:
  1. No test framework configured
  2. No test files written
  3. No CI testing pipeline
  4. Low coverage metrics
  5. No regression detection

Engineering Impact:
  - No automated quality assurance
  - No regression detection
  - Manual testing only
  - High risk of regressions

Recommendation:
  Establish testing infrastructure as priority.
  This single action addresses 5 findings.
```

### Finding Cluster

```
FINDING CLUSTER
-------------------------------------------------
Cluster ID: CLUSTER-TEST-001
Theme: Testing
Finding Count: 5
Root Cause: Testing infrastructure not established

Findings:
  FC-CODE-001: Missing unit tests (Medium)
  FC-TEST-001: Low test coverage (Medium)
  FC-CI-001: No CI testing (Medium)
  FC-DOC-001: No test documentation (Low)
  FC-PERF-001: No performance tests (Low)

Consolidated Recommendation:
  Establish comprehensive testing infrastructure:
  1. Configure test framework (Jest/Vitest)
  2. Write unit tests for core logic
  3. Set up CI testing pipeline
  4. Configure coverage tracking
  5. Document testing strategy

Estimated Effort: Half day
Expected Health Improvement: +8 points
Expected Confidence Improvement: +10%
```

## Recommendation Consolidation

When multiple findings have similar recommendations, consolidate them:

### Consolidation Rules

| Condition | Action |
|-----------|--------|
| Same recommendation for same root cause | Merge into single recommendation |
| Similar recommendations for related findings | Group with explanation |
| Conflicting recommendations | Flag for trade-off analysis |
| Dependent recommendations | Order by dependency |

### Consolidated Output

```
CONSOLIDATED RECOMMENDATIONS
-------------------------------------------------
Theme: Testing

Finding Count: 5
Root Cause: Testing infrastructure not established

Consolidated Recommendation:
  Establish testing infrastructure. This addresses all
  testing-related findings in the repository.

Implementation Steps:
  1. Configure test framework (Jest/Vitest)
  2. Write unit tests for core logic
  3. Set up CI testing pipeline
  4. Configure coverage tracking
  5. Document testing strategy

Estimated Effort: Half day
Expected Impact: Resolves 5 findings, +8 health score
Priority: P1 (blocks security testing)
```

## Architecture Explainability

### Responsibilities

- Correlate related findings
- Detect root causes
- Identify finding clusters
- Consolidate recommendations
- Map cause → effect chains

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating scores (Health Score)

### Owned Decisions

- Root cause detection
- Finding clustering
- Recommendation consolidation
- Dependency mapping

### Consumed Decisions

- Classified findings (from Decision Engine)
- Repository Profile (from Repository Intelligence Engine)
- Evidence chains (from Evidence Collection)

### Produced Decisions

- Correlated findings
- Root cause chains
- Finding clusters
- Consolidated recommendations

## Integration with Other Engines

The Cross-Finding Correlation Engine integrates into the analysis pipeline:

```
Repository Intelligence
       ↓
Evidence Collection
       ↓
Rule Matching
       ↓
Context Collection
       ↓
False Positive Check
       ↓
Risk Analysis
       ↓
Classification
       ↓
Finding Correlation ◄── Correlation Engine
       ↓
Trade-off Analysis
       ↓
Execution Planning
       ↓
Report Generation
```
