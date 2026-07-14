# Engineering Context Report

## Purpose

Every certification report begins with an Engineering Context section that explains how the repository was classified and which certification profile was selected. This ensures readers understand why certain rules were applied and others were skipped.

## Context Section Format

The Engineering Context section must appear at the beginning of every certification report, before the Quality Gate Summary.

### Required Fields

- **Detected Project Type**: The classification from the Project Classification Engine
- **Architecture**: Detected architecture style
- **Deployment Model**: Detected deployment target
- **Technology Stack**: Primary languages, frameworks, runtime
- **Repository Intent**: Inferred repository purpose
- **Certification Profile**: The selected certification profile
- **Engineering Context**: Summary of the engineering environment
- **Confidence**: Overall confidence in the classification (0-100%)
- **Context Risks**: Any risks or uncertainties in the classification
- **Engineering Assumptions**: Assumptions made during classification

### Example

```
Engineering Context
├── Detected Project Type: SaaS
├── Architecture: Modular Monolith
├── Deployment Model: AWS (Docker)
├── Technology Stack: TypeScript, Next.js, PostgreSQL
├── Repository Intent: Commercial Product
├── Certification Profile: SaaS
├── Confidence: 92%
├── Context Risks
│   ├── No explicit deployment configuration found
│   └── Test framework detected but no test files found
└── Engineering Assumptions
    ├── Project is in active development (frequent commits)
    └── Public-facing web application (Next.js with SSR)
```

## Context Risks

Context risks describe uncertainties or concerns about the classification:

- Ambiguous project type indicators
- Conflicting evidence from different detection methods
- Missing configuration files
- Unexpected file structures
- Low-confidence classifications

## Engineering Assumptions

Engineering assumptions are documented inferences made during classification:

- Assumptions about the deployment environment
- Assumptions about the intended audience
- Assumptions about the development lifecycle
- Assumptions about team structure

## Integration

The Engineering Context Report is generated after classification and before rule evaluation. It is included in the certification report and also stored in Context Memory for future analyses.
