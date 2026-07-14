# Project Classification Engine

## Purpose

Automatically classify every repository before any analysis begins. Certification requirements must be based on project context, not universal rules.

## Classification Dimensions

Every repository must be classified across all of the following dimensions before analysis:

### Project Type

Detect the primary project type from an enumerated set:

- Brand Website
- Portfolio
- Landing Page
- Documentation Site
- SaaS
- Enterprise Platform
- REST API
- GraphQL API
- Browser Extension
- CLI
- SDK
- Library
- Design System
- UI Component Library
- Monorepo
- Microservices
- Desktop Application
- Mobile Backend
- Internal Tool
- Static Website
- Experimental Project
- Open Source Framework
- Unknown

### Architecture Style

- Monolithic
- Modular Monolith
- Microservices
- Serverless
- Event-Driven
- Layered
- Hexagonal
- Clean Architecture
- Unknown

### Technology Stack

Detect primary languages, frameworks, runtime, build tools, package managers, databases, and infrastructure.

### Runtime Environment

- Browser
- Node.js
- Deno
- Bun
- Cloudflare Workers
- Electron
- Mobile
- Desktop Native
- Unknown

### Deployment Target

- Static Hosting
- Vercel
- Netlify
- Cloudflare Pages
- Cloudflare Workers
- AWS
- GCP
- Azure
- Docker
- Kubernetes
- Self-Hosted
- Mobile App Store
- Browser Extension Store
- npm Registry
- None Detected

### Repository Purpose

- Production Service
- Internal Tool
- Open Source Library
- Learning Project
- Prototype
- Portfolio
- Brand Website
- Experimental
- Enterprise Platform
- Framework
- SDK
- Unknown

### Engineering Maturity

- Prototype
- Early Development
- Active Development
- Production
- Mature
- Legacy

### Visibility

- Public Repository
- Private Repository

### Commercial Classification

- Commercial Project
- Internal Project
- Open Source Project
- Personal Project

## Classification Output

Every classification must include:

- **Type**: One value from the project type enumeration
- **Confidence**: Percentage (0-100) reflecting certainty of the classification
- **Evidence**: Specific files, configurations, or patterns that support the classification
- **Detection Reasoning**: Explanation of why this classification was chosen
- **Alternative Candidates**: Other possible classifications that were considered and why they were rejected

## Detection Methods

Classification uses the following evidence sources, in order of reliability:

1. **Explicit Configuration**: `finalcode.config.json`, `package.json` metadata, project description
2. **File Structure**: Presence of characteristic files and directories (e.g., `pages/`, `app/`, `src/`, `api/`)
3. **Framework Detection**: Known framework configurations (Next.js, React, Vue, Express, etc.)
4. **Dependency Analysis**: Key dependencies that indicate project type (e.g., `express` for API)
5. **Entry Point Analysis**: Main entry files and their exports
6. **Build Configuration**: Build tools and output targets
7. **Documentation Analysis**: README, contributing guide, issue templates
8. **Deployment Configuration**: CI/CD config, Docker files, hosting configs

## Classification Rules

- Never guess. If evidence is insufficient, classify as Unknown and explain why.
- When multiple classifications are possible, select the most specific one.
- When confidence is below 70%, report the classification as tentative.
- Alternative candidates must always be documented.
- Every classification decision must be explainable.

## Integration

The Project Classification Engine runs during Phase 0 (Repository Discovery) and its output feeds the Certification Profile selection, Adaptive Rule Engine, and all context-aware features.
