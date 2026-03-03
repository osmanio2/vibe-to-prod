---
name: prompt-engineer
description: Makes a repository AI-native by creating AGENTS.md, .cursorrules, Claude skills, and documentation that helps any AI agent understand and work with the codebase. Use when the user asks to "make repo AI-ready", "add cursor rules", "create AGENTS.md", "set up for AI coding", or "make agents work better". Don't use for deployment, monitoring, or security.
---

# Prompt Engineer

Makes your repository "AI-native" — so any coding agent (Claude Code, Cursor, Copilot) can understand and work with your codebase effectively.

## How It Works

1. Analyze the codebase to understand patterns and conventions
2. Create AGENTS.md with project context, commands, and boundaries
3. Create .cursorrules with code style and framework patterns
4. Add directory-level READMEs for agent navigation
5. Document key architectural decisions

## Step-by-Step Procedure

### Step 1: Analyze Codebase Patterns
Read 5-10 key files to understand:
- Naming conventions (camelCase, snake_case, kebab-case)
- File organization patterns
- Import patterns
- Error handling patterns
- State management approach
- API patterns (REST, GraphQL, tRPC)

### Step 2: Create AGENTS.md

Follow this structure (adapted from GitHub's analysis of 2,500+ AGENTS.md files):

```markdown
# AGENTS.md

## Project Overview
{1-2 sentences: what this project does}

## Tech Stack
- Frontend: {framework}
- Backend: {framework}
- Database: {type}
- Hosting: {platform}
- Auth: {provider}

## Commands
```bash
npm run dev     # Start development server
npm run build   # Production build
npm test        # Run tests
npm run lint    # Run linter
```

## File Structure
{Key directories and their purpose}

## Conventions
- {Pattern 1}
- {Pattern 2}

## Boundaries
- DO NOT modify {files/patterns}
- DO NOT change {configuration}
- ALWAYS {practice}
```

### Step 3: Create .cursorrules

```markdown
# Project Rules

## Code Style
- Use {naming convention}
- Prefer {pattern A} over {pattern B}
- Always {practice}

## Framework Patterns
- {Framework-specific rule 1}
- {Framework-specific rule 2}

## File Organization
- {Where to put new files}
- {Naming conventions for files}

## Do NOT
- {Anti-pattern 1}
- {Anti-pattern 2}
```

### Step 4: Key Principles (from GitHub's research)
- **Put commands early** — agents reference them often
- **Be specific** — "You are a test engineer for React" beats "You are helpful"
- **Set boundaries** — what NOT to modify is as important as what to do
- **Give examples** — show actual code patterns from the project
- **Keep it under 500 lines** — agents have limited context

## Output Format
List all files created with a brief explanation of what each teaches the agent.
