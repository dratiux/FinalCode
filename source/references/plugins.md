# FinalCode — Plugin Architecture

FinalCode v1.8.0 introduces an extension system so teams can teach FinalCode about their specific frameworks without modifying the core skill. Plugins contribute additional checks and recommendations; they never change core FinalCode behavior, gates, or the certification engine.

---

## Location

Plugins live in a `plugins/` directory. FinalCode discovers them from (in order):

1. `.finalcode/plugins/` (project-local)
2. A path declared in config: `"pluginPaths": ["./tools/finalcode-plugins"]`

Each plugin is a folder with a manifest:

```
plugins/
└── react/
    ├── plugin.json        # manifest
    └── checks.md          # framework-specific checks (loaded when plugin active)
```

---

## Manifest Schema (`plugin.json`)

```json
{
  "name": "react",
  "version": "1.0.0",
  "description": "React-specific checks and recommendations",
  "frameworks": ["react", "react-dom"],
  "detects": ["src/**/*.tsx", "package.json:react"],
  "contributes": {
    "gates": ["react-best-practices"],
    "repair": ["react-hooks"],
    "recommendations": true
  }
}
```

| Field | Meaning |
|---|---|
| `name` | Unique plugin identifier |
| `frameworks` | Framework names this plugin applies to |
| `detects` | Glob/package patterns used for automatic activation |
| `contributes.gates` | Additional named checks appended to the audit |
| `contributes.repair` | Framework-specific repair logic hints |
| `contributes.recommendations` | Whether the plugin may emit recommendations |

---

## Activation

- If Git/config or framework detection matches a plugin's `detects`, the plugin is **active** for that run.
- Active plugins are listed in the report's **Engineering Policy** section under Enabled Rules.
- A plugin may never disable a core gate, downgrade a Critical/Security finding, or alter the certification verdict logic. If a plugin attempts any of these, FinalCode ignores that contribution and records a policy violation in the report.

---

## What a Plugin May Contribute

1. **Additional Quality Gates** — named framework checks (e.g. `react-best-practices`, `nextjs-routes`, `electron-security`). These run after the 13 core gates and are reported in the same Finding Format.
2. **Framework-specific checks** — deeper inspection of framework idioms.
3. **Framework-specific recommendations** — non-blocking suggestions.
4. **Framework-specific repair logic** — hints Repair Mode may use, still bound by the Repair Rules (smallest safe change, no breaking changes).

---

## Built-in Plugin Examples

FinalCode ships guidance (not enforced code) for common ecosystems. Each is activated automatically when its framework is detected:

| Plugin | Detected When | Contributes |
|---|---|---|
| `react` | React in dependencies | Hooks rules, key props, effect deps |
| `nextjs` | Next.js in dependencies | Route handlers, RSC boundaries, image config |
| `vue` | Vue in dependencies | SFC structure, reactivity warnings |
| `angular` | Angular in dependencies | Module structure, change detection |
| `electron` | Electron in dependencies | Preload/context isolation, nodeIntegration |
| `nodejs` | Node runtime detected | Stream handling, unhandled rejections |
| `cloudflare-workers` | Wrangler / worker config detected | Edge constraints, bindings |
| `supabase` | Supabase client detected | RLS policies, anon key usage |
| `express` | Express detected | Error middleware, body parsing |
| `fastify` | Fastify detected | Schema validation, hooks |

---

## Writing a Plugin (Example: React)

`plugins/react/plugin.json`:

```json
{
  "name": "react",
  "version": "1.0.0",
  "description": "React-specific checks",
  "frameworks": ["react"],
  "detects": ["package.json:react", "src/**/*.tsx"],
  "contributes": { "gates": ["react-best-practices"], "recommendations": true }
}
```

`plugins/react/checks.md` (loaded when active):

```markdown
# React Best-Practices Gate (plugin: react)

- Warn on missing `key` props in lists (UI Consistency / Correctness)
- Flag `useEffect` with missing dependency arrays (Correctness)
- Flag direct state mutation (React state immutability)
- Recommend memoization only where measurable re-render cost exists

Findings follow the standard FinalCode Finding Format and never block certification
unless they are Confirmed Defects / Security Vulnerabilities per core rules.
```

---

## Constraints

- Plugins are additive only.
- A plugin that fails to load is skipped with a warning; the core audit continues.
- Plugin checks that conflict with a core gate defer to the core gate.
- Plugins cannot read or write outside the repository and `.finalcode/` without user approval.
