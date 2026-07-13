# FinalCode Project Lifecycle

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Identifies current project lifecycle stage and adapts recommendations |
| Execution Stage | ANALYSIS |
| Loaded By | All operating modes, Workflow Engine |
| Dependencies | Repository Intelligence Engine, Engineering Memory |
| Outputs | Current lifecycle stage with adapted recommendations |
| Consumers | Workflow Engine, Report Engine, User |
| Applies To | All audits |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| repositoryProfile | object | Yes | Repository Intelligence Engine |
| engineeringMemory | object | Yes | Engineering Memory |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| lifecycleStage | string | Current lifecycle stage |
| stageHistory | array | Previous lifecycle stages |
| recommendations | array | Adapted recommendations |
| nextStage | string | Predicted next stage |

### Preconditions

- Repository Profile must be generated
- Engineering Memory must be initialized

### Postconditions

- Lifecycle stage is identified
- Recommendations are adapted
- Next stage is predicted

## Purpose

Project Lifecycle introduces lifecycle awareness. FinalCode identifies the current lifecycle stage automatically and adapts recommendations accordingly. This ensures recommendations are relevant to the project's current state.

**Why this matters:** A project in early development needs different recommendations than a mature production system. Lifecycle awareness ensures recommendations are always appropriate and actionable.

## Lifecycle Stages

### Stage 1: Planning

| Characteristics | Recommendations |
|----------------|-----------------|
| Architecture decisions | Focus on architecture |
| Technology selection | Evaluate technology choices |
| Project structure | Define project structure |
| Initial setup | Setup tooling and CI/CD |

### Stage 2: Development

| Characteristics | Recommendations |
|----------------|-----------------|
| Active feature development | Focus on code quality |
| Rapid iteration | Balance speed and quality |
| Team collaboration | Focus on documentation |
| Integration testing | Focus on testing |

### Stage 3: Testing

| Characteristics | Recommendations |
|----------------|-----------------|
| Quality assurance | Focus on test coverage |
| Bug fixing | Focus on bug resolution |
| Performance testing | Focus on performance |
| Security testing | Focus on security |

### Stage 4: Refactoring

| Characteristics | Recommendations |
|----------------|-----------------|
| Code improvement | Focus on code quality |
| Architecture optimization | Focus on architecture |
| Technical debt reduction | Focus on debt reduction |
| Performance optimization | Focus on performance |

### Stage 5: Certification

| Characteristics | Recommendations |
|----------------|-----------------|
| Production readiness | Focus on certification |
| Final review | Focus on final checks |
| Release preparation | Focus on release |
| Documentation | Focus on documentation |

### Stage 6: Release

| Characteristics | Recommendations |
|----------------|-----------------|
| Deployment | Focus on deployment |
| Monitoring | Focus on monitoring |
| Rollback planning | Focus on rollback |
| Post-release | Focus on post-release |

### Stage 7: Maintenance

| Characteristics | Recommendations |
|----------------|-----------------|
| Bug fixes | Focus on bug fixes |
| Security updates | Focus on security |
| Dependency updates | Focus on dependencies |
| Minor improvements | Focus on improvements |

### Stage 8: Next Sprint

| Characteristics | Recommendations |
|----------------|-----------------|
| Sprint planning | Focus on sprint goals |
| Task prioritization | Focus on prioritization |
| Resource allocation | Focus on resources |
| Risk assessment | Focus on risks |

## Stage Detection

### Detection Methods

| Method | Description |
|--------|-------------|
| Git history analysis | Analyze commit patterns |
| File modification patterns | Analyze file changes |
| Test coverage trends | Analyze test trends |
| Documentation state | Analyze documentation |
| Release history | Analyze release patterns |
| Issue tracking | Analyze issue patterns |

### Confidence Levels

| Level | Description | Criteria |
|-------|-------------|----------|
| High | Clear stage indicators | > 80% confidence |
| Medium | Moderate indicators | 60-80% confidence |
| Low | Weak indicators | < 60% confidence |

## Lifecycle Output

```
PROJECT LIFECYCLE
==================================================
Current Stage: Maintenance (Confidence: 85%)

Stage History:
  1. Planning (v1.0.0 - v1.2.0)
  2. Development (v1.3.0 - v2.0.0)
  3. Testing (v2.0.0 - v2.5.0)
  4. Certification (v2.5.0 - v3.0.0)
  5. Release (v3.0.0 - v3.1.0)
  6. Maintenance (v3.1.0 - present)

Current Characteristics:
  ✓ Active bug fixes
  ✓ Security updates
  ✓ Dependency updates
  ✓ Minor improvements

Adapted Recommendations:
  1. Focus on security updates
  2. Update dependencies regularly
  3. Monitor for regressions
  4. Maintain documentation
  5. Plan next major release

Next Stage Prediction:
  Predicted: Next Sprint (Confidence: 70%)
  Timeline: 2-4 weeks
  Triggers: New feature requests, Major version planning

Lifecycle Status: ✅ Active maintenance
==================================================
```

## Architecture Explainability

### Responsibilities

- Identify current lifecycle stage
- Track stage history
- Adapt recommendations
- Predict next stage

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Stage detection
- Recommendation adaptation
- Next stage prediction

### Consumed Decisions

- Repository Profile (from Repository Intelligence Engine)
- Engineering Memory (from Engineering Memory)

### Produced Decisions

- Lifecycle stage
- Adapted recommendations
- Next stage prediction
