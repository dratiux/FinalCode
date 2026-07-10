# FinalCode Framework Profiles

## Execution Metadata

| Field | Value |
|-------|-------|
| Purpose | Defines framework-specific rules, best practices, and detection logic |
| Execution Stage | DETECTION, ANALYSIS |
| Loaded By | Certification Engine, Rule Registry |
| Dependencies | Rule Registry |
| Outputs | Framework detection, framework-specific rules, best practices |
| Consumers | Decision Engine, Report Engine |
| Applies To | Framework-specific audits |

Framework profiles provide modular framework support. Each profile defines framework-specific rules, best practices, documentation, and report improvements. Profiles are loaded dynamically when a framework is detected.

## Profile Schema

Every profile must have:

| Field | Type | Required | Description |
|---|---|---|---|
| `profileId` | string | Yes | Unique identifier (e.g., `PROFILE-REACT`) |
| `name` | string | Yes | Human-readable name |
| `version` | string | Yes | Semantic version |
| `framework` | string | Yes | Framework identifier |
| `detection` | object | Yes | How to detect this framework |
| `rules` | array | Yes | Framework-specific rules |
| `bestPractices` | array | Yes | Framework best practices |
| `commonIssues` | array | Yes | Common issues to check |
| `documentation` | string | Yes | Framework documentation URL |
| `reportSections` | array | No | Additional report sections |
| `configuration` | object | No | Framework-specific configuration |

## Detection

The `detection` object defines how to identify the framework:

```json
{
  "files": ["package.json"],
  "dependencies": ["react", "react-dom"],
  "devDependencies": ["@types/react"],
  "configFiles": ["next.config.js", "vite.config.ts"],
  "sourcePatterns": ["**/*.tsx", "**/*.jsx"],
  "entryPatterns": ["src/App.tsx", "src/index.tsx"]
}
```

## Built-in Profiles

### React (`PROFILE-REACT`)

```json
{
  "profileId": "PROFILE-REACT",
  "name": "React",
  "version": "1.0.0",
  "framework": "react",
  "detection": {
    "files": ["package.json"],
    "dependencies": ["react", "react-dom"],
    "configFiles": ["next.config.js", "vite.config.ts", "craco.config.js"]
  },
  "rules": [
    "RULE-REACT-001: Rules of Hooks",
    "RULE-REACT-002: Key Prop in Lists",
    "RULE-REACT-003: Memo for Expensive Components",
    "RULE-REACT-004: Avoid Inline Styles",
    "RULE-REACT-005: Use Error Boundaries"
  ],
  "bestPractices": [
    "Use functional components with hooks",
    "Use TypeScript for type safety",
    "Use React.memo for expensive components",
    "Use useCallback for stable function references",
    "Use useMemo for expensive computations",
    "Follow Rules of Hooks",
    "Use Error Boundaries for error handling"
  ],
  "commonIssues": [
    "Missing dependency arrays in useEffect",
    "Stale closures in event handlers",
    "Unnecessary re-renders",
    "Missing key props in lists",
    "Direct DOM manipulation"
  ],
  "documentation": "https://reactjs.org"
}
```

### Next.js (`PROFILE-NEXTJS`)

```json
{
  "profileId": "PROFILE-NEXTJS",
  "name": "Next.js",
  "version": "1.0.0",
  "framework": "next.js",
  "detection": {
    "files": ["package.json"],
    "dependencies": ["next"],
    "configFiles": ["next.config.js", "next.config.mjs", "next.config.ts"]
  },
  "rules": [
    "RULE-NEXT-001: Use App Router (not Pages Router)",
    "RULE-NEXT-002: Server Components by Default",
    "RULE-NEXT-003: Client Components When Needed",
    "RULE-NEXT-004: Use Next.js Image Component",
    "RULE-NEXT-005: Use Next.js Link Component",
    "RULE-NEXT-006: Proper Metadata API Usage"
  ],
  "bestPractices": [
    "Use App Router for new projects",
    "Use Server Components by default",
    "Use Client Components only when needed",
    "Use Next.js Image for optimization",
    "Use Next.js Link for navigation",
    "Use Metadata API for SEO",
    "Use Server Actions for mutations"
  ],
  "commonIssues": [
    "Using Pages Router in new projects",
    "Client Components where Server Components work",
    "Missing image optimization",
    "Incorrect link usage",
    "Missing metadata"
  ],
  "documentation": "https://nextjs.org/docs"
}
```

### Vue (`PROFILE-VUE`)

