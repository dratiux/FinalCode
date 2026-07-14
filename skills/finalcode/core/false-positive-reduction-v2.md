# False Positive Reduction v2

## Purpose

Reduce false positives by incorporating project type, repository intent, framework conventions, architecture, deployment model, and project maturity into the filtering logic. False positive suppression must be transparent and evidence-based.

## Context-Aware Filtering

False positive detection uses the following context dimensions:

### Project Type

Known legitimate patterns that are specific to a project type:

- **Brand Website**: Missing state management, absent authentication
- **Interactive Web App (SaaS/Enterprise)**: Complex state management patterns
- **Landing Page**: Minimal JavaScript, no routing
- **CLI**: No package.json in expected format, binary entry points
- **Library**: Public API exports, no app configuration
- **Static Website**: No build step, flat file structure
- **Monorepo**: Shared configurations, workspace packages

### Repository Intent

Patterns that are legitimate based on repository purpose:

- **Learning Project**: Simplified architecture, minimal testing, tutorial code
- **Prototype**: Hardcoded values, minimal error handling, no tests
- **Internal Tool**: Reduced documentation, minimal CI/CD, basic security
- **Production Service**: Full testing, security hardening, monitoring

### Framework Conventions

Known patterns that are valid within specific frameworks:

- **Next.js**: File-based routing, server components, data fetching patterns
- **React**: Hook dependencies, render patterns, state management
- **Express**: Middleware patterns, error handling conventions
- **Cloudflare Workers**: Request/response patterns, environment bindings

### Architecture

Patterns that are valid for specific architectures:

- **Microservices**: Inter-service communication, shared libraries
- **Serverless**: Function boundaries, cold start handling
- **Monolith**: Centralized data access, shared modules
- **Event-Driven**: Message patterns, event handlers

### Deployment Model

Patterns that are valid for specific deployment targets:

- **Vercel**: Serverless functions, edge configuration
- **Docker**: Container configurations, environment variables
- **Static Hosting**: Build output, asset optimization

### Project Maturity

Patterns that change based on project maturity:

- **Prototype**: Relaxed code organization, minimal documentation
- **Early Development**: Incomplete features, WIP code
- **Production**: Strict conventions, full test coverage

## Suppression Rules

### Mandatory Reporting

Every suppressed finding must include:

- **Original Rule ID**: The rule that would have triggered the finding
- **Original Rule Name**: Human-readable rule name
- **Suppression Reason**: Why the finding was suppressed
- **Suppression Context**: The project context that caused suppression
- **Evidence**: Specific files, patterns, or configurations that justify suppression
- **Confidence**: Confidence in the suppression decision (0-100%)
- **Suppression Category**: ProjectType, Intent, Framework, Architecture, Deployment, Maturity

### Suppression Example

```yaml
original_rule: FC-ARCH-003
original_rule_name: Service layer required
status: Suppressed
suppression_reason: Project type is Static Website with no service layer
suppression_context:
  project_type: Static Website
  architecture: Flat
  intent: Brand Website
evidence:
  - No server-side code detected
  - No API endpoints found
  - No data persistence layer detected
confidence: 98%
suppression_category: ProjectType
```

## Quality Controls

- Suppression confidence must be above 80% for automatic suppression
- Between 60-80%, the finding is downgraded to Informational with suppression reasoning
- Below 60%, the finding is reported normally with a note about potential false positive
- All suppressions are logged in the certification report
- Suppressions are reviewed by the Learning Engine to improve accuracy over time

## Integration

False Positive Reduction v2 extends the existing False Positive Reduction Engine from v3.0.0. The original engine continues to handle known legitimate patterns and framework-specific patterns. v2 adds project type, intent, architecture, deployment, and maturity dimensions.

The combined false positive reduction pipeline:

1. Known legitimate patterns (v3.0.0)
2. Framework-specific patterns (v3.0.0)
3. Project type patterns (v4.4.0)
4. Repository intent patterns (v4.4.0)
5. Architecture patterns (v4.4.0)
6. Deployment patterns (v4.4.0)
7. Maturity patterns (v4.4.0)

All suppressed findings are reported in the Rule Applicability Summary section of the certification report.
