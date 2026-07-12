# FinalCode Engineering Knowledge Base

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Provides context-aware engineering intelligence for analysis |
| Execution Stage | CONTEXT_COLLECTION |
| Loaded By | Decision Engine, Certification Engine |
| Dependencies | Framework Profiles |
| Outputs | Framework knowledge, best practices, known issues, anti-patterns |
| Consumers | Decision Engine, Explainability Engine, False Positive Reduction |
| Applies To | All audits |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| detectedFrameworks | array | Yes | Framework Profiles |
| filePatterns | array | Yes | Repository structure |
| projectConfig | object | Yes | Configuration System |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| frameworkKnowledge | object | Framework-specific best practices and known issues |
| contextFactors | array | Factors that affect analysis interpretation |
| falsePositiveIndicators | array | Patterns that indicate likely false positives |
| alternativeExplanations | array | Known legitimate patterns that resemble issues |

### Preconditions

- Frameworks must be detected
- Repository structure must be analyzed
- Configuration must be loaded

### Postconditions

- Context-aware analysis is available
- False positive reduction is enabled
- Findings are interpreted with framework knowledge

## Knowledge Base Structure

The Knowledge Base contains framework-specific engineering intelligence organized by framework:

```
Knowledge Base
├── Framework Knowledge
│   ├── Best Practices
│   ├── Known Anti-Patterns
│   ├── Common False Positives
│   ├── Idiomatic Patterns
│   └── Version-Specific Considerations
├── Context Factors
│   ├── Project Type (library, application, monorepo)
│   ├── Environment (browser, server, edge, hybrid)
│   ├── Build System
│   └── Testing Strategy
└── Cross-Framework Patterns
    ├── Shared Anti-Patterns
    ├── Shared Best Practices
    └── Integration Concerns
```

## Loading Strategy

1. **Phase 0 (Repository Discovery):** Load framework detection results
2. **Phase 1 (Project Understanding):** Load applicable framework knowledge
3. **Phase 2 (Analysis):** Apply context-aware analysis using knowledge
4. **Phase 3 (Decision):** Use knowledge for false positive reduction

## Context-Aware Analysis

Every finding must be analyzed in context:

### Analysis Steps

1. **Detection:** Raw observation collected
2. **Context Collection:** Framework knowledge loaded
3. **Pattern Matching:** Observation matched against known patterns
4. **False Positive Check:** Known legitimate patterns checked
5. **Engineering Analysis:** Context-adjusted interpretation
6. **Finding Generation:** Only confirmed findings emitted

### Context Factors

| Factor | Impact on Analysis |
|--------|-------------------|
| Framework version | May affect whether pattern is valid |
| Project type | Affects expected patterns |
| Environment | Affects security and performance expectations |
| Testing strategy | Affects coverage expectations |
| Build system | Affects configuration expectations |

## Knowledge Documents

Framework-specific knowledge is stored in separate documents:

| Document | Framework |
|----------|-----------|
| `knowledge-base-react.md` | React |
| `knowledge-base-nextjs.md` | Next.js |
| `knowledge-base-nodejs.md` | Node.js |
| `knowledge-base-typescript.md` | TypeScript |
| `knowledge-base-vue.md` | Vue |
| `knowledge-base-svelte.md` | Svelte |

## Architecture Explainability

### Responsibilities

- Provide framework-specific knowledge
- Enable context-aware analysis
- Support false positive reduction
- Supply alternative explanations

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating scores (Health Score)

### Owned Decisions

- Framework knowledge loading
- Context factor identification
- False positive indicator detection
- Alternative explanation generation

### Consumed Decisions

- Framework detection (from Framework Profiles)
- Repository structure (from Repository Discovery)
- Project configuration (from Configuration System)

### Produced Decisions

- Context-aware analysis results
- False positive indicators
- Alternative explanations