```json
{
  "profileId": "PROFILE-VUE",
  "name": "Vue",
  "version": "1.0.0",
  "framework": "vue",
  "detection": {
    "files": ["package.json"],
    "dependencies": ["vue"],
    "configFiles": ["vue.config.js", "vite.config.ts"]
  },
  "rules": [
    "RULE-VUE-001: Use Composition API",
    "RULE-VUE-002: Use ref/reactive for Reactivity",
    "RULE-VUE-003: Use computed for Derived State",
    "RULE-VUE-004: Use watch/watchEffect for Side Effects",
    "RULE-VUE-005: Use provide/inject for Dependency Injection"
  ],
  "bestPractices": [
    "Use Composition API for new projects",
    "Use TypeScript with Vue",
    "Use Single File Components",
    "Use computed for derived state",
    "Use watch for side effects",
    "Use provide/inject for dependency injection"
  ],
  "commonIssues": [
    "Using Options API in new projects",
    "Missing reactivity in templates",
    "Incorrect watch usage",
    "Missing key in v-for",
    "Direct state mutation"
  ],
  "documentation": "https://vuejs.org/guide"
}
```

### Angular (`PROFILE-ANGULAR`)

```json
{
  "profileId": "PROFILE-ANGULAR",
  "name": "Angular",
  "version": "1.0.0",
  "framework": "angular",
  "detection": {
    "files": ["package.json", "angular.json"],
    "dependencies": ["@angular/core"],
    "configFiles": ["angular.json", "tsconfig.json"]
  },
  "rules": [
    "RULE-NG-001: Use Standalone Components",
    "RULE-NG-002: Use Signals for Reactivity",
    "RULE-NG-003: Use OnPush Change Detection",
    "RULE-NG-004: Use Angular Material for UI",
    "RULE-NG-005: Use HttpClient for API Calls"
  ],
  "bestPractices": [
    "Use standalone components",
    "Use signals for reactivity",
    "Use OnPush change detection",
    "Use Angular Material",
    "Use HttpClient for API calls",
    "Use Angular CLI for code generation"
  ],
  "commonIssues": [
    "Missing OnPush change detection",
    "Incorrect change detection strategy",
    "Missing unsubscribe in ngOnDestroy",
    "Direct DOM manipulation",
    "Missing error handling in HTTP calls"
  ],
  "documentation": "https://angular.io/docs"
}
```

### Electron (`PROFILE-ELECTRON`)

```json
{
  "profileId": "PROFILE-ELECTRON",
  "name": "Electron",
  "version": "1.0.0",
  "framework": "electron",
  "detection": {
    "files": ["package.json"],
    "dependencies": ["electron"],
    "configFiles": ["electron-builder.json", "forge.config.js"]
  },
  "rules": [
    "RULE-ELECTRON-001: Separate Main and Renderer Processes",
    "RULE-ELECTRON-002: Use Context Isolation",
    "RULE-ELECTRON-003: Use Preload Scripts",
    "RULE-ELECTRON-004: Handle IPC Securely",
    "RULE-ELECTRON-005: Auto-Update Configuration"
  ],
  "bestPractices": [
    "Separate main and renderer processes",
    "Enable context isolation",
    "Use preload scripts",
    "Handle IPC securely",
    "Configure auto-updates",
    "Handle application lifecycle"
  ],
  "commonIssues": [
    "Missing context isolation",
    "Direct IPC without preload",
    "Missing security headers",
    "Incorrect nodeIntegration settings",
    "Missing error handling"
  ],
  "documentation": "https://www.electronjs.org/docs"
}
```

### Node.js (`PROFILE-NODEJS`)

```json
{
  "profileId": "PROFILE-NODEJS",
  "name": "Node.js",
  "version": "1.0.0",
  "framework": "node.js",
  "detection": {
    "files": ["package.json"],
    "dependencies": [],
    "configFiles": ["tsconfig.json", "nodemon.json"]
  },
  "rules": [
    "RULE-NODE-001: Use Async/Await",
    "RULE-NODE-002: Handle Promise Rejections",
    "RULE-NODE-003: Use Environment Variables",
    "RULE-NODE-004: Validate Input",
    "RULE-NODE-005: Use Proper Error Classes"
  ],
  "bestPractices": [
    "Use async/await for asynchronous code",
    "Handle promise rejections",
    "Use environment variables",
    "Validate input",
    "Use proper error classes",
    "Use connection pooling"
  ],
  "commonIssues": [
    "Unhandled promise rejections",
    "Missing error handling",
    "Hardcoded configuration",
    "Missing input validation",
    "SQL injection vulnerabilities"
  ],
  "documentation": "https://nodejs.org/en/docs"
}
```

### Express (`PROFILE-EXPRESS`)

