# FinalCode Repository Intelligence Engine

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Understands the repository before any analysis begins |
| Execution Stage | INITIALIZATION (Phase 0) |
| Loaded By | Certification Engine |
| Dependencies | Framework Profiles, Configuration System |
| Outputs | Repository Profile shared across all engines |
| Consumers | All engines, All gates, Decision Engine, Report Engine |
| Applies To | All audits |

## Reference Contract

### Inputs

| Input | Type | Required | Source |
|-------|------|----------|--------|
| repositoryPath | string | Yes | User input |
| configuration | object | No | Configuration System |

### Outputs

| Output | Type | Description |
|--------|------|-------------|
| repositoryProfile | object | Complete repository understanding |
| riskIndicators | array | Engineering risk signals |
| complexityAssessment | object | Repository complexity metrics |
| engineeringSignals | object | Coding style, conventions, patterns |

### Preconditions

- Repository must be accessible
- Configuration must be loaded (if present)

### Postconditions

- Repository Profile is generated
- All engines can consume the profile
- Analysis is context-aware

## Purpose

The Repository Intelligence Engine is the first engine to execute in every audit. Its purpose is to build a comprehensive understanding of the repository before any rules are evaluated.

**Why this matters:** Analysis without repository context produces findings that may be irrelevant, misleading, or incorrect. By understanding the repository first, FinalCode can:

- Prioritize findings based on actual project characteristics
- Avoid false positives caused by misunderstood patterns
- Provide context-aware recommendations
- Detect root causes across the entire codebase

## Repository Profile Model

Every audit generates a Repository Profile that is shared across all engines:

```
Repository Profile
├── Identity
│   ├── Repository Type (application, library, API, worker, monorepo)
│   ├── Primary Purpose
│   └── Target Audience
├── Architecture
│   ├── Architecture Style (monolithic, modular, microservices, serverless)
│   ├── Module Structure
│   ├── Dependency Graph
│   └── Layer Boundaries
├── Technology Stack
│   ├── Frameworks
│   ├── Languages
│   ├── Runtime Environment
│   ├── Package Manager
│   ├── Build System
│   └── Test Framework
├── Workspace
│   ├── Workspace Layout (single, monorepo, polyrepo)
│   ├── Monorepo Detection
│   ├── Package Structure
│   └── Shared Dependencies
├── Infrastructure
│   ├── CI/CD Platform
│   ├── Deployment Targets
│   ├── Container Configuration
│   └── Cloud Services
├── Engineering Practices
│   ├── Test Strategy
│   ├── Documentation Coverage
│   ├── Coding Style
│   ├── Naming Conventions
│   └── Code Organization
├── Complexity
│   ├── Repository Size
│   ├── Module Count
│   ├── Dependency Count
│   ├── File Types
│   └── Complexity Score
├── Risk Indicators
│   ├── Security Risks
│   ├── Maintenance Risks
│   ├── Dependency Risks
│   ├── Architecture Risks
│   └── Scalability Risks
└── Engineering Signals
    ├── Code Quality Signals
    ├── Testing Signals
    ├── Documentation Signals
    ├── Performance Signals
    └── Security Signals
```

## Detection Methods

### Repository Type Detection

| Signal | Detection Method | Confidence |
|--------|-----------------|-----------|
| Application | package.json has "start" script, src/ directory | High |
| Library | package.json has "main"/"exports", no start script | High |
| API | src/routes/, src/api/, server.ts | High |
| Worker | wrangler.toml, worker.ts | High |
| Monorepo | workspaces in package.json, packages/ directory | High |

### Architecture Style Detection

| Signal | Detection Method | Confidence |
|--------|-----------------|-----------|
| Monolithic | Single src/ directory, no clear module boundaries | Medium |
| Modular | Clear module boundaries, separate directories | High |
| Microservices | Multiple service directories, docker-compose | High |
| Serverless | api/ directory, serverless functions | High |

### Technology Stack Detection

| Signal | Detection Method | Confidence |
|--------|-----------------|-----------|
| Framework | package.json dependencies, config files | High |
| Language | File extensions, tsconfig.json, package.json | High |
| Runtime | package.json engines, .node-version, Dockerfile | High |
| Build System | Build scripts, config files | High |

### Workspace Detection

| Signal | Detection Method | Confidence |
|--------|-----------------|-----------|
| Single | No workspaces in package.json | High |
| Monorepo | workspaces in package.json, lerna.json, nx.json | High |
| Polyrepo | Multiple package.json files, no workspace config | Medium |

## Risk Indicators

### Security Risks

| Indicator | Detection Method | Impact |
|-----------|-----------------|--------|
| Hardcoded secrets | Pattern matching in source | Critical |
| Vulnerable dependencies | npm audit, dependency analysis | High |
| Missing security headers | Configuration analysis | Medium |
| Insecure defaults | Configuration analysis | Medium |

