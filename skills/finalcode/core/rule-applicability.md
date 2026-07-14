# Rule Applicability

## Purpose

Every finding must report whether its originating rule was applied or skipped, and why. No silent suppression of rules is allowed.

## Finding Applicability Fields

Every finding must include the following applicability information:

### Applied Rules

When a rule is applied and produces a finding, the finding must report:

- **Rule ID**: The unique identifier of the rule
- **Rule Name**: Human-readable rule name
- **Status**: Applied
- **Certification Profile**: The active profile that caused this rule to apply
- **Context Dependency**: The project context attributes that triggered this rule
- **Confidence**: Confidence in the applicability decision

### Skipped Rules

When a rule is skipped and does NOT produce a finding (because it was context-skipped), the report must still document:

- **Rule ID**: The unique identifier of the rule
- **Rule Name**: Human-readable rule name
- **Status**: Skipped
- **Reason**: Specific explanation of why the rule was skipped
- **Certification Profile**: The active profile that caused this rule to be skipped
- **Context Dependency**: The project context attributes that caused the skip
- **Confidence**: Confidence in the skip decision

### Optional Rules

When a rule is classified as Optional and applied as an engineering recommendation:

- **Rule ID**: The unique identifier of the rule
- **Rule Name**: Human-readable rule name
- **Status**: Optional
- **Reason**: Explanation of why this is optional
- **Certification Profile**: The active profile
- **Context Dependency**: The project context attributes
- **Confidence**: Confidence in the optional classification

## Report Section

The certification report must include a "Rule Applicability Summary" section that lists:

- Total rules in registry
- Total rules applied
- Total rules skipped
- Total optional rules
- List of all skipped rules with reasons
- List of all optional rules with explanations

## Transparency Rules

- Every rule in the Rule Registry must have a documented applicability status in every audit
- No rule may be silently suppressed
- Every skipped rule must include a justification
- Every optional rule must explain why it is optional
- Context dependencies must be specific and evidence-based

## Integration

Rule applicability is determined by the Adaptive Rule Engine after repository classification and profile selection. The Rule Applicability system runs during Phase 2 (Quality Gate Execution) and its output is included in the final certification report.
