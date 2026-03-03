---
name: repo-scanner
description: Scans a GitHub repository to understand its tech stack, hosting, monitoring, integrations, and current production readiness. Use when the user asks to "audit", "check", or "scan" their repo. Don't use for code review or bug detection.
---

# Repo Scanner

Scans any repository to build a complete picture of the current technical setup before auditing.

## How It Works

1. Read the root directory tree to identify project type and structure
2. Detect the tech stack from config files
3. Check for production infrastructure (CI/CD, Docker, hosting)
4. Check for observability (monitoring, error tracking, logging)
5. Check for developer experience (documentation, agent config, tooling)
6. Output a structured scan report

## Step-by-Step Procedure

### Step 1: Read Directory Structure
```bash
find . -type f -not -path './.git/*' -not -path './node_modules/*' -not -path './.next/*' -not -path './dist/*' -not -path './__pycache__/*' | head -200
```

### Step 2: Detect Tech Stack

Check for these files to determine the stack:

| File | Stack |
|------|-------|
| `package.json` | Node.js / JavaScript / TypeScript |
| `tsconfig.json` | TypeScript |
| `next.config.*` | Next.js |
| `vite.config.*` | Vite |
| `requirements.txt` / `pyproject.toml` | Python |
| `go.mod` | Go |
| `Cargo.toml` | Rust |
| `Gemfile` | Ruby |
| `pubspec.yaml` | Flutter/Dart |

Read `package.json` or equivalent to understand dependencies and scripts.

### Step 3: Check Production Infrastructure

| Check | How |
|-------|-----|
| **CI/CD** | Look for `.github/workflows/`, `.gitlab-ci.yml`, `Jenkinsfile`, `bitbucket-pipelines.yml` |
| **Docker** | Look for `Dockerfile`, `docker-compose.yml`, `.dockerignore` |
| **Hosting** | Look for `vercel.json`, `railway.toml`, `fly.toml`, `render.yaml`, `serverless.yml`, `cdk.json`, `terraform/` |
| **Environments** | Look for `.env.example`, `.env.local`, `.env.production`, environment-specific configs |
| **Build** | Check for build scripts in `package.json` (`build`, `start`, `dev`) or `Makefile` |

### Step 4: Check Observability

| Check | How |
|-------|-----|
| **Error tracking** | Grep for `sentry`, `@sentry/`, `posthog`, `datadog`, `bugsnag` in dependencies or code |
| **Analytics** | Grep for `gtag`, `analytics`, `mixpanel`, `amplitude` |
| **Logging** | Check for structured logging (winston, pino, structlog, loguru) |
| **Health checks** | Look for `/health`, `/healthz`, `/api/health` endpoints |

### Step 5: Check Developer Experience

| Check | How |
|-------|-----|
| **Root README** | Does `README.md` exist and have setup instructions? |
| **Directory READMEs** | `find . -name "README.md" -not -path './node_modules/*' | wc -l` |
| **Agent config** | Look for `AGENTS.md`, `.cursorrules`, `.cursor/rules/`, `.claude/` |
| **Linting** | Look for `.eslintrc`, `.prettierrc`, `ruff.toml`, `.flake8` |
| **Testing** | Look for `__tests__/`, `tests/`, `spec/`, test scripts in package.json |
| **Git hygiene** | Check `.gitignore` exists and covers common patterns |

### Step 6: Check Security

| Check | How |
|-------|-----|
| **Hardcoded secrets** | `grep -rn "sk-\|api_key.*=.*['\"]\|password.*=.*['\"]\|secret.*=.*['\"]\|token.*=.*['\"]\|AWS_" --include="*.ts" --include="*.js" --include="*.py" --include="*.env" . | head -20` |
| **Env example** | Does `.env.example` exist listing required variables (without values)? |
| **Dep scanning** | Is `npm audit` or `pip-audit` or equivalent configured? |
| **Auth** | Is there authentication/authorization in the app? |

## Output Format

Present the scan as:

```markdown
## 🔍 Repo Scan: {project-name}

**Tech Stack:** {detected stack}
**Hosting:** {detected hosting or "Not configured"}
**Framework:** {detected framework}

### Infrastructure
- CI/CD: {✅/⚠️/❌} {details}
- Docker: {✅/⚠️/❌} {details}
- Environments: {✅/⚠️/❌} {details}

### Observability
- Error Tracking: {✅/⚠️/❌} {details}
- Analytics: {✅/⚠️/❌} {details}
- Logging: {✅/⚠️/❌} {details}

### Developer Experience
- Documentation: {X READMEs found, Y directories}
- Agent Config: {✅/⚠️/❌} {details}
- Testing: {✅/⚠️/❌} {details}
- Linting: {✅/⚠️/❌} {details}

### Security
- Hardcoded Secrets: {✅ None found / ❌ Found X instances}
- Env Management: {✅/⚠️/❌} {details}
- Dependencies: {✅/⚠️/❌} {details}
```
