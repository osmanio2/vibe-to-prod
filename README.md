# vibe-to-prod

> From vibe-coded to production-ready. An agent skill that audits your repo and makes it ship-ready.

**vibe-to-prod** is an open source set of agent skills that teaches any AI coding agent (Claude Code, Cursor, GitHub Copilot) how to audit a GitHub repository for production readiness — then fix what's missing.

It targets developers **between "vibe coder" and fully technical engineer"** — people who can ship advanced products but lack formal software engineering practices.

## Quick Start

### One-Line Install
```bash
curl -fsSL https://raw.githubusercontent.com/osmanio2/vibe-to-prod/main/install.sh | bash
```

Then tell your AI agent:
```
"Audit this repo for production readiness"
```

### Manual Install
```bash
git clone https://github.com/osmanio2/vibe-to-prod.git
cp -r vibe-to-prod/skills your-project/skills
cp vibe-to-prod/AGENTS.md your-project/
```

## What It Does

When you install vibe-to-prod and ask your agent to audit, it will:

1. **🔍 Scan** — Understand your tech stack, hosting, monitoring, integrations
2. **📊 Score** — Rate production readiness across 10 categories with a structured scorecard
3. **🛠️ Fix** — Activate specialized skills to set up what's missing

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

## Tested & Verified

vibe-to-prod has been tested on real repositories across multiple stacks:

| Repo | Stack | Audit Score | Fix Skills Tested |
|------|-------|-------------|-------------------|
| Lovable hackathon project | React + Flask + TensorFlow | 4/10 | security-auditor ✅ |
| Cursor AI presentation builder | TypeScript monorepo (React 19) | 7.2/10 | — |
| Python SEO tool | FastHTML + SQLite + Nix | 5.2/10 | — |
| React + Supabase app | React 18 + Vite + Supabase | 5.5/10 | deployment-engineer ✅, monitoring-setup ✅ |
| Portfolio site | React 19 + Vite 7 + Tailwind | 4.5/10 | — |

**Automated evaluation:** 94% average across both Claude Haiku 4.5 and GPT-4.1-mini judges. 100% structural validation pass rate.

## Skills

Each skill is a focused expert. Install all or pick what you need:

| Skill | What It Does |
|-------|-------------|
| `repo-scanner` | Scans and scores your current setup |
| `repo-structurer` | Adds READMEs, modularizes, cleans up |
| `deployment-engineer` | Sets up CI/CD, Docker, environments |
| `security-auditor` | Secures env vars, scans dependencies |
| `monitoring-setup` | Configures Sentry, PostHog, structured logging |
| `cost-optimizer` | Tracks cloud costs, detects waste |
| `integration-linker` | Links Slack, Linear, GitHub together |
| `prompt-engineer` | Makes repo AI-native (AGENTS.md, rules) |
| `devops-advisor` | Infrastructure, databases, scaling |

## Works With

- **Claude Code** — Skills auto-load from `skills/` directory
- **Cursor** — Uses `.cursor/rules/vibe-to-prod.mdc`
- **GitHub Copilot** — Uses `AGENTS.md` at repo root
- **Any AI agent** — Skills are standard markdown, works everywhere

## How Skills Work

Skills follow the [Agent Skills Standard](https://agentskills.io/). Each skill:

- Has a `SKILL.md` with frontmatter (name + description) for agent routing
- Contains step-by-step procedural instructions with concrete shell commands
- References scripts and checklists for deterministic tasks
- Stays under 500 lines to keep the context window lean
- Defines a mandatory output format for consistent results

## Contributing

We welcome contributions! See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

Areas we'd love help with:
- New tech stack detection patterns
- Framework-specific best practices (Rails, Django, Go, Rust)
- New skills (testing-setup, accessibility-audit, performance-optimizer)
- Better detection commands for edge cases

## License

Apache 2.0 — see [LICENSE](LICENSE).

---

*Inspired by the belief that every repo should be production-ready, agent-friendly, and maintainable — regardless of how it was built.*
