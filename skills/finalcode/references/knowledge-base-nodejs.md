# FinalCode Knowledge Base — Node.js

## Framework Detection Signals

| Signal | Confidence |
|--------|-----------|
| `node` in package.json engines | High |
| Server-side JavaScript files | High |
| Express/Fastify/Koa patterns | High |
| `server.js` or `app.js` entry point | Medium |

## Best Practices

### Error Handling

| Practice | Description |
|----------|-------------|
| Async/await | Use async/await over callbacks |
| Error propagation | Properly propagate errors |
| Error types | Use custom error classes |
| Unhandled rejections | Handle unhandled promise rejections |

### Security

| Practice | Description |
|----------|-------------|
| Input validation | Validate all user input |
| Parameterized queries | Prevent SQL injection |
| Rate limiting | Implement rate limiting |
| CORS | Configure CORS properly |

### Performance

| Practice | Description |
|----------|-------------|
| Connection pooling | Reuse database connections |
| Caching | Implement response caching |
| Compression | Enable gzip/brotli |
| Clustering | Use cluster module for multi-core |

### File System

| Practice | Description |
|----------|-------------|
| Streaming | Use streams for large files |
| Path handling | Use path.join for cross-platform |
| Async operations | Use async file operations |
| Cleanup | Properly close file handles |

## Known Anti-Patterns

### Error Handling

| Anti-Pattern | Issue | Fix |
|-------------|-------|-----|
| Swallowing errors | Silent failures | Always handle errors |
| Callback hell | Unmaintainable code | Use async/await |
| Missing error types | Hard to debug | Use custom error classes |
| Unhandled rejections | Process crashes | Add global handler |

### Security

| Anti-Pattern | Issue | Fix |
|-------------|-------|-----|
| SQL injection | Data breach | Use parameterized queries |
| No input validation | Injection attacks | Validate and sanitize |
| Hardcoded secrets | Credential exposure | Use environment variables |
| No rate limiting | DDoS vulnerability | Implement rate limiting |

### Performance

| Anti-Pattern | Issue | Fix |
|-------------|-------|-----|
| Synchronous I/O | Event loop blocking | Use async operations |
| No connection pooling | Connection exhaustion | Implement pooling |
| Missing compression | Large payloads | Enable compression |
| No caching | Redundant computation | Implement caching |

## Common False Positives

### Pattern: Console.log for Logging

**Observation:** console.log statements
**Context:** Development logging, not production
**Verdict:** False positive — logging is necessary for debugging

### Pattern: Process.exit Calls

**Observation:** process.exit() calls
**Context:** Graceful shutdown handlers
**Verdict:** False positive — controlled exit is valid

### Pattern: Dynamic Requires

**Observation:** require() with variables
**Context:** Plugin systems, dynamic loading
**Verdict:** Needs verification — may be intentional

## Idiomatic Patterns

### Express Route Pattern

```javascript
router.get('/api/users/:id', async (req, res, next) => {
  try {
    const user = await UserService.findById(req.params.id);
    if (!user) {
      return res.status(404).json({ error: 'User not found' });
    }
    res.json(user);
  } catch (error) {
    next(error);
  }
});
```

### Error Class Pattern

```javascript
class AppError extends Error {
  constructor(message, statusCode) {
    super(message);
    this.statusCode = statusCode;
    this.isOperational = true;
  }
}
```

### Async Handler Pattern

```javascript
const asyncHandler = (fn) => (req, res, next) => {
  Promise.resolve(fn(req, res, next)).catch(next);
};
```

### Middleware Pattern

```javascript
function authMiddleware(req, res, next) {
  const token = req.headers.authorization?.split(' ')[1];
  if (!token) {
    return res.status(401).json({ error: 'No token provided' });
  }
  try {
    req.user = verifyToken(token);
    next();
  } catch (error) {
    res.status(401).json({ error: 'Invalid token' });
  }
}
```

## Version-Specific Considerations

### Node.js 16+

| Feature | Consideration |
|---------|---------------|
| ES Modules | Use import/export |
| Async Local Storage | Request context |
| AbortController | Cancellation support |

### Node.js 18+

| Feature | Consideration |
|---------|---------------|
| Native fetch | Built-in HTTP client |
| Test runner | Built-in testing |
| Web Crypto API | Native crypto operations |

### Node.js 20+

| Feature | Consideration |
|---------|---------------|
| Single executable | Standalone binaries |
| Permission model | Security restrictions |
| Test runner improvements | Better testing support |

## Integration Concerns

### Node.js + TypeScript

| Concern | Recommendation |
|---------|----------------|
| Type definitions | Use @types/node |
| Path resolution | Configure tsconfig paths |
| Build process | Use tsc or bundler |

### Node.js + Database

| Concern | Recommendation |
|---------|----------------|
| Connection management | Use connection pooling |
| Migration strategy | Use migration tools |
| Query building | Use query builders or ORM |
