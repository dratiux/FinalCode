# Context Memory

## Purpose

Engineering Memory stores project classifications, profile history, context changes, intent evolution, historical certification, repository maturity, and previous engineering assumptions. Future analyses reuse historical context to improve accuracy and reduce redundant work.

## Stored Information

### Project Classifications

All previous classifications of the repository, including:

- Classification timestamp
- Detected project type
- Detected architecture
- Detected deployment model
- Detected technology stack
- Confidence scores
- Classification evidence

### Profile History

All certification profiles that have been applied to this repository:

- Profile name
- Selection reason
- Selection method (automatic, explicit, override)
- Override history
- Profile activation timestamps

### Context Changes

Tracking of how the repository context has evolved over time:

- Previous vs. current classification deltas
- Architecture changes
- Framework migrations
- Deployment target changes
- Intent evolution

### Intent Evolution

How the repository purpose has changed over time:

- Original detected intent
- Intent changes with timestamps
- Reasons for intent changes
- Evidence of changes

### Historical Certification

Previous certification results for the repository:

- Certification verdicts
- Health scores
- Gate statuses
- Finding counts
- Certification timestamps

### Repository Maturity

Tracking of engineering maturity over time:

- Maturity level at each analysis
- Dimension scores
- Improvement areas
- Regressions

### Engineering Assumptions

All assumptions made during previous analyses:

- Assumption descriptions
- Verification status
- Whether assumptions were validated
- Impact of incorrect assumptions

## Memory Storage

Context Memory is stored in `.finalcode/CONTEXT_MEMORY.md`. This file is created automatically when Context Memory is first used.

### File Format

```yaml
# Context Memory
repository: my-project
first_analysis: 2026-07-14T10:00:00Z
last_analysis: 2026-07-14T14:00:00Z
analysis_count: 5

classifications:
  - date: 2026-07-14T14:00:00Z
    project_type: SaaS
    architecture: Modular Monolith
    deployment: AWS
    intent: Commercial Product
    confidence: 92%

profiles:
  - date: 2026-07-14T14:00:00Z
    profile: SaaS
    selection_method: automatic

changes:
  - date: 2026-07-14T10:00:00Z
    type: architecture_change
    from: Monolithic
    to: Modular Monolith
    reason: "Scalability requirements increased"

certifications:
  - date: 2026-07-14T10:00:00Z
    verdict: READY WITH WARNINGS
    health_score: 72
    findings: 14

maturity:
  - date: 2026-07-14T10:00:00Z
    level: 3 (Defined)
  - date: 2026-07-14T14:00:00Z
    level: 3 (Defined)

assumptions:
  - assumption: "Project uses PostgreSQL"
    verified: true
    verification_method: "Found schema definitions in prisma/"
```

## Memory Reuse

When analyzing a previously analyzed repository:

1. Load Context Memory from `.finalcode/CONTEXT_MEMORY.md`
2. Compare previous classifications with current detection
3. If classification matches, reuse previous context to accelerate analysis
4. If classification has changed, document the change and update memory
5. Apply previously successful profile selections
6. Reference previous findings to track resolution progress

## Integration

Context Memory is loaded during Phase 0 (Repository Discovery) if a previous analysis exists. It is updated after every analysis completes.
