# Supported Platforms

This document defines the support policy for FinalCode.

## Recommended Environments

The following stack is recommended and tested:

| Framework | Support Level | Status | Notes |
|-----------|---------------|--------|-------|
| OpenCode | Fully Supported | Available | Primary development and testing platform |
| React | Fully Supported | Available | Production ready |
| TypeScript | Fully Supported | Available | Recommended language |
| Vite | Fully Supported | Available | Default build system |
| Node.js LTS | Fully Supported | Available | Recommended runtime |
| Cloudflare Workers | Fully Supported | Available | Tested deployment target |

## Fully Supported Platforms

Platforms with complete validation and production-grade testing:

| Framework | Support Level | Status | Notes |
|-----------|---------------|--------|-------|
| OpenCode | Fully Supported | Available | Primary target |
| React | Fully Supported | Available | Production ready |
| Next.js | Fully Supported | Available | App Router and Pages Router |
| Electron | Fully Supported | Available | Desktop applications |
| Vite | Fully Supported | Available | Default build system |
| TypeScript | Fully Supported | Available | Recommended |
| JavaScript | Fully Supported | Available | Supported |
| Node.js | Fully Supported | Available | LTS recommended |
| Hono | Fully Supported | Available | Tested |

## Supported Platforms

Platforms that work with standard project structures:

| Framework | Support Level | Status | Notes |
|-----------|---------------|--------|-------|
| Express | Supported | Available | Standard projects |
| Cloudflare Workers | Supported | Available | Tested |
| Vue | Supported | Available | Limited testing |
| Angular | Supported | Available | Limited testing |
| Fastify | Supported | Available | Limited testing |
| NestJS | Supported | Available | Limited testing |
| Supabase | Supported | Available | Limited testing |

## Experimental Platforms

Platforms with limited validation. May require adjustments:

| Framework | Support Level | Status | Notes |
|-----------|---------------|--------|-------|
| Nuxt | Experimental | Available | Limited testing |
| Svelte | Experimental | Available | Limited testing |
| Astro | Experimental | Available | Limited testing |
| Cloudflare Pages | Experimental | Available | Limited testing |

## Not Yet Tested

Platforms without validation:

| Framework | Support Level | Status | Notes |
|-----------|---------------|--------|-------|
| Laravel | Not Tested | Available | Unknown compatibility |
| Django | Not Tested | Available | Unknown compatibility |
| ASP.NET | Not Tested | Available | Unknown compatibility |
| Spring | Not Tested | Available | Unknown compatibility |

## Support Scope

FinalCode guarantees support only for OpenCode-based workflows.

Support for other frameworks depends on:

- Project structure and available tooling
- Whether the AI model can access and analyze the codebase
- Framework-specific conventions and patterns

OpenCode remains the primary development and testing platform. All quality gates, security checks, and report generation are optimized for OpenCode environments.

## Plugin Architecture

FinalCode v2.0.0 introduces a Plugin SDK for extending framework support. Plugins can register:

- Detection Rules
- Report Sections
- Framework Knowledge
- Engineering Recommendations
- Validation Steps
- Configuration Options

Plugins never modify Core logic directly. See [source/plugins/sdk.md](source/plugins/sdk.md) for the complete plugin specification.

## Framework Profiles

FinalCode v2.0.0 includes framework profiles for 14 frameworks:

| Framework | Profile ID | Status |
|-----------|------------|--------|
| React | PROFILE-REACT | Available |
| Next.js | PROFILE-NEXTJS | Available |
| Vue | PROFILE-VUE | Available |
| Angular | PROFILE-ANGULAR | Available |
| Electron | PROFILE-ELECTRON | Available |
| Node.js | PROFILE-NODEJS | Available |
| Express | PROFILE-EXPRESS | Available |
| Fastify | PROFILE-FASTIFY | Available |
| NestJS | PROFILE-NESTJS | Available |
| Cloudflare Workers | PROFILE-CF-WORKERS | Available |
| Cloudflare Pages | PROFILE-CF-PAGES | Available |
| Supabase | PROFILE-SUPABASE | Available |
| Vite | PROFILE-VITE | Available |
| Hono | PROFILE-HONO | Available |

Each profile contributes:

- Additional rules
- Best practices
- Framework documentation
- Report improvements

Without changing Core behavior. See [source/plugins/profiles.md](source/plugins/profiles.md) for the complete profile specification.

## Certification Policies

FinalCode v2.0.0 includes 8 built-in certification policies:

| Policy | Description |
|--------|-------------|
| POLICY-DEFAULT | Default behavior (identical to v1.9.0) |
| POLICY-PRODUCTION | Strict policy for production systems |
| POLICY-ENTERPRISE | Enterprise-grade policy |
| POLICY-STARTUP | Relaxed policy for rapid development |
| POLICY-OPENSOURCE | Policy for open source projects |
| POLICY-EDUCATIONAL | Policy for learning projects |
| POLICY-MINIMAL | Bare minimum checks |
| POLICY-STRICT | Maximum strictness |

Each policy defines:

- Blocking policy
- Enabled gates
- Required evidence
- Minimum quality score
- Report sections

The default policy remains identical to v1.9. See [source/core/policy-engine.md](source/core/policy-engine.md) for the complete policy schema.

## Version History

| Version | Stability | Notes |
|---------|-----------|-------|
| 2.0.1 | Stable | Maintenance release: documentation consistency, terminology fixes, SSOT validation, architecture validation, cross-reference validation |
| 2.0.0 | Stable | Extensible engineering platform: Plugin SDK, rule registry, framework profiles, certification profiles, policy engine, rule versioning, extension marketplace foundation, self validation, performance optimization, architecture documentation |
| 1.9.0 | Stable | Modular engineering architecture: orchestration layer, 7 reference documents, explainability engine, decision pipeline, single source of decision rules, traceable certification, explainable health score, report engine, engineering knowledge base, consistency validation engine |
| 1.8.2 | Stable | Decision engine & report precision: release blocker engine, warning analyzer, health score explanation, grade justification, finding impact analysis, improvement delta, certification confidence model, engineering priority matrix, release decision summary, report consistency |
| 1.8.1 | Stable | Report quality & decision support: executive dashboard, health score formula, confidence model 2.0, risk matrix, effort estimation, smart finding classification, certification checklist, trend summary, runtime capability disclosure, execution metrics, standardized navigation, quality grade, better recommendation engine |
| 1.8.0 | Stable | Configurable engineering platform: policy engine, project configuration, profiles, baseline, ignore, incremental inspection, PR analysis, machine-readable reports, plugins, universal compatibility, performance improvements, portability, engineering policy summary |
| 1.7.0 | Stable | Engineering intelligence: decision analysis, repository evolution, smart classification, deployment intelligence, automatic verification pipeline, intelligent repair stop, executive decision summary, engineering roadmap, release readiness predictor, human override awareness |
| 1.6.2 | Stable | Documentation correction, project ownership clarified |
| 1.6.1 | Stable | Documentation and compatibility update |
| 1.6.0 | Stable | Engineering intelligence and analytics |
| 1.5.0 | Stable | Engineering documentation and release assistant |
| 1.4.2 | Stable | Single source of truth architecture |
| 1.4.1 | Stable | Command integration |
| 1.4.0 | Stable | Precision, reliability, and refactoring |
| 1.3.0 | Stable | Initial public release |
