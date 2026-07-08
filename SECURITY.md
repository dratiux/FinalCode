# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability within FinalCode, please report it responsibly.

**Please do NOT report security vulnerabilities through public GitHub issues.**

Instead, please report them via [GitHub Security Advisories](../../security/advisories/new).

You should receive a response within 48 hours. If for some reason you do not, please follow up to ensure we received your original message.

Please include the following information in your report:

- Type of vulnerability (e.g., information disclosure, etc.)
- Full paths of source file(s) related to the vulnerability
- The location of the affected source code (tag/branch/commit or direct URL)
- Any special configuration required to reproduce the issue
- Step-by-step instructions to reproduce the issue
- Proof-of-concept or exploit code (if possible)
- Impact of the issue, including how an attacker might exploit it

This information will help us triage your report more quickly.

## Supported Versions

| Version | Supported |
| ------- | --------- |
| 1.6.x   | Yes       |
| 1.5.x   | Yes       |
| 1.4.x   | Yes       |
| 1.3.x   | Yes       |
| < 1.3   | No        |

## Security Considerations

FinalCode is a skill definition for OpenCode. It instructs AI assistants how to audit repositories. As such:

- **No code execution**: FinalCode does not execute code itself
- **No network access**: FinalCode does not make network requests
- **No data collection**: FinalCode does not collect or transmit user data
- **AI-dependent**: The actual behavior depends on the AI model processing the skill

Users should be aware that:

- AI models may interpret instructions differently
- Audit results are recommendations, not guarantees
- Users should verify critical findings independently
- The skill does not modify files in Inspect or Certify modes

## Best Practices

When using FinalCode:

- Always review the certification report before acting on findings
- Verify critical security findings independently
- Use Inspect Mode first to understand the scope of issues
- Back up your repository before running Repair Mode
- Understand that AI-generated fixes should be reviewed before merging

## Attribution

This security policy is adapted from the [GitHub Security Advisory](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/creating-a-security-advisory) guidelines.
