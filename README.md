# vibe-to-prod

> From vibe-coded to production-ready. An agent skill that audits your repo and makes it ship-ready.

**vibe-to-prod** is an open source set of agent skills that teaches any AI coding agent (Claude Code, Cursor, GitHub Copilot) how to audit a GitHub repository for production readiness — then fix what's missing.

It targets developers **between "vibe coder" and fully technical engineer"** — people who can ship advanced products but lack formal software engineering practices.

## What It Does

When you install vibe-to-prod and ask your agent to "audit this repo", it will:

1. **🔍 Scan** — Understand your tech stack, hosting, monitoring, integrations, and current setup
2. **🧹 Structure** — Add READMEs to every directory, modularize code, make the repo "LLM-smart"
3. **📊 Score** — Rate production readiness across 10 categories with a simple scorecard
4. **🛠️ Fix** — Activate specialized skills to set up what's missing (CI/CD, monitoring, security, etc.)

## The 10 Categories

| # | Category | What It Checks |
|---|----------|---------------|
| 1 | **Environment Setup** | Dev/staging/prod separation, env vars management |
| 2 | **CI/CD Pipeline** | GitHub Actions, automated testing, deployment flow |
| 3 | **Documentation** | README per directory, AGENTS.md, .cursorrules |
| 4 | **Error Tracking** | Sentry/PostHog setup, monitoring dashboards |
| 5 | **Deployment** | Docker config, build optimization, hosting |
| 6 | **Security** | Secrets management, dependency scanning, auth |
| 7 | **Cost Awareness** | Cloud service monitoring, billing alerts |
| 8 | **Integration Health** | Slack, Linear, GitHub linkage |
| 9 | **LLM-Readiness** | Auto-documentation, agent rules, context files |
| 10 | **Code Organization** | Directory structure, refactoring opportunities |

## Install

### Claude Code
```bash
# Add as a plugin
/plugin marketplace add osmanio2/vibe-to-prod

# Or manually copy skills
cp -r skills/* ~/.claude/skills/
```

### Cursor
```bash
# Copy cursor rules to your project
cp .cursor/rules/vibe-to-prod.mdc your-project/.cursor/rules/
```

### GitHub Copilot
```bash
# Copy AGENTS.md to your project root
cp AGENTS.md your-project/.github/copilot/AGENTS.md
```

### Quick Start (Any Agent)
```
Just say: "Audit this repo for production readiness"
```

## Who Is This For?

- **Solo founders** who shipped with Cursor/Replit but need production-grade practices
- **Former vibe coders** who graduated past the basics but lack DevOps knowledge
- **Semi-technical founders** who worked with engineers but can't maintain what was built
- **Small teams** without a dedicated DevOps or platform engineer
- **Anyone** who wants their AI agent to work smarter on their codebase

## Skills

Each skill is a focused expert. Install all of them or pick what you need:

| Skill | What It Does |
|-------|-------------|
| `repo-scanner` | Scans and understands your current setup |
| `repo-structurer` | Adds READMEs, modularizes, cleans up |
| `deployment-engineer` | Sets up CI/CD, Docker, environments |
| `security-auditor` | Secures env vars, scans dependencies |
| `monitoring-setup` | Configures Sentry, PostHog, alerts |
| `cost-optimizer` | Tracks cloud costs, detects waste |
| `integration-linker` | Links Slack, Linear, GitHub together |
| `prompt-engineer` | Makes repo AI-native (AGENTS.md, rules) |
| `devops-advisor` | Infrastructure, databases, scaling |

## How Skills Work

Skills follow the [Agent Skills Standard](https://agentskills.io/). Each skill:

- Has a `SKILL.md` with frontmatter (name + description) that agents use for routing
- Contains step-by-step procedural instructions (not prose)
- References scripts and checklists for deterministic tasks
- Stays under 500 lines to keep the context window lean
- Uses progressive disclosure — details load only when needed

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

Areas we'd love help with:
- New tech stack detection patterns
- Framework-specific best practices (Rails, Django, Go, etc.)
- Cost optimization strategies for specific cloud providers
- Integration guides for popular tools

## License

Apache 2.0 — see [LICENSE](LICENSE).

## Built By

Created by [Osman Ramadan](https://github.com/osmanio2), co-founder of [HTML Builder for Word](https://htmlbuilderforword.com) and [Agemo](https://agemo.ai) (builders of [CodeWords](https://codewords.agemo.ai)).

Inspired by the belief that every repo should be production-ready, agent-friendly, and maintainable — regardless of how it was built.
