# Engineering Intent Memory

## Purpose

Persist verified engineering decisions so that future analyses reuse validated intent. Once a decision has been classified as intentional, it should not be re-evaluated unless the context changes.

## Stored Decisions

The following types of decisions are stored in Engineering Intent Memory:

### Architecture Decisions

Previously validated architectural choices:

- "Project intentionally uses a monolithic architecture"
- "Project intentionally uses serverless deployment"
- "Project intentionally uses a single database"

### Accepted Trade-offs

Previously accepted compromises:

- "Project intentionally uses mailto for contact forms"
- "Project intentionally avoids backend services"
- "Project intentionally skips automated tests"
- "Project intentionally deploys as static hosting"

### Contextual Constraints

Known constraints that influence decisions:

- "Project is constrained by client infrastructure requirements"
- "Project operates in a regulated industry"
- "Project has a single developer"

### Intentional Simplifications

Deliberate reductions in complexity:

- "Project intentionally skips state management"
- "Project intentionally uses flat file structure"
- "Project intentionally avoids routing"

### Engineering Strengths

Previously recognized strengths:

- "Project has excellent type safety"
- "Project has excellent architecture"

## Memory Format

Every entry in Engineering Intent Memory must include:

- **Decision ID**: Unique identifier
- **Decision**: The validated decision
- **Category**: Architecture Decision, Accepted Trade-off, Contextual Constraint, Intentional Simplification, or Engineering Strength
- **Evidence**: Supporting evidence that validated this decision
- **Confidence**: Confidence in the validation
- **Date**: When the decision was validated
- **Context Snapshot**: The project context at the time of validation
- **Status**: Active, Superseded, or Reversed

## Memory Storage

Engineering Intent Memory is stored in `.finalcode/INTENT_MEMORY.md`. This file is created automatically when the first intentional decision is recorded.

### File Format

```yaml
# Engineering Intent Memory
repository: my-project
entries:
  - id: INT-001
    decision: mailto contact form
    category: Accepted Trade-off
    evidence: "No server-side code detected, static hosting configured"
    confidence: Very High
    validated_date: 2026-07-14
    context_snapshot:
      project_type: Brand Website
      deployment: Static Hosting
      architecture: Flat
    status: Active
```

## Memory Reuse

When analyzing a previously analyzed repository:

1. Load Engineering Intent Memory from `.finalcode/INTENT_MEMORY.md`
2. For each observation, check if a validated decision exists in memory
3. If found, skip re-validation and use the existing classification
4. If context has changed significantly, flag the previous decision for re-validation
5. New validated decisions are appended to memory

## Integration

Engineering Intent Memory is loaded during Phase 0 alongside Context Memory. It is consulted by the Engineering Decision Engine and Decision Validation during observation classification.
