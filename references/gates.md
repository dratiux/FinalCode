# FinalCode — Detailed Quality Gate Checklists

Full criteria for each of the 12 Quality Gates. The SKILL.md table is a condensed summary; consult this file when you need the exhaustive checklist for a gate.

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

## 7. Performance Gate
- Bundle size
- Lazy loading
- Rendering efficiency
- Memoization
- Expensive computations
- Network efficiency
- Caching
- Repeated work

Only recommend optimizations with measurable benefit.

## 8. Security Gate

**See `references/security-gate.md` for the full Security Gate 2.0 checklist** (authentication, authorization, input validation, secrets management, dependency security, storage security, API security, frontend security, backend security, cloud & deployment). This replaces the earlier condensed security checklist — always audit against the full v2.0 list.

## 9. Accessibility Gate
- Semantic HTML
- ARIA
- Keyboard navigation
- Focus management
- Labels
- Contrast
- Screen reader compatibility

## 10. UI Consistency Gate
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

## 11. Documentation Gate
- README
- Installation
- Configuration
- Developer setup
- Scripts
- Environment documentation
- Architecture documentation

## 12. GitHub Readiness Gate
Review the repository as if approving a production Pull Request.

- Repository cleanliness
- Maintainability
- Extensibility
- Naming consistency
- Commit readiness
- Release readiness
