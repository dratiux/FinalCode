# FinalCode — Detailed Quality Gate Checklists

Full criteria for each of the 13 Quality Gates. The SKILL.md table is a condensed summary; consult this file when you need the exhaustive checklist for a gate.

## Configurable Gates (v1.8.0)

The 13 gates are the fixed core, but which ones run and whether they block certification is configurable:

- **Enabled / Disabled:** a project configuration (`finalcode.config.json` or `.finalcode/config.json`) may set `enabledGates`, `disabledGates`, and `requiredGates`. Disabling a gate in `requiredGates` (or the Security Gate when mandated by the profile/policy) is rejected — the gate runs and the override is recorded in the report.
- **Profiles:** built-in profiles (production, enterprise, open source, library, cli, browser-extension, desktop, web-application, api, mobile, mvp) adjust which gates are emphasized or non-applicable. A CLI project, for example, treats UI Consistency and Accessibility as non-applicable rather than failing.
- **Plugins:** framework plugins may append additional named gates (e.g. `react-best-practices`). These run after the 13 core gates and use the same Finding Format; they never disable a core gate or alter the verdict.

The gate criteria below are unchanged. Configuration only selects scope and blocking behavior.

## 1. Architecture Gate
- Architecture consistency
- Separation of concerns
- Modularity
- Dependency direction
- Circular dependencies
- Scalability
- Maintainability

## 2. Code Quality Gate
- Naming consistency
- Readability
- Code smells
- Complexity
- SOLID
- DRY
- KISS
- YAGNI
- Duplicate logic
- Overengineering

## 3. Dead Code Gate
- Unused files
- Unused folders
- Unused imports
- Unused exports
- Unused variables
- Unreachable code
- Unused utilities
- Unused hooks
- Unused components
- Abandoned features

Only report findings with high confidence.

## 4. Dependency Gate
- Unused packages
- Duplicate packages
- Version conflicts
- Deprecated packages
- Unnecessary dependencies

## 5. Type Safety Gate
- Unsafe `any`
- Ignored errors
- `ts-ignore`
- Unsafe casting
- Nullable risks
- Incorrect typing

## 6. Error Handling Gate
- Unhandled promises
- Silent failures
- Missing error handling
- Retry strategy
- Failure recovery

## 7. Testing Gate
- Unit tests
- Integration tests
- End-to-end tests
- Coverage
- Critical path coverage
- Missing tests
- Flaky tests
- Test configuration
- Test documentation

Possible status: PASS, PASS WITH WARNINGS, FAIL. Testing Gate participates in certification.

## 8. Performance Gate
- Bundle size
- Lazy loading
- Rendering efficiency
- Memoization
- Expensive computations
- Network efficiency
- Caching
- Repeated work

Only recommend optimizations with measurable benefit.

## 9. Security Gate

**See `references/security-gate.md` for the full Security Gate 2.0 checklist** (authentication, authorization, session management, input validation, secrets management, dependency security, API security, frontend security, backend security, deployment security, cloud configuration, rate limiting, security headers, environment configuration). This replaces the earlier condensed security checklist — always audit against the full v2.0 list.

## 10. Accessibility Gate
- Semantic HTML
- ARIA
- Keyboard navigation
- Focus management
- Labels
- Contrast
- Screen reader compatibility

## 11. UI Consistency Gate
Inspect the UI as a product designer and frontend engineer would.

- Spacing consistency
- Visual rhythm
- Alignment
- Symmetry
- Grid consistency
- Typography hierarchy
- Padding
- Margins
- Border radius
- Shadows
- Icon sizing
- Color consistency
- Button consistency
- Card consistency
- Interaction states: hover, active, disabled, loading
- Empty states
- Error states
- Responsive behavior: desktop, tablet, mobile, ultra-wide
- Dark mode consistency

Never report subjective design opinions. Only report objective usability or consistency problems.

## 12. Documentation Gate
- README
- Installation
- Configuration
- Developer setup
- Scripts
- Environment documentation
- Architecture documentation

## 13. GitHub Readiness Gate
Review the repository as if approving a production Pull Request.

- Repository cleanliness
- Maintainability
- Extensibility
- Naming consistency
- Commit readiness
- Release readiness
