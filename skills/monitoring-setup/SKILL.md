---
name: monitoring-setup
description: Configures error tracking (Sentry), product analytics (PostHog), health monitoring, and alerting. Use when the user asks to "set up monitoring", "add error tracking", "configure Sentry", "add analytics", or "set up alerts". Don't use for deployment, security, or code organization.
---

# Monitoring Setup

Sets up production monitoring so you know when things break before your users tell you.

## How It Works

1. Check what monitoring already exists
2. Set up error tracking (Sentry recommended)
3. Set up product analytics (PostHog recommended)
4. Configure health checks and uptime monitoring
5. Set up alerting (Slack/email notifications)

## Step-by-Step Procedure

### Step 1: Assess Current Monitoring
- Check dependencies for: `@sentry/nextjs`, `@sentry/node`, `posthog-js`, `posthog-node`, `datadog`, `newrelic`
- Check for error boundary components (React)
- Check for structured logging

### Step 2: Set Up Sentry (Error Tracking)

For **Next.js**:
```bash
npx @sentry/wizard@latest -i nextjs
```

This creates:
- `sentry.client.config.ts`
- `sentry.server.config.ts`
- `sentry.edge.config.ts`
- Updates `next.config.js` with Sentry plugin

Add to `.env.example`:
```
SENTRY_DSN=
SENTRY_AUTH_TOKEN=
```

### Step 3: Set Up PostHog (Product Analytics)

```bash
npm install posthog-js posthog-node
```

Create a provider:
```tsx
// providers/posthog.tsx
'use client'
import posthog from 'posthog-js'
import { PostHogProvider } from 'posthog-js/react'

if (typeof window !== 'undefined') {
  posthog.init(process.env.NEXT_PUBLIC_POSTHOG_KEY!, {
    api_host: process.env.NEXT_PUBLIC_POSTHOG_HOST || 'https://us.i.posthog.com',
  })
}

export function PHProvider({ children }: { children: React.ReactNode }) {
  return <PostHogProvider client={posthog}>{children}</PostHogProvider>
}
```

### Step 4: Configure Health Checks
- Add `/api/health` endpoint (see deployment-engineer skill)
- Set up uptime monitoring (UptimeRobot, Better Stack, or similar)

### Step 5: Set Up Alerting
- Sentry → Slack integration for error alerts
- PostHog → Slack for key metric changes
- Health check → PagerDuty/email for downtime

## Output Format
Present what was configured and what the user needs to do manually (e.g., create Sentry/PostHog accounts, add API keys).
