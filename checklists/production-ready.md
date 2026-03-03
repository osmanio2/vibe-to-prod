# Production-Ready Checklist

Use this checklist to manually verify your repo is production-ready. Check each item as you complete it.

## 🌍 Environment Setup
- [ ] `.env.example` exists with all required variables listed (no values)
- [ ] `.env` and `.env.local` are in `.gitignore`
- [ ] Separate configs for dev/staging/production
- [ ] No hardcoded API keys or secrets in source code

## 🚀 CI/CD Pipeline
- [ ] GitHub Actions (or equivalent) runs on every PR
- [ ] Build step passes without errors
- [ ] Tests run automatically (even if minimal)
- [ ] Auto-deploy to staging on merge to main
- [ ] Manual promotion to production (or auto with approval)

## 📝 Documentation
- [ ] Root `README.md` with project description and setup instructions
- [ ] README in each major directory
- [ ] API documentation (if applicable)
- [ ] `.env.example` documents all environment variables
- [ ] Contributing guide for collaborators

## 🐛 Error Tracking
- [ ] Sentry (or equivalent) configured and receiving events
- [ ] Error boundaries in frontend (React/Next.js)
- [ ] Structured logging (not just console.log)
- [ ] Health check endpoint (`/api/health` or `/health`)

## 🐳 Deployment
- [ ] Dockerfile or platform-specific config exists
- [ ] Build command works cleanly (`npm run build` / `docker build`)
- [ ] Start command defined for production
- [ ] Health checks configured on hosting platform

## 🔒 Security
- [ ] No secrets in source code or git history
- [ ] Dependencies audited (`npm audit` / `pip-audit`)
- [ ] Authentication implemented (if needed)
- [ ] CORS configured properly (not `*` in production)
- [ ] Rate limiting on public APIs

## 💰 Cost Awareness
- [ ] Cloud billing alerts set (at 50%, 80%, 100% of budget)
- [ ] Unused resources identified and removed
- [ ] Resource sizing appropriate for current traffic

## 🔗 Integration Health
- [ ] GitHub → Slack notifications for deploys/failures
- [ ] Error tracking → Slack alerts
- [ ] Project management tool linked (Linear, Jira, etc.)

## 🤖 LLM-Readiness
- [ ] `AGENTS.md` exists with project context
- [ ] `.cursorrules` or `.cursor/rules/` configured
- [ ] Directory-level READMEs for agent navigation
- [ ] Key commands documented (build, test, deploy)

## 📁 Code Organization
- [ ] Logical directory structure
- [ ] No dead code or unused files
- [ ] Consistent naming conventions
- [ ] Proper separation of concerns
- [ ] `.gitignore` covers all generated/temp files
