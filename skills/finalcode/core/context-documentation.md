# Context Documentation

## Purpose

Standardize terminology used in context-aware certification. Every certification report must use consistent terminology across all sections to avoid confusion and maintain professionalism.

## Terminology Standard

### Engineering Context

The complete set of engineering characteristics that describe how a project is built and operated. Includes architecture, deployment, runtime, and infrastructure.

### Repository Context

The complete set of non-engineering characteristics that describe the repository's purpose and environment. Includes project type, intent, visibility, and commercial classification.

### Certification Profile

The named set of rules, gates, and thresholds that determine certification requirements for a specific project type.

### Repository Intent

The inferred purpose of the repository (commercial product, internal tool, learning project, etc.).

### Applied Rules

Rules from the Rule Registry that were evaluated during this certification.

### Skipped Rules

Rules from the Rule Registry that were skipped due to project context.

### Context Risks

Uncertainties or concerns about the repository classification or profile selection.

### Certification Logic

The reasoning chain that led from repository classification to the final certification verdict.

### Health Breakdown

Multi-dimensional health score broken down by dimension with dimension-specific weights.

### Roadmap

Prioritized recommendations adapted to the project context.

## Report Section Standardization

### Engineering Context Section

Must include:
- Detected Project Type
- Architecture
- Deployment Model
- Technology Stack
- Repository Intent
- Certification Profile
- Engineering Context summary
- Confidence
- Context Risks
- Engineering Assumptions

### Profile Section

Must include:
- Active certification profile name
- Profile description
- Mandatory gates for this profile
- Optional gates for this profile
- Ignored gates for this profile
- Certification thresholds

### Rule Applicability Section

Must include:
- Total rules in registry
- Rules applied
- Rules skipped (with reasons)
- Optional rules applied
- Context dependencies

### Health Score Section

Must include:
- Overall health score
- Per-dimension scores
- Per-dimension weights
- Dimension descriptions
- Certification score

## Deprecated Terminology

The following terms must not be used in certification reports:

- "Universal Certification" (use "Default Certification Profile")
- "Static Analysis" as a blanket term (use specific detection source)
- "Best Practices" without context (use "Recommended for [project type]")

## Integration

Context Documentation standards apply to all certification reports generated after v4.4.0. Previous report formats remain valid for backward compatibility but new reports must follow the standardized terminology.
