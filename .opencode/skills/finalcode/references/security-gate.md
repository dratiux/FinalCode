# FinalCode — Security Gate 2.0 (Full Checklist)

This is the exhaustive checklist for the Security Gate (Gate 9). The Phase 2 table in SKILL.md gives the condensed summary; use this file for the full audit.

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

## Session Management
- Session token security
- Session timeout configuration
- Concurrent session handling
- Session data storage security
- CSRF protection for session transitions

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

## Deployment Security
- Production configuration
- HTTPS enforcement
- Debug mode left enabled
- Environment separation (dev/staging/prod)
- Security headers
- Hosting-platform configuration (e.g. Cloudflare/Vercel settings, when applicable)

## Cloud Configuration
- IAM roles and permissions
- Storage bucket policies
- Database access controls
- Network security groups
- Encryption at rest and in transit

## Rate Limiting
- API rate limiting configuration
- Brute force protection
- DDoS mitigation measures
- Throttling policies

## Security Headers
- Content-Security-Policy
- X-Frame-Options
- X-Content-Type-Options
- Strict-Transport-Security
- X-XSS-Protection
- Referrer-Policy
- Permissions-Policy

## Environment Configuration
- Environment variable validation
- Secret rotation policies
- Debug mode in production
- Logging level configuration
- Feature flags security

---

## Security Evidence Rules

Never report a category as **clean** unless objective evidence exists to support that conclusion.

Differentiate between **Verified** and **Assumed** security status:

- If dependency scanners were not executed, state: "Dependency vulnerability scan not executed. Static repository inspection found no obvious vulnerable patterns."
- If runtime security testing was not performed, state it explicitly.
- Never claim a clean security posture without evidence.

---

## Security Summary Ratings

Every report's Security Summary rates each of the fourteen categories below as **clean** or **N findings**, then assigns an overall Security Rating:

- Authentication
- Authorization
- Session Management
- Input Validation
- Secrets
- Dependencies
- API Security
- Frontend Security
- Backend Security
- Deployment Security
- Cloud Configuration
- Rate Limiting
- Security Headers
- Environment Configuration

**Overall Security Rating scale:** `A+` `A` `B` `C` `D` `F`

Base the rating on the severity and count of confirmed Security Vulnerabilities found across all fourteen categories — e.g. any unresolved Critical vulnerability caps the rating at `D` or `F`; a clean sweep with no findings earns `A+`. Never assign the rating arbitrarily; it should be traceable to the findings listed in the Security Summary and the FINDINGS section.
