# Security Policy

## Responsible Disclosure

Report security vulnerabilities through [GitHub Security Advisories](../../security/advisories/new). Do not report vulnerabilities through public issues.

You should receive a response within 48 hours. If you do not, follow up to confirm receipt.

### What to Include

- Type of vulnerability (e.g., information disclosure, path traversal)
- Full paths of affected source files
- Location of the affected code (tag, branch, commit, or URL)
- Configuration required to reproduce
- Step-by-step reproduction instructions
- Proof-of-concept code (if possible)
- Impact and potential exploitation vectors

## Supported Versions

| Version | Supported |
|---------|-----------|
| 2.1.x | Yes |
| 2.0.x | Yes |
| 1.9.x | Yes |
| 1.8.x | Yes |
| < 1.8 | No |

Security patches are applied to the current major version and the previous two minor versions.

## Scope

FinalCode is a skill definition for the Skills ecosystem. It instructs AI assistants how to audit repositories. As such:

- **No code execution.** FinalCode does not execute code itself.
- **No network access.** FinalCode does not make network requests.
- **No data collection.** FinalCode does not collect or transmit user data.
- **AI-dependent.** Actual behavior depends on the AI model processing the skill.

### In Scope

- Vulnerabilities in the skill definition itself
- Path traversal or file inclusion issues in the install scripts
- Injection vectors through configuration files
- Incorrect access control in generated artifacts

### Out of Scope

- Vulnerabilities in OpenCode itself
- Vulnerabilities in the AI model processing the skill
- Issues that require modifying the AI model to exploit
- Social engineering attacks
- Issues requiring physical access to the target system

## Severity Handling

| Severity | Response Time | Action |
|----------|---------------|--------|
| Critical | 24 hours | Patch and release immediately |
| High | 72 hours | Patch in next minor release |
| Medium | 1 week | Patch in next scheduled release |
| Low | 2 weeks | Patch when convenient |

## Response Expectations

1. Acknowledge receipt within 48 hours
2. Provide an initial assessment within 72 hours
3. Work with reporter to validate the vulnerability
4. Develop and test a fix
5. Release the fix with a security advisory
6. Credit the reporter (unless anonymity is requested)

## Best Practices

- Review the certification report before acting on findings
- Verify critical security findings independently
- Use Inspect Mode before Repair Mode
- Back up your repository before running Repair Mode
- Review AI-generated fixes before merging

## Attribution

This security policy follows [GitHub Security Advisory](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/creating-a-security-advisory) guidelines.
