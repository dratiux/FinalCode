# Support and Troubleshooting

## Resources

- [README](README.md) -- Installation and usage
- [SUPPORTED.md](SUPPORTED.md) -- Platform compatibility and support policy
- [skills/finalcode/SKILL.md](skills/finalcode/SKILL.md) -- Complete skill specification
- [skills/finalcode/references/examples.md](skills/finalcode/references/examples.md) -- Worked example reports
- [skills/finalcode/references/gates.md](skills/finalcode/references/gates.md) -- Quality gate checklists
- [skills/finalcode/references/security-gate.md](skills/finalcode/references/security-gate.md) -- Security gate checklist

## Contact

- [GitHub Issues](https://github.com/dratiux/FinalCode/issues) -- Bug reports, feature requests
- [GitHub Discussions](https://github.com/dratiux/FinalCode/discussions) -- Questions, ideas
- dratiux@gmail.com

## Installation Issues

### Skill not appearing after installation

1. Restart your AI coding agent after installation
2. Verify the installation completed without errors
3. Check that your agent supports Skills (refer to [skills.sh](https://skills.sh) documentation)

### Node.js not found

Ensure you have Node.js 18+ installed:

```bash
node --version
```

If Node.js is not installed, download it from [nodejs.org](https://nodejs.org/).

## Skill Activation Issues

### FinalCode does not activate

FinalCode activates when your request implies a repository audit. Try:

- "Run FinalCode on this repository"
- "Audit this codebase"
- "Is this production ready?"
- "Run a security review"

### Wrong mode activates

Be explicit about the mode:

```
Run FinalCode in Inspect Mode
Run FinalCode in Repair Mode
Run FinalCode in Certify Mode
```

## Report Interpretation

### Report seems incomplete

1. Verify you opened the correct directory as your workspace
2. Ensure the project has a valid structure (not just a single file)
3. Check that the AI has filesystem access to scan files

### Certification results seem unexpected

- Results depend on the AI model's interpretation of the repository
- Some findings require manual verification -- the "Needs Verification" classification exists for uncertain findings
- Run multiple times for consistency checks
- Review the Confidence Model section of the report for evidence quality

### Health Score seems too low

The Health Score is a weighted composite across 10 categories. Check the Health Score Explanation section for the breakdown. Address the largest deductions first for the most improvement.

## Bug Reporting Checklist

When reporting a bug:

1. **AI agent version** -- which agent and version you are using
2. **FinalCode version** -- check the report header or README
3. **Steps to reproduce** -- exact command or prompt used
4. **Expected behavior** -- what you expected to happen
5. **Actual behavior** -- what happened instead
6. **Project structure** -- language, framework, approximate file count
7. **Report output** -- paste the relevant sections (Dashboard, Certification, Findings)

## Feature Requests

Include in your request:

- Description of the proposed feature
- Problem it solves
- Example use cases
- Alternatives you considered