```json
{
  "profileId": "PROFILE-EXPRESS",
  "name": "Express",
  "version": "1.0.0",
  "framework": "express",
  "detection": {
    "files": ["package.json"],
    "dependencies": ["express"],
    "configFiles": []
  },
  "rules": [
    "RULE-EXPRESS-001: Use Middleware for Cross-Cutting Concerns",
    "RULE-EXPRESS-002: Use Error-Handling Middleware",
    "RULE-EXPRESS-003: Validate Request Bodies",
    "RULE-EXPRESS-004: Use Helmet for Security Headers",
    "RULE-EXPRESS-005: Use Rate Limiting"
  ],
  "bestPractices": [
    "Use middleware for cross-cutting concerns",
    "Use error-handling middleware",
    "Validate request bodies",
    "Use Helmet for security headers",
    "Use rate limiting",
    "Use CORS properly"
  ],
  "commonIssues": [
    "Missing error handling",
    "Missing security headers",
    "Missing rate limiting",
    "Missing input validation",
    "Incorrect CORS configuration"
  ],
  "documentation": "https://expressjs.com/en/guide"
}
```

### Fastify (`PROFILE-FASTIFY`)

```json
{
  "profileId": "PROFILE-FASTIFY",
  "name": "Fastify",
  "version": "1.0.0",
  "framework": "fastify",
  "detection": {
    "files": ["package.json"],
    "dependencies": ["fastify"],
    "configFiles": []
  },
  "rules": [
    "RULE-FASTIFY-001: Use Schema Validation",
    "RULE-FASTIFY-002: Use Fastify Plugins",
    "RULE-FASTIFY-003: Use Serialization",
    "RULE-FASTIFY-004: Use Error Handling",
    "RULE-FASTIFY-005: Use Logging"
  ],
  "bestPractices": [
    "Use schema validation",
    "Use Fastify plugins",
    "Use serialization",
    "Use error handling",
    "Use logging",
    "Use TypeScript"
  ],
  "commonIssues": [
    "Missing schema validation",
    "Incorrect plugin usage",
    "Missing error handling",
    "Missing logging",
    "Incorrect serialization"
  ],
  "documentation": "https://www.fastify.io/docs"
}
```

### NestJS (`PROFILE-NESTJS`)

```json
{
  "profileId": "PROFILE-NESTJS",
  "name": "NestJS",
  "version": "1.0.0",
  "framework": "nestjs",
  "detection": {
    "files": ["package.json"],
    "dependencies": ["@nestjs/core"],
    "configFiles": ["nest-cli.json"]
  },
  "rules": [
    "RULE-NEST-001: Use Modules for Organization",
    "RULE-NEST-002: Use Dependency Injection",
    "RULE-NEST-003: Use Guards for Authorization",
    "RULE-NEST-004: Use Interceptors for Cross-Cutting Concerns",
    "RULE-NEST-005: Use Pipes for Validation"
  ],
  "bestPractices": [
    "Use modules for organization",
    "Use dependency injection",
    "Use guards for authorization",
    "Use interceptors for cross-cutting concerns",
    "Use pipes for validation",
    "Use filters for error handling"
  ],
  "commonIssues": [
    "Missing module organization",
    "Incorrect dependency injection",
    "Missing guards",
    "Missing interceptors",
    "Missing pipes"
  ],
  "documentation": "https://docs.nestjs.com"
}
```

### Cloudflare Workers (`PROFILE-CF-WORKERS`)

```json
{
  "profileId": "PROFILE-CF-WORKERS",
  "name": "Cloudflare Workers",
  "version": "1.0.0",
  "framework": "cloudflare-workers",
  "detection": {
    "files": ["package.json"],
    "dependencies": ["wrangler"],
    "configFiles": ["wrangler.toml", "wrangler.json"]
  },
  "rules": [
    "RULE-CF-001: Use Environment Variables",
    "RULE-CF-002: Use KV for Caching",
    "RULE-CF-003: Use Durable Objects for State",
    "RULE-CF-004: Handle Cron Triggers",
    "RULE-CF-005: Use Service Bindings"
  ],
  "bestPractices": [
    "Use environment variables",
    "Use KV for caching",
    "Use Durable Objects for state",
    "Handle cron triggers",
    "Use service bindings",
    "Use Web Standards APIs"
  ],
  "commonIssues": [
    "Missing environment variables",
    "Incorrect KV usage",
    "Missing Durable Objects",
    "Missing cron trigger handling",
    "Incorrect service bindings"
  ],
  "documentation": "https://developers.cloudflare.com/workers"
}
```

### Cloudflare Pages (`PROFILE-CF-PAGES`)

```json
{
  "profileId": "PROFILE-CF-PAGES",
  "name": "Cloudflare Pages",
  "version": "1.0.0",
  "framework": "cloudflare-pages",
  "detection": {
    "files": ["package.json"],
    "dependencies": ["wrangler"],
    "configFiles": ["wrangler.toml"]
  },
  "rules": [
    "RULE-CFP-001: Use Static Assets",
    "RULE-CFP-002: Use Functions for Server-Side Logic",
    "RULE-CFP-003: Use Environment Variables",
    "RULE-CFP-004: Use KV for Caching",
    "RULE-CFP-005: Handle Redirects"
  ],
  "bestPractices": [
    "Use static assets",
    "Use functions for server-side logic",
    "Use environment variables",
    "Use KV for caching",
    "Handle redirects",
    "Use headers for caching"
  ],
  "commonIssues": [
    "Missing static assets",
    "Incorrect function usage",
    "Missing environment variables",
    "Missing KV caching",
    "Missing redirects"
  ],
  "documentation": "https://developers.cloudflare.com/pages"
}
```

