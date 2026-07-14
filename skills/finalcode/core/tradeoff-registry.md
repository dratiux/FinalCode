# Trade-off Registry

## Purpose

Standardize acceptable engineering trade-offs. Not every deviation from best practice is a defect — some are conscious compromises that are valid in specific contexts.

## Trade-off Entry Format

Every trade-off in the registry includes:

- **Trade-off ID**: Unique identifier (e.g., TO-WEBSITE-001)
- **Name**: Human-readable name
- **Description**: What the trade-off entails
- **Context**: Which project types this trade-off applies to
- **Benefits**: Why teams choose this trade-off
- **Risks**: What risks the trade-off introduces
- **Recommended Upgrade Path**: How to address this trade-off when the context changes

## Registered Trade-offs

### TO-WEBSITE-001: mailto Contact Form

Acceptable for brand websites and portfolios that do not require a backend service.

| Field | Value |
|---|---|
| Context | Brand Website, Portfolio, Landing Page |
| Benefits | No backend required, zero server cost, simple implementation |
| Risks | No delivery guarantee, spam vulnerability, no tracking |
| Recommended Upgrade Path | Replace with form service (Formspree, Netlify Forms) or implement API endpoint |

### TO-STATIC-001: No Automated Tests

Acceptable for prototypes, portfolios, and brand websites where correctness is visually verifiable.

| Field | Value |
|---|---|
| Context | Portfolio, Brand Website, Landing Page, Prototype |
| Benefits | Faster development, lower overhead |
| Risks | Regression risk, no quality safety net |
| Recommended Upgrade Path | Add smoke tests, then unit tests for critical paths |

### TO-API-001: No Rate Limiting

Acceptable for internal tools and low-traffic internal APIs.

| Field | Value |
|---|---|
| Context | Internal Tool, Prototype, Experimental |
| Benefits | Simpler implementation, lower latency |
| Risks | Abuse vulnerability, resource exhaustion |
| Recommended Upgrade Path | Implement API gateway with rate limiting |

### TO-SEC-001: No Backend Logging

Acceptable for static websites and client-only applications.

| Field | Value |
|---|---|
| Context | Brand Website, Portfolio, Landing Page, Static Website |
| Benefits | No server maintenance, lower cost |
| Risks | No observability, no debugging capability |
| Recommended Upgrade Path | Add client-side analytics, consider serverless logging |

### TO-SEC-002: Security Headers via Hosting Platform

Acceptable when the hosting platform provides adequate defaults.

| Field | Value |
|---|---|
| Context | Static Website, Brand Website, Portfolio |
| Benefits | Automatic security, no configuration overhead |
| Risks | Limited customization, platform-dependent |
| Recommended Upgrade Path | Explicitly configure security headers in project |

### TO-PERF-001: No Image Optimization

Acceptable for text-heavy documentation sites and internal tools.

| Field | Value |
|---|---|
| Context | Documentation Site, Internal Tool, CLI |
| Benefits | Simpler build, faster development |
| Risks | Larger bundle size, slower page loads |
| Recommended Upgrade Path | Add image optimization to build pipeline |

### TO-DEPLOY-001: Manual Deployment

Acceptable for prototypes, learning projects, and single-developer projects.

| Context | Prototype, Learning Project, Experimental, Portfolio |
| Benefits | No CI/CD configuration overhead |
| Risks | Human error, no audit trail, no rollback automation |
| Recommended Upgrade Path | Set up basic CI/CD pipeline |

### TO-ARCH-001: Monolithic Frontend

Acceptable for small teams, internal tools, and projects with limited scope.

| Context | Internal Tool, Prototype, Brand Website, Small Team Projects |
| Benefits | Simpler architecture, faster development, easier debugging |
| Risks | Scalability challenges, team coordination overhead |
| Recommended Upgrade Path | Modularize when team grows or requirements expand |

### TO-TEST-001: No Integration Tests

Acceptable when unit tests provide adequate coverage for the project type.

| Context | Portfolio, Brand Website, Library, CLI |
| Benefits | Faster test execution, simpler test setup |
| Risks | Missing integration-level bugs |
| Recommended Upgrade Path | Add integration tests for critical workflows |

### TO-OPS-001: No Monitoring

Acceptable for static websites, prototypes, and projects without production traffic.

| Context | Static Website, Prototype, Learning Project, Experimental |
| Benefits | Lower operational cost, simpler infrastructure |
| Risks | No visibility into production issues |
| Recommended Upgrade Path | Add basic uptime monitoring, then application monitoring |

## Trade-off Evaluation

When evaluating whether an observation is a registered trade-off:

1. Check the Trade-off Registry for a matching pattern
2. Verify the project context matches the trade-off context
3. Document the trade-off in the report as an Accepted Trade-off
4. Include the recommended upgrade path for future reference

## Integration

The Trade-off Registry is consulted by the Engineering Decision Engine during observation classification. Matched trade-offs are classified as Accepted Trade-offs instead of defects.
