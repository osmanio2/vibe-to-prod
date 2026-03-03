---
name: devops-advisor
description: Provides infrastructure guidance — database setup, caching, load balancing, and scaling advice. Use when the user asks about "infrastructure", "database setup", "caching", "scaling", "performance", or "architecture". Don't use for CI/CD setup, monitoring, or security.
---

# DevOps Advisor

Provides infrastructure guidance for solo founders and small teams who need production-grade setups without enterprise complexity.

## How It Works

1. Understand current infrastructure
2. Identify bottlenecks and risks
3. Recommend improvements prioritized by impact
4. Provide implementation guidance

## Common Recommendations

### Database
- **Connection pooling** — Use PgBouncer or built-in pooling (Prisma, Drizzle)
- **Backups** — Automated daily backups with point-in-time recovery
- **Migrations** — Version-controlled schema migrations (Prisma Migrate, Alembic, golang-migrate)
- **Indexing** — Add indexes for frequently queried columns

### Caching
- **Redis/Upstash** — Cache expensive API calls and computed data
- **CDN** — Static assets served from edge (Vercel, Cloudflare, CloudFront)
- **ISR/SSG** — Pre-render pages where possible (Next.js)

### Performance
- **Image optimization** — Use next/image, sharp, or CDN transforms
- **Bundle analysis** — `npm run analyze` to find large dependencies
- **Code splitting** — Dynamic imports for heavy components
- **API response caching** — Cache-Control headers for stable endpoints

### Scaling Patterns
- **Horizontal** — Stateless services behind a load balancer
- **Queue-based** — Background jobs for heavy processing (BullMQ, Celery)
- **Read replicas** — Separate read/write database connections

## Output Format
```markdown
## 🏗️ Infrastructure Assessment

### Current Setup
{What exists}

### Recommendations (Priority Order)
1. **{Recommendation}** — Impact: {High/Medium/Low} — Effort: {Low/Medium/High}
   - Why: {brief explanation}
   - How: {1-2 line implementation guide}

### Architecture Diagram
{Simple text diagram if helpful}
```
