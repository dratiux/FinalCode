# FinalCode — Security Gate 2.0 (Full Checklist)

This is the exhaustive checklist for the Security Gate (Gate 8). The Phase 2 table in SKILL.md gives the condensed summary; use this file for the full audit.

Every discovered vulnerability must report: **Severity**, **CVE Category** (if applicable), **Affected Files**, **Attack Vector**, **Potential Impact**, **Recommended Mitigation**, **Verification Method** — in addition to the standard Finding Format fields (Classification will always be "Security Vulnerability").

## Authentication
- Session handling
- Password handling
- MFA support
- Account enumeration
- Session expiration
- Session fixation

## Authorization
- Role validation
- Permission boundaries
- Privilege escalation
- IDOR (Insecure Direct Object Reference)
- Route protection

## Input Validation
- SQL Injection
- XSS (Cross-Site Scripting)
- CSRF (Cross-Site Request Forgery)
- SSRF (Server-Side Request Forgery)
- Command Injection
- Path Traversal
- Open Redirect
- File upload validation

## Secrets Management
- API keys
- Tokens
- Credentials
- Environment variables
- Secret leakage
- Hardcoded secrets

## Dependency Security
- Known vulnerable packages
- Deprecated packages
- Supply-chain risks
- Version security

## Storage Security
- LocalStorage
- SessionStorage
- Cookies
- Sensitive data persistence
- Encryption usage

## API Security
- Authentication
- Authorization
- Rate limiting
- CORS
- Security headers
- Input validation
- Output sanitization

## Frontend Security
- `dangerouslySetInnerHTML` (or framework equivalent)
- Unsafe HTML
- DOM injection
- CSP (Content Security Policy) compatibility

## Backend Security
- Error leakage
- Stack traces exposed to clients
- Logging of sensitive information
- Secure defaults

## Cloud & Deployment
- Production configuration
- HTTPS enforcement
- Debug mode left enabled
- Environment separation (dev/staging/prod)
- Security headers
- Hosting-platform configuration (e.g. Cloudflare/Vercel settings, when applicable)

---

## Security Summary Ratings

Every report's Security Summary rates each of the nine categories below as **clean** or **N findings**, then assigns an overall Security Rating:

- Authentication
- Authorization
- Input Validation
- Secrets
- Dependencies
- API Security
- Frontend Security
- Backend Security
- Deployment Security

**Overall Security Rating scale:** `A+` `A` `B` `C` `D` `F`

Base the rating on the severity and count of confirmed Security Vulnerabilities found across all nine categories — e.g. any unresolved Critical vulnerability caps the rating at `D` or `F`; a clean sweep with no findings earns `A+`. Never assign the rating arbitrarily; it should be traceable to the findings listed in the Security Summary and the FINDINGS section.
