# FinalCode False Positive Reduction Engine

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Reduces false positives by validating findings against known patterns |
| Execution Stage | DECISION (post-classification) |
| Loaded By | Decision Engine |
| Dependencies | Knowledge Base, Finding Classification |
| Outputs | Validated findings, false positive indicators, confidence adjustments |
| Consumers | Decision Engine, Report Engine |
| Applies To | All audits |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| finding | object | Yes | Decision Engine |
| frameworkKnowledge | object | Yes | Knowledge Base |
| contextFactors | array | Yes | Context Collection |
| evidenceChain | object | Yes | Evidence collection |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| validatedFinding | object | Finding after false positive check |
| isFalsePositive | boolean | Whether finding is likely false positive |
| confidenceAdjustment | number | Adjustment to confidence score |
| alternativeExplanation | string | Known legitimate pattern explanation |

### Preconditions

- Finding must be classified
- Framework knowledge must be loaded
- Context factors must be identified

### Postconditions

- False positives are filtered or flagged
- Confidence scores are adjusted
- Alternative explanations are provided

## False Positive Detection

### Detection Steps

1. **Pattern Matching:** Check finding against known patterns
2. **Context Analysis:** Analyze framework and project context
3. **Evidence Evaluation:** Evaluate evidence quality
4. **Alternative Check:** Check for alternative explanations
5. **Confidence Adjustment:** Adjust confidence based on findings

### Pattern Categories

| Category | Description | Action |
|----------|-------------|--------|
| Known Legitimate | Recognized legitimate pattern | Filter as false positive |
| Context Dependent | Valid in certain contexts | Flag for manual review |
| Framework Specific | Valid in specific framework | Adjust confidence |
| Evidence Dependent | Requires specific evidence | Evaluate evidence quality |

## False Positive Patterns

### Common False Positives

#### Pattern: Type Assertions in TypeScript

**Trigger:** `as Type` assertions detected
**Context:** Third-party library integration, DOM manipulation
**Analysis:**
- Type assertions may be necessary for external data
- DOM manipulation requires type assertions
- Library integration often needs type assertions
**Verdict:** False positive if justified by context
**Confidence Adjustment:** -10%

#### Pattern: Any Type Usage

**Trigger:** `any` type detected
**Context:** Migration, dynamic data, legacy code
**Analysis:**
- Migration in progress may temporarily use `any`
- Dynamic data may require `any`
- Legacy code may have `any`
**Verdict:** Needs verification
**Confidence Adjustment:** -5%

#### Pattern: Console.log in Development

**Trigger:** console.log statements detected
**Context:** Development environment, debug code
**Analysis:**
- Development requires logging
- Debug code is temporary
- May be gated by NODE_ENV
**Verdict:** False positive if development-only
**Confidence Adjustment:** -15%

#### Pattern: Empty Catch Blocks

**Trigger:** Empty catch blocks detected
**Context:** Error intentionally ignored
**Analysis:**
- Some errors are intentionally ignored
- Optional chaining polyfill requires empty catch
- Error boundaries handle errors elsewhere
**Verdict:** Needs verification
**Confidence Adjustment:** -10%

#### Pattern: Unused Imports

**Trigger:** Unused imports detected
**Context:** Type-only imports, re-exports
**Analysis:**
- Type-only imports may appear unused
- Re-exports are used elsewhere
- Barrel files aggregate exports
**Verdict:** False positive if type-only or re-export
**Confidence Adjustment:** -10%

#### Pattern: Magic Numbers

**Trigger:** Magic numbers detected
**Context:** Well-known constants, mathematical formulas
**Analysis:**
- Math constants (PI, E) are well-known
- Status codes are standardized
- Configuration values may be numeric
**Verdict:** False positive if well-known
**Confidence Adjustment:** -5%

## Context-Aware Analysis

### Analysis Pipeline

```
Finding Detected
       │
       ▼
Context Collection
       │
       ├── Framework Knowledge
       ├── Project Type
       ├── Environment
       └── Build System
       │
       ▼
Pattern Matching
       │
       ├── Known Legitimate Patterns
       ├── Framework-Specific Patterns
       └── Project-Specific Patterns
       │
       ▼
Evidence Evaluation
       │
       ├── Evidence Quality
       ├── Evidence Completeness
       └── Evidence Consistency
       │
       ▼
False Positive Check
       │
       ├── Pattern Match Found?
       ├── Context Justified?
       └── Evidence Sufficient?
       │
       ▼
Finding Decision
       │
       ├── Confirmed Finding
       ├── False Positive (Filter)
       ├── Needs Review (Flag)
       └── Low Confidence (Adjust)
```

### Context Factors

| Factor | Impact on Analysis |
|--------|-------------------|
| Framework version | May affect pattern validity |
| Project type | Affects expected patterns |
| Environment | Affects security/performance expectations |
| Build system | Affects configuration expectations |
| Testing strategy | Affects coverage expectations |

## Confidence Adjustment

### Adjustment Rules

| Condition | Adjustment |
|-----------|-----------|
| Known legitimate pattern | -10% to -20% |
| Context-dependent pattern | -5% to -10% |
| Weak evidence | -10% to -15% |
| Single source | -5% to -10% |
| Strong evidence | +0% to +5% |
| Multiple sources | +0% to +5% |

### Confidence Bounds

- Minimum confidence: 10%
- Maximum confidence: 95%
- False positive threshold: 30%
- Manual review threshold: 50%

## Integration with Decision Engine

The False Positive Reduction Engine integrates into the Decision Engine pipeline:

```
Evidence Collection
       │
       ▼
Rule Matching
       │
       ▼
Risk Analysis
       │
       ▼
Classification
       │
       ▼
Severity Calibration
       │
       ▼
False Positive Reduction ◄── Knowledge Base
       │
       ▼
Release Impact Assessment
       │
       ▼
Finding Emission
```

## Architecture Explainability

### Responsibilities

- Detect false positives
- Adjust confidence scores
- Provide alternative explanations
- Filter or flag findings

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating scores (Health Score)

### Owned Decisions

- False positive detection
- Confidence adjustment
- Alternative explanation generation
- Finding filtering/flagging

### Consumed Decisions

- Framework knowledge (from Knowledge Base)
- Context factors (from Context Collection)
- Evidence chains (from Evidence Collection)
- Finding classification (from Decision Engine)

### Produced Decisions

- Validated findings
- False positive indicators
- Confidence adjustments
- Alternative explanations
