---
name: integration-linker
description: Connects development tools together — Slack with GitHub, Linear with Git, error tracking with notifications. Use when the user asks to "connect tools", "link Slack", "set up notifications", "integrate Linear", or "connect my tools". Don't use for monitoring setup, deployment, or security.
---

# Integration Linker

Connects your development tools so they work together instead of in silos.

## How It Works

1. Identify tools already in use
2. Suggest high-value integrations
3. Set up connections between tools
4. Configure notification routing

## Common High-Value Integrations

### GitHub → Slack
- PR notifications to dev channel
- Deploy notifications to team channel
- CI failure alerts

### Linear → GitHub
- Auto-link PRs to Linear issues via branch naming
- Close issues when PRs merge

### Sentry → Slack
- Real-time error alerts
- Weekly error digest

### PostHog → Slack
- Key metric alerts (signup drops, error spikes)

## Step-by-Step: GitHub → Slack

1. Go to your Slack workspace → Apps → Add GitHub
2. In your repo settings → Webhooks → Add Slack webhook
3. Or use GitHub Actions to post to Slack:

```yaml
- name: Notify Slack
  uses: slackapi/slack-github-action@v2
  with:
    webhook: ${{ secrets.SLACK_WEBHOOK_URL }}
    payload: |
      {"text": "Deploy to production complete! 🚀"}
```

## Output Format
Present a connectivity map showing what's connected, what could be connected, and step-by-step setup for the highest-impact integration.
