# Decision Confidence

## Purpose

Every engineering decision includes a confidence assessment. Confidence reflects how certain FinalCode is about the correctness of its classification and the validity of its evidence.

## Confidence Levels

### Very High

The classification is unambiguous. Multiple independent evidence sources agree on the conclusion. No alternative interpretation is reasonably supported.

### High

The classification is well-supported. Strong evidence is available from at least one source. Alternative interpretations exist but are weakly supported.

### Medium

The classification is plausible but not definitive. Evidence is available but incomplete. Alternative interpretations have similar support.

### Low

The classification is uncertain. Evidence is weak, contradictory, or indirect. Alternative interpretations are equally or more likely.

### Unknown

Insufficient evidence to make any determination. Human verification is required.

## Decision Confidence Fields

Every classified decision must report:

- **Decision ID**: Unique identifier for this decision
- **Observation**: What was observed
- **Classification**: One of the eight decision classifications
- **Decision Confidence**: Very High, High, Medium, Low, or Unknown
- **Evidence Strength**: Direct, Strong, Indirect, Weak, Assumption, or Not Verified
- **Alternative Interpretations**: List of other possible classifications with their confidence levels
- **Missing Evidence**: What evidence would be needed to increase confidence
- **Human Verification Required**: Boolean — whether a human should review this decision

## Confidence Adjustment Factors

Confidence may be adjusted based on:

- **Evidence Quality**: Direct evidence increases confidence; assumptions decrease it
- **Evidence Quantity**: Multiple independent sources increase confidence
- **Evidence Consistency**: Contradictory evidence decreases confidence
- **Historical Validation**: Previously validated decisions maintain or increase confidence
- **Context Familiarity**: Well-understood project types yield higher confidence
- **Pattern Recognition**: Well-documented patterns yield higher confidence

## Integration

Decision Confidence is calculated by the Engineering Decision Engine for every classified observation. It is included in every finding and reported in the certification report.
