# FinalCode Capability Optimization

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Evaluates capability usefulness, overlap, effectiveness, reliability, and execution cost |
| Execution Stage | ANALYSIS |
| Loaded By | Continuous Improvement, Learning Engine |
| Dependencies | Capability Health, Decision History |
| Outputs | Capability optimization recommendations |
| Consumers | Capability Registry, User |
| Applies To | All engineering operations |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| capabilityHealth | object | Yes | Capability Health |
| decisionHistory | array | Yes | Decision History |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| optimizationRecommendations | array | Optimization recommendations |
| capabilityUsefulness | object | Capability usefulness scores |
| capabilityOverlap | object | Capability overlap analysis |
| capabilityEffectiveness | object | Capability effectiveness scores |
| capabilityReliability | object | Capability reliability scores |
| capabilityCost | object | Capability execution costs |

### Preconditions

- Capability health must be measured
- Decision history must be available

### Postconditions

- Capabilities are evaluated
- Optimizations are recommended
- Changes are tracked

## Purpose

Evaluate capability usefulness, overlap, effectiveness, reliability, and execution cost. Recommend retain, improve, merge, or deprecate. Always explain why.

**Why this matters:** Not all capabilities are equally useful. Optimizing capability usage improves engineering efficiency.

## Optimization Actions

| Action | Description |
|--------|-------------|
| Retain | Keep capability as-is |
| Improve | Enhance capability |
| Merge | Combine with similar capability |
| Deprecate | Mark as deprecated |

## Optimization Output

```
CAPABILITY OPTIMIZATION
==================================================
Capabilities Analyzed: 42

Optimization Recommendations:
  1. Retain: engineering-review
     Reason: High usage, high success rate
     Confidence: 95%

  2. Improve: documentation-workflow
     Reason: Low verification success
     Confidence: 85%

  3. Merge: performance-audit + performance-optimization
     Reason: Overlapping functionality
     Confidence: 80%

  4. Deprecate: old-analysis-engine
     Reason: Replaced by engineering-review
     Confidence: 98%

Capability Scores:
  Usefulness: 85%
  Overlap: 5%
  Effectiveness: 90%
  Reliability: 92%
  Cost: 15 minutes average

Optimization Status: ✅ Active
==================================================
```

## Architecture Explainability

### Responsibilities

- Evaluate capabilities
- Identify overlap
- Calculate effectiveness
- Recommend actions

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Capability evaluation
- Optimization recommendation
- Action recommendation

### Consumed Decisions

- Capability Health (from Capability Health)
- Decision History (from Decision History)

### Produced Decisions

- Optimization recommendations
- Capability scores
- Action recommendations