### Supabase (`PROFILE-SUPABASE`)

```json
{
  "profileId": "PROFILE-SUPABASE",
  "name": "Supabase",
  "version": "1.0.0",
  "framework": "supabase",
  "detection": {
    "files": ["package.json"],
    "dependencies": ["@supabase/supabase-js"],
    "configFiles": [".env"]
  },
  "rules": [
    "RULE-SUPA-001: Use Row Level Security",
    "RULE-SUPA-002: Use Edge Functions",
    "RULE-SUPA-003: Use Realtime Subscriptions",
    "RULE-SUPA-004: Use Storage for Files",
    "RULE-SUPA-005: Use Auth for Authentication"
  ],
  "bestPractices": [
    "Use Row Level Security",
    "Use Edge Functions for server logic",
    "Use Realtime for live updates",
    "Use Storage for file uploads",
    "Use Auth for authentication",
    "Use Database for data storage"
  ],
  "commonIssues": [
    "Missing Row Level Security",
    "Incorrect Edge Function usage",
    "Missing Realtime subscriptions",
    "Missing Storage configuration",
    "Missing Auth setup"
  ],
  "documentation": "https://supabase.com/docs"
}
```

### Vite (`PROFILE-VITE`)

```json
{
  "profileId": "PROFILE-VITE",
  "name": "Vite",
  "version": "1.0.0",
  "framework": "vite",
  "detection": {
    "files": ["package.json"],
    "dependencies": ["vite"],
    "configFiles": ["vite.config.ts", "vite.config.js"]
  },
  "rules": [
    "RULE-VITE-001: Use ES Modules",
    "RULE-VITE-002: Use Import Aliases",
    "RULE-VITE-003: Use Environment Variables",
    "RULE-VITE-004: Use Plugins",
    "RULE-VITE-005: Use Build Optimization"
  ],
  "bestPractices": [
    "Use ES modules",
    "Use import aliases",
    "Use environment variables",
    "Use plugins for extended functionality",
    "Use build optimization",
    "Use HMR for development"
  ],
  "commonIssues": [
    "Missing ES modules",
    "Incorrect import aliases",
    "Missing environment variables",
    "Missing plugins",
    "Missing build optimization"
  ],
  "documentation": "https://vitejs.dev/guide"
}
```

### Hono (`PROFILE-HONO`)

```json
{
  "profileId": "PROFILE-HONO",
  "name": "Hono",
  "version": "1.0.0",
  "framework": "hono",
  "detection": {
    "files": ["package.json"],
    "dependencies": ["hono"],
    "configFiles": ["wrangler.toml"]
  },
  "rules": [
    "RULE-HONO-001: Use Middleware",
    "RULE-HONO-002: Use Context Properly",
    "RULE-HONO-003: Use Error Handling",
    "RULE-HONO-004: Use CORS",
    "RULE-HONO-005: Use JWT Authentication"
  ],
  "bestPractices": [
    "Use middleware for cross-cutting concerns",
    "Use context properly",
    "Use error handling",
    "Use CORS for cross-origin requests",
    "Use JWT for authentication",
    "Use Web Standards APIs"
  ],
  "commonIssues": [
    "Missing middleware",
    "Incorrect context usage",
    "Missing error handling",
    "Missing CORS",
    "Missing JWT authentication"
  ],
  "documentation": "https://hono.dev/docs"
}
```

## Profile Loading

Profiles are loaded dynamically:

1. Detect project type from `package.json`
2. Match detected dependencies against profiles
3. Load matching profiles
4. Merge profile rules with Core rules
5. Apply profile best practices
6. Use profile documentation for recommendations

## Profile Merging

When multiple profiles are loaded:

1. Load profiles in dependency order
2. Merge rules (no duplicates)
3. Merge best practices
4. Merge common issues
5. Merge report sections (with ordering)
6. Merge configuration (with precedence)

## Custom Profiles

Users can create custom profiles:

1. Create `profile.json` in `.opencode/profiles/`
2. Follow the profile schema
3. Reference in configuration (`profiles: ["custom"]`)
4. Custom profiles extend Core, not replace it

## Validation

Profiles are validated before loading:

1. No duplicate `profileId` values
2. All `detection` rules are valid
3. All `rules` references exist in Rule Registry
4. All `reportSections` have valid ordering
5. No circular dependencies

If validation fails, the profile is skipped with a warning.
