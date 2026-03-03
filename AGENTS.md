# AGENTS.md

This file provides guidance to AI coding agents (Claude Code, Cursor, Copilot, etc.) when working with code in **any repository** that installs vibe-to-prod.

## What Is vibe-to-prod?

A production-readiness auditor for GitHub repositories. It teaches AI agents how to analyze a repo, detect what's missing for production, and fix it — targeting developers between "vibe coder" and fully technical engineer.

## When To Activate

Activate this skill when the user says any of:
- "Audit this repo"
- "Is this production ready?"
- "Check my repo"
- "What's missing?"
- "Make this production ready"
- "Clean up this repo"
- "Add documentation"
- "Set up CI/CD"

Do NOT activate for: code review, bug fixing, feature development, or writing new code.

## How It Works

### Step 1: Scan the Repository
1. Read the root directory structure and identify the tech stack
2. Check for: `package.json`, `requirements.txt`, `go.mod`, `Cargo.toml`, `Dockerfile`, `.github/workflows/`, `.env.example`
3. Identify hosting: Vercel (`vercel.json`), AWS (`cdk.json`, `serverless.yml`), Railway (`railway.toml`), Docker Compose
4. Identify monitoring: Sentry (`sentry.properties`, DSN in env), PostHog, Datadog
5. Identify communication: Slack webhooks, Linear API keys, Discord
6. Check for existing agent config: `AGENTS.md`, `.cursorrules`, `.cursor/rules/`

### Step 2: Generate the Audit Report
Rate each of these 10 categories as ✅ Done, ⚠️ Partial, or ❌ Missing:

1. **Environment Setup** — dev/staging/prod separation, `.env.example` exists, no hardcoded secrets
2. **CI/CD Pipeline** — GitHub Actions or equivalent, automated tests run on PR, auto-deploy configured
3. **Documentation** — README in root + key directories, API docs if applicable, setup instructions
4. **Error Tracking** — Sentry/PostHog/Datadog configured, error boundaries in frontend code
5. **Deployment** — Dockerfile or platform config, build scripts, health checks
6. **Security** — No secrets in code, dependency scanning, auth implementation
7. **Cost Awareness** — Cloud resource monitoring, billing alerts, unused resource detection
8. **Integration Health** — Dev tools connected (Slack, Linear, etc.), webhooks configured
9. **LLM-Readiness** — AGENTS.md exists, directory READMEs, .cursorrules, context files for agents
10. **Code Organization** — Logical directory structure, no dead code, proper separation of concerns

### Step 3: Present Results
Format the audit as a simple scorecard:
```
## 📊 Production Readiness Score: X/10

✅ Environment Setup — dev/staging/prod configured
⚠️ CI/CD Pipeline — GitHub Actions exists but no tests
❌ Error Tracking — No Sentry or monitoring found
...

### Top 3 Recommendations:
1. [Most impactful fix]
2. [Second priority]
3. [Third priority]
```

### Step 4: Fix (When Asked)
When the user asks to fix specific categories, load the relevant skill from `skills/` and follow its instructions. Each skill is a separate SKILL.md file.

## Available Skills

- `skills/repo-scanner/` — Detailed scanning procedures
- `skills/repo-structurer/` — README generation, modularization
- `skills/deployment-engineer/` — CI/CD, Docker, environments
- `skills/security-auditor/` — Secrets, dependencies, auth
- `skills/monitoring-setup/` — Sentry, PostHog, alerting
- `skills/cost-optimizer/` — Cloud cost tracking
- `skills/integration-linker/` — Tool connectivity
- `skills/prompt-engineer/` — AI-native repo setup
- `skills/devops-advisor/` — Infrastructure guidance

## Output Format

Always present results in human-friendly language. The target audience is semi-technical — they understand concepts like "CI/CD" and "environment variables" but may not know how to set them up. Explain WHY something matters, not just what's missing.

## Commands

- `npm test` or `pytest` or `go test` — run existing tests (if detected)
- `docker build .` — verify Docker builds (if Dockerfile exists)
- `git log --oneline -10` — understand recent activity
- `find . -name "README.md" | head -20` — check documentation coverage
- `grep -r "NEXT_PUBLIC_\|REACT_APP_\|process.env" --include="*.ts" --include="*.tsx" --include="*.js" -l` — find env var usage
