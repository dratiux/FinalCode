# Repository Intent Detection

## Purpose

Infer the repository's intended purpose to improve certification accuracy and recommendation relevance. Intent determines which certification requirements are appropriate and which recommendations are actionable.

## Detected Intents

### Commercial Product

A project built for commercial distribution or revenue generation.

Indicators:
- License file (MIT, Apache, GPL, commercial)
- Pricing or subscription references in documentation
- Commercial dependencies or services
- Branded assets and marketing content

### Production Service

A project that serves production traffic for an organization.

Indicators:
- CI/CD pipeline with production deployment
- Monitoring and alerting configuration
- Production environment configuration
- Incident response documentation
- SLA or uptime commitments

### Internal Tool

A project used within an organization but not publicly distributed.

Indicators:
- No public marketing or branding
- Minimal documentation beyond usage
- No CI/CD for public distribution
- References to internal systems or APIs

### Learning Project

A project created for learning or educational purposes.

Indicators:
- Tutorial-style code with extensive comments
- Simplified architecture
- Multiple experiments or explorations
- References to courses or tutorials

### Prototype

A project created to validate an idea or demonstrate a concept.

Indicators:
- Minimal testing
- Hardcoded values or mock data
- Incomplete features
- No deployment configuration
- Short commit history

### Portfolio

A project created to demonstrate skills for professional purposes.

Indicators:
- Well-documented with professional README
- Deployed to public hosting
- Complete feature set
- Showcase-quality code

### Brand Website

A project that serves as a public-facing website for a brand or individual.

Indicators:
- Marketing content
- SEO configuration
- Sitemap and metadata
- Public hosting configuration

### Open Source

A publicly available project that accepts contributions.

Indicators:
- CONTRIBUTING.md
- Issue and PR templates
- Code of conduct
- Community guidelines
- CI/CD for community contributions

### Enterprise Platform

A large-scale platform designed for enterprise use.

Indicators:
- Multi-tenant architecture
- Enterprise security features
- SSO/OAuth configuration
- Audit logging
- Compliance documentation

### Framework

A project that provides a framework for building applications.

Indicators:
- Plugin or extension system
- Template or scaffolding commands
- Configuration-driven architecture
- Public API surface

### Library

A reusable software library distributed through a package manager.

Indicators:
- Package.json with main/exports field
- npm/pypi/crates.io configuration
- API documentation
- Versioning strategy
- Public API boundary

### SDK

A software development kit for a specific platform or service.

Indicators:
- Client library for an API
- Authentication handling
- Platform-specific examples
- Multiple language support or bindings

## Intent Detection Process

1. **Evidence Collection**: Gather evidence from repository structure, configuration, documentation, and code
2. **Pattern Matching**: Match evidence against known intent patterns
3. **Confidence Calculation**: Calculate confidence based on evidence strength and quantity
4. **Alternative Evaluation**: Consider and evaluate alternative intents
5. **Confirmation**: Request explicit confirmation if confidence is below 70%

## Output

Every detected intent must include:

- **Intent**: One value from the defined intent enumeration
- **Evidence**: Specific files, configurations, or code that support the intent
- **Confidence**: Percentage (0-100)
- **Explanation**: Narrative explanation of why this intent was determined
- **Certification Profile Mapping**: The recommended certification profile for this intent

## Certification Profile Mapping

| Intent | Recommended Profile |
|---|---|
| Commercial Product | Enterprise |
| Production Service | SaaS |
| Internal Tool | Internal Tool |
| Learning Project | Experimental |
| Prototype | Experimental |
| Portfolio | Portfolio |
| Brand Website | Brand Website |
| Open Source | Open Source |
| Enterprise Platform | Enterprise |
| Framework | Library |
| Library | Library |
| SDK | Library |

## Integration

Repository Intent Detection runs during Phase 0 (Repository Discovery) alongside the Project Classification Engine. The detected intent is used by the Certification Profile selection, Adaptive Rule Engine, False Positive Reduction v2, and Context-Aware Roadmap.
