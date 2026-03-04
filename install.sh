#!/usr/bin/env bash
# vibe-to-prod installer
# Usage: curl -fsSL https://raw.githubusercontent.com/osmanio2/vibe-to-prod/main/install.sh | bash
#
# Installs vibe-to-prod skills into the current directory so any AI coding agent
# (Claude Code, Cursor, GitHub Copilot) can audit your repo for production readiness.

set -euo pipefail

REPO="osmanio2/vibe-to-prod"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/$REPO/$BRANCH"

echo "🚀 Installing vibe-to-prod skills..."
echo ""

# Create directories
mkdir -p skills .cursor/rules

# Download skill files
SKILLS=(
  "repo-scanner"
  "repo-structurer"
  "deployment-engineer"
  "security-auditor"
  "monitoring-setup"
  "cost-optimizer"
  "integration-linker"
  "prompt-engineer"
  "devops-advisor"
)

for skill in "${SKILLS[@]}"; do
  mkdir -p "skills/$skill"
  curl -fsSL "$BASE_URL/skills/$skill/SKILL.md" -o "skills/$skill/SKILL.md" 2>/dev/null
  echo "  ✅ skills/$skill/SKILL.md"
done

# Download AGENTS.md
curl -fsSL "$BASE_URL/AGENTS.md" -o "AGENTS.md" 2>/dev/null
echo "  ✅ AGENTS.md"

# Download Cursor rules
curl -fsSL "$BASE_URL/.cursor/rules/vibe-to-prod.mdc" -o ".cursor/rules/vibe-to-prod.mdc" 2>/dev/null
echo "  ✅ .cursor/rules/vibe-to-prod.mdc"

# Download checklist
mkdir -p checklists
curl -fsSL "$BASE_URL/checklists/production-ready.md" -o "checklists/production-ready.md" 2>/dev/null
echo "  ✅ checklists/production-ready.md"

echo ""
echo "✨ vibe-to-prod installed! (13 files)"
echo ""
echo "Now open your AI coding agent and say:"
echo '  "Audit this repo for production readiness"'
echo ""
echo "Skills installed:"
for skill in "${SKILLS[@]}"; do
  echo "  • $skill"
done
echo ""
echo "📋 Human checklist: checklists/production-ready.md"
echo "📖 More info: https://github.com/$REPO"