### Maintenance Risks

| Indicator | Detection Method | Impact |
|-----------|-----------------|--------|
| Outdated dependencies | Version comparison | Medium |
| Deprecated packages | Package status check | Medium |
| Large codebase | File count, line count | Low |
| Complex architecture | Module count, dependency depth | Medium |

### Dependency Risks

| Indicator | Detection Method | Impact |
|-----------|-----------------|--------|
| Deep dependency tree | Dependency analysis | Medium |
| Circular dependencies | Dependency graph analysis | High |
| Unused dependencies | Import analysis | Low |
| Multiple versions | Dependency analysis | Medium |

### Architecture Risks

| Indicator | Detection Method | Impact |
|-----------|-----------------|--------|
| Tight coupling | Module dependency analysis | High |
| God objects | File size, complexity analysis | Medium |
| Missing abstractions | Code pattern analysis | Medium |
| Layer violations | Import analysis | High |

## Complexity Assessment

### Size Metrics

| Metric | Measurement | Threshold |
|--------|-------------|-----------|
| File count | Total files | Small: <50, Medium: 50-200, Large: >200 |
| Line count | Total lines of code | Small: <5K, Medium: 5K-50K, Large: >50K |
| Module count | Number of modules/packages | Small: <5, Medium: 5-20, Large: >20 |
| Dependency count | Direct dependencies | Small: <10, Medium: 10-30, Large: >30 |

### Complexity Score

Calculate complexity based on:

1. Repository size (30%)
2. Architecture complexity (25%)
3. Dependency complexity (20%)
4. Technology stack complexity (15%)
5. Workspace complexity (10%)

## Engineering Signals

### Code Quality Signals

| Signal | Detection Method | Meaning |
|--------|-----------------|---------|
| Linting configured | .eslintrc, .prettierrc | Code quality awareness |
| Type checking | tsconfig.json, jsconfig.json | Type safety focus |
| Formatting configured | .prettierrc, .editorconfig | Code consistency |
| Pre-commit hooks | husky, lint-staged | Quality gates |

### Testing Signals

| Signal | Detection Method | Meaning |
|--------|-----------------|---------|
| Test framework | jest.config, vitest.config | Testing awareness |
| Test files present | *.test.*, *.spec.* | Testing culture |
| Coverage configured | coverage config | Coverage focus |
| CI testing | CI config with test step | Testing enforcement |

### Documentation Signals

| Signal | Detection Method | Meaning |
|--------|-----------------|---------|
| README present | README.md | Basic documentation |
| API documentation | docs/, api-docs | API documentation |
| JSDoc comments | JSDoc patterns | Code documentation |
| CHANGELOG present | CHANGELOG.md | Release documentation |

### Performance Signals

| Signal | Detection Method | Meaning |
|--------|-----------------|---------|
| Bundle analysis | webpack-bundle-analyzer | Bundle awareness |
| Lighthouse config | lighthouse config | Performance focus |
| Performance budgets | Performance config | Performance limits |
| Caching configured | Cache headers, service worker | Caching strategy |

### Security Signals

| Signal | Detection Method | Meaning |
|--------|-----------------|---------|
| Security headers | CSP, HSTS headers | Security awareness |
| HTTPS enforced | Configuration | Transport security |
| Input validation | Validation patterns | Injection prevention |
| Authentication | Auth patterns | Access control |

## Architecture Explainability

### Responsibilities

- Understand repository before analysis
- Generate Repository Profile
- Detect risk indicators
- Assess complexity
- Identify engineering signals

### Non-Responsibilities

- Making findings (Decision Engine)
- Classifying findings (Finding Classification)
- Generating reports (Report Engine)
- Calculating scores (Health Score)

### Owned Decisions

- Repository type detection
- Architecture style detection
- Technology stack detection
- Workspace detection
- Risk indicator detection
- Complexity assessment
- Engineering signal detection

### Consumed Decisions

- Framework detection (from Framework Profiles)
- Configuration (from Configuration System)

### Produced Decisions

- Repository Profile
- Risk indicators
- Complexity assessment
- Engineering signals

## Integration with Other Engines

The Repository Intelligence Engine produces a Repository Profile that is consumed by:

- **Decision Engine** — Context-aware analysis
- **Rule Registry** — Framework-specific rules
- **Report Engine** — Repository profile section
- **Health Score** — Complexity-adjusted scoring
- **Certification Engine** — Profile-aware certification

## Loading Strategy

1. **Phase 0 (Repository Intelligence):** Generate Repository Profile
2. **Phase 1 (Project Understanding):** Load profile into all engines
3. **Phase 2 (Analysis):** Use profile for context-aware analysis
4. **Phase 3 (Decision):** Use profile for trade-off evaluation
