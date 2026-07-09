# Support and Troubleshooting

## Resources

- [README](README.md) -- Installation and usage
- [SUPPORTED.md](SUPPORTED.md) -- Platform compatibility and support policy
- [source/SKILL.md](source/SKILL.md) -- Complete skill specification
- [source/references/examples.md](source/references/examples.md) -- Worked example reports
- [source/references/gates.md](source/references/gates.md) -- Quality gate checklists
- [source/references/security-gate.md](source/references/security-gate.md) -- Security gate checklist

## Contact

- [GitHub Issues](https://github.com/dratiux/FinalCode/issues) -- Bug reports, feature requests
- [GitHub Discussions](https://github.com/dratiux/FinalCode/discussions) -- Questions, ideas
- dratiux@gmail.com

## Installation Issues

### Install script fails

Ensure you have bash (Linux/macOS) or PowerShell (Windows) available. The script copies files from `source/` to `.opencode/skills/finalcode/`. Verify the source directory exists and contains the expected files.

### Skill not appearing in OpenCode

1. Verify `.opencode/skills/finalcode/SKILL.md` exists after running the install script
2. Restart OpenCode after installation
3. Check that the `.opencode/` directory is in your project root

### Permission denied on install script

On Linux/macOS, make the script executable:

```bash
chmod +x scripts/install.sh
```

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

Or use slash commands:

```
/finalcode inspect
/finalcode repair
/finalcode certify
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

1. **OpenCode version** -- run `opencode --version`
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
