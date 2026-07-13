# Support Policy

## Support Levels

| Level | Meaning |
|-------|---------|
| **Fully Supported** | Tested and verified. Issues are resolved in patch releases. |
| **Supported** | Works with standard project structures. Issues are resolved when feasible. |
| **Experimental** | Limited testing. May require adjustments. Issues are addressed on best-effort basis. |
| **Not Tested** | No validation performed. Support depends on project structure. |

## Framework Compatibility

| Framework | Support Level | Notes |
|-----------|---------------|-------|
| React | Fully Supported | Production ready |
| Next.js | Fully Supported | App Router and Pages Router |
| Electron | Fully Supported | Desktop applications |
| Vite | Fully Supported | Default build system |
| TypeScript | Fully Supported | Recommended |
| JavaScript | Fully Supported | Supported |
| Node.js | Fully Supported | LTS recommended |
| Hono | Fully Supported | Tested |
| Express | Supported | Standard projects |
| Cloudflare Workers | Supported | Tested |
| Vue | Supported | Limited testing |
| Angular | Supported | Limited testing |
| Fastify | Supported | Limited testing |
| NestJS | Supported | Limited testing |
| Supabase | Supported | Limited testing |
| Nuxt | Experimental | Limited testing |
| Svelte | Experimental | Limited testing |
| Astro | Experimental | Limited testing |
| Cloudflare Pages | Experimental | Limited testing |
| Laravel | Not Tested | Unknown compatibility |
| Django | Not Tested | Unknown compatibility |
| ASP.NET | Not Tested | Unknown compatibility |
| Spring | Not Tested | Unknown compatibility |

## Compatibility Guarantees

- FinalCode follows the Skills ecosystem standard
- Quality gates, security checks, and report generation work with any Skills-compatible agent
- Framework support depends on project structure, tooling availability, and AI model access
- Refer to the [Skills documentation](https://skills.sh) for the latest supported environments

## Plugin Architecture

FinalCode v2.0.0+ includes a Plugin SDK for extending framework support. Plugins can register detection rules, report sections, framework knowledge, recommendations, validation steps, and configuration options. Plugins never modify core logic. See [skills/finalcode/plugins/sdk.md](skills/finalcode/plugins/sdk.md).

## Framework Profiles

FinalCode includes profiles for 14 frameworks: React, Next.js, Vue, Angular, Electron, Node.js, Express, Fastify, NestJS, Cloudflare Workers, Cloudflare Pages, Supabase, Vite, Hono. Each profile contributes additional rules and best practices without changing core behavior. See [skills/finalcode/plugins/profiles.md](skills/finalcode/plugins/profiles.md).

## Certification Policies

| Policy | Use Case |
|--------|----------|
| POLICY-DEFAULT | Default behavior |
| POLICY-PRODUCTION | Production systems |
| POLICY-ENTERPRISE | Enterprise environments |
| POLICY-STARTUP | Rapid development |
| POLICY-OPENSOURCE | Open source projects |
| POLICY-EDUCATIONAL | Learning projects |
| POLICY-MINIMAL | Minimum checks |
| POLICY-STRICT | Maximum strictness |

Each policy defines blocking rules, enabled gates, required evidence, minimum quality score, and report sections. See [skills/finalcode/core/policy-engine.md](skills/finalcode/core/policy-engine.md).

## Version History

| Version | Date | Stability | Summary |
|---------|------|-----------|---------|
| 4.1.0 | 2026-07-12 | Stable | Engineering Policy Framework |
| 4.0.0 | 2026-07-12 | Stable | Autonomous Engineering Agent |
| 3.6.0 | 2026-07-12 | Stable | Autonomous Engineering Workflows |
| 3.5.0 | 2026-07-12 | Stable | Continuous Engineering Intelligence |
| 3.4.0 | 2026-07-12 | Stable | Execution Intelligence |
| 3.3.0 | 2026-07-12 | Stable | Engineering Intelligence Edition |
| 3.2.0 | 2026-07-12 | Stable | Engineering Decision Intelligence |
| 3.1.0 | 2026-07-12 | Stable | Benchmark & Regression Validation Framework |
| 3.0.0 | 2026-07-12 | Stable | Analysis Intelligence Engine |
| 2.10.0 | 2026-07-10 | Stable | Cross-Agent Distribution & Documentation Refinement |
| 2.8.0 | 2026-07-10 | Stable | Native skills.sh Distribution |
| 2.7.0 | 2026-07-10 | Stable | Executable Documentation & Extension Contracts |
| 2.6.0 | 2026-07-10 | Stable | Execution Optimization & Knowledge Consolidation |
| 2.5.0 | 2026-07-10 | Stable | Execution Architecture Refinement |
| 2.4.1 | 2026-07-10 | Stable | Release Packaging Validation |
| 2.4.0 | 2026-07-10 | Stable | Release Packaging System |
| 2.3.0 | 2026-07-10 | Stable | Architecture Intelligence |
| 2.2.0 | 2026-07-10 | Stable | Evidence & Analysis Engine |
| 2.1.0 | 2026-07-10 | Stable | Documentation rewrite |
| 2.0.1 | 2026-07-09 | Stable | Documentation consistency |
| 2.0.0 | 2026-07-09 | Stable | Plugin SDK, framework profiles, policy engine |
| 1.9.0 | 2026-07-09 | Stable | Modular architecture, explainability |
| 1.8.2 | 2026-07-09 | Stable | Release blocker engine, confidence model |
| 1.8.1 | 2026-07-08 | Stable | Dashboard, health score formula, risk matrix |
| 1.8.0 | 2026-07-08 | Stable | Policy engine, configuration, profiles |
| 1.7.0 | 2026-07-08 | Stable | Decision intelligence, trend analysis |
| 1.6.2 | 2026-07-08 | Stable | Documentation correction |
| 1.6.1 | 2026-07-08 | Stable | Compatibility documentation |
| 1.6.0 | 2026-07-08 | Stable | Health score, engineering metrics |
| 1.5.0 | 2026-07-08 | Stable | Security gate, testing gate, documentation |
| 1.4.0 | 2026-07-08 | Stable | Repository health, executive summary |
| 1.3.0 | 2026-07-08 | Stable | Plugin architecture, compatibility |
| 1.2.0 | 2026-07-08 | Stable | Operational modes, configuration |
| 1.1.0 | 2026-07-08 | Stable | Quality gates, security gate |
| 1.0.0 | 2026-07-08 | Stable | Initial release |
