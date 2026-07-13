# FinalCode Documentation Refactoring

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Standardizes every capability document with consistent structure and required sections |
| Execution Stage | ANALYSIS |
| Loaded By | Repository Consistency Audit |
| Dependencies | Capability Registry |
| Outputs | Standardized documentation with consistent format |
| Consumers | Repository Consistency Audit, User |
| Applies To | All capability documents |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| capabilityDocuments | array | Yes | Capability Registry |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| standardizedDocs | array | Standardized capability documents |
| consistencyScore | number | Documentation consistency score |
| issues | array | Documentation issues |

### Preconditions

- Capability documents must exist
- Standard structure must be defined

### Postconditions

- Documentation is standardized
- Consistency is measured
- Issues are identified

## Purpose

Standardize every capability document. Every capability document must follow one structure with required sections: Purpose, When Used, Inputs, Outputs, Dependencies, Verification, Approval Requirements, Risk, Examples, Related Capabilities. This creates consistency across the repository.

**Why this matters:** Inconsistent documentation is confusing. Standardization ensures all capabilities are documented the same way.

## Required Sections

| Section | Description |
|---------|-------------|
| Purpose | What the capability does |
| When Used | When to use this capability |
| Inputs | Required inputs |
| Outputs | Produced outputs |
| Dependencies | Required dependencies |
| Verification | Verification requirements |
| Approval Requirements | Approval requirements |
| Risk | Risk level |
| Examples | Usage examples |
| Related Capabilities | Related capabilities |

## Documentation Output

```
DOCUMENTATION REFACTORING
==================================================
Documents Analyzed: 42

Standardization Results:
  Standardized: 38
  Non-Standardized: 4
  Consistency Score: 90%

Non-Standardized Documents:
  1. old-analysis-engine.md
     Issue: Missing "When Used" section
     Fix: Add "When Used" section

  2. legacy-security-check.md
     Issue: Missing "Examples" section
     Fix: Add "Examples" section

  3. experimental-feature.md
     Issue: Missing "Related Capabilities" section
     Fix: Add "Related Capabilities" section

  4. beta-capability.md
     Issue: Missing "Approval Requirements" section
     Fix: Add "Approval Requirements" section

Refactoring Status: ✅ Complete
==================================================
```

## Architecture Explainability

### Responsibilities

- Standardize documentation
- Measure consistency
- Identify issues
- Generate fix recommendations

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating health scores (Health Score)

### Owned Decisions

- Documentation standardization
- Consistency measurement
- Issue identification

### Consumed Decisions

- Capability Documents (from Capability Registry)

### Produced Decisions

- Standardized documentation
- Consistency score
- Issues and fixes
