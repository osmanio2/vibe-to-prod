# Tests

Automated evaluation for vibe-to-prod skills.

## Quick Start

```bash
# Install dependencies
pip install httpx openai pyyaml

# Set env vars
export GITHUB_TOKEN=your_github_token
export OPENAI_API_KEY=your_openai_key  # or use CodeWords proxy

# Run evaluation
python eval_skills.py
```

## What It Tests

### Structural Checks (deterministic, no LLM)
- SKILL.md exists for each skill
- Line count ≤ 500 (agentskills.io spec)
- Valid YAML frontmatter with `name` and `description`
- Name matches directory name
- Description ≤ 1024 chars
- Has trigger hint ("Use when" / "Don't use")
- AGENTS.md exists at root

### LLM-as-Judge (OpenAI or Anthropic)
- Actionability: Step-by-step numbered procedures?
- Workflow clarity: Agent can follow without ambiguity?
- Commands: Concrete shell commands provided early?
- Output format: Defined template for presenting results?
- Audience fit: Semi-technical friendly? Explains WHY?
- No hallucination: Concrete file patterns, not vague?

### Activation Testing
- Trigger: Does "audit my repo" correctly activate the skill?
- Negative: Does "fix this bug" correctly NOT activate?
- Overlap: Any conflicting triggers between skills?

## Interpreting Results

- **≥ 90%**: Skills are production-ready
- **80-89%**: Minor improvements needed
- **< 80%**: Significant issues to address
