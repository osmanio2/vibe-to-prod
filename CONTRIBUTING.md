# Contributing to vibe-to-prod

Thanks for your interest in making vibe-to-prod better! This project helps developers go from vibe-coded repos to production-ready setups, and contributions from the community make it stronger.

## How to Contribute

### 1. Report Issues
- Found a skill that gives bad advice? [Open an issue](https://github.com/osmanio2/vibe-to-prod/issues/new)
- Include: which skill, what repo you tested on, what went wrong

### 2. Improve Existing Skills
Each skill lives in `skills/{skill-name}/SKILL.md`. To improve one:

1. Fork the repo
2. Edit the SKILL.md file
3. Test your changes (see Testing below)
4. Open a PR with a clear description of what you changed and why

**Skill quality guidelines:**
- Follow the [Agent Skills Standard](https://agentskills.io/) format
- Keep SKILL.md under 500 lines
- Use step-by-step numbered procedures, not prose
- Include concrete shell commands (grep, find, etc.)
- Define a clear output format template
- Add "Use when" and "Don't use for" trigger hints in the description

### 3. Add New Skills
Want to add a skill we don't have? (e.g., testing-setup, accessibility-audit, performance-optimizer)

1. Create `skills/{skill-name}/SKILL.md`
2. Follow the frontmatter format:
   ```yaml
   ---
   name: your-skill-name
   description: What it does. Use when the user asks to "...". Don't use for ...
   ---
   ```
3. Include: How It Works, Step-by-Step Procedure, Output Format sections
4. Test against at least 2 real repos
5. Open a PR

### 4. Add Detection Patterns
Know how to detect a specific tech stack, hosting provider, or tool? Add detection commands to the relevant skill's Step-by-Step Procedure section.

### 5. Improve Documentation
- Fix typos or unclear instructions
- Add examples to the checklist
- Improve the README

## Testing Your Changes

### Automated Eval
We use LLM-as-judge evaluation to score skills. See `tests/README.md` for details.

A good skill scores:
- **≥ 90%** on both Claude and GPT evaluators
- **100%** on structural checks (frontmatter, line count, naming)

### E2E Testing
Test your skill with Claude Code or Cursor on a real repo:

```bash
# Install skills into a test repo
cd /path/to/test-repo
curl -fsSL https://raw.githubusercontent.com/osmanio2/vibe-to-prod/main/install.sh | bash

# In Claude Code:
claude -p "Read skills/{your-skill}/SKILL.md and follow its instructions"

# In Cursor:
# Just ask: "Follow the {your-skill} skill to fix this repo"
```

## Code of Conduct

Be kind, be constructive, be helpful. We're all here to make software better.

## License

By contributing, you agree that your contributions will be licensed under the Apache 2.0 License.
