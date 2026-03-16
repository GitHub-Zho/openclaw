# OpenClaw Agent Configuration

Portable agent configuration and accumulated knowledge for Jo's OpenClaw multi-agent system.

## Purpose

Clone this repo on any new server to restore the full agent architecture — governance rules, sub-agent configs, knowledge base, and verification tools — without re-learning everything from scratch.

## Quick Start (New Server)

```bash
# 1. Install OpenClaw first (follow https://docs.openclaw.ai)
# 2. Clone this repo
git clone https://github.com/GitHub-Zho/openclaw.git ~/openclaw-config

# 3. Run setup
cd ~/openclaw-config
chmod +x config/setup.sh
./config/setup.sh
```

The setup script will:
- Copy main workspace files (AGENTS.md, SOUL.md, knowledge/, docs/, tools/)
- Create sub-agent workspaces and copy their governance files
- Generate `openclaw.json` from template (prompts for API keys)
- Create empty personal files (MEMORY.md, USER.md) for you to fill in

## Structure

```
config/                      # OpenClaw config template + setup script
main/                        # Main agent workspace files
  ├── AGENTS.md              # Governance, workflow, process rules
  ├── SOUL.md                # Agent personality and principles
  ├── knowledge/             # Lessons, patterns, skill-packs
  ├── docs/                  # Protocols, postmortems, runbooks
  ├── tools/                 # Verification scripts
  └── scripts/               # Code quality gates
agents/                      # Sub-agent workspace files
  ├── brain/                 # Strategy/planning
  ├── web-builder/           # Implementation/deployment
  ├── web-qa/                # Quality review
  ├── learning/              # Process QA / capability improvement
  ├── research/              # Information intelligence
  ├── prompt-optimizer/      # Prompt engineering
  └── public-ops/            # External-facing interaction
```

## What's NOT in this repo

- `MEMORY.md` — Personal long-term memory (created empty on setup)
- `USER.md` — Real user info (template provided, fill in yourself)
- API keys, tokens, passwords (prompted during setup)
- Project-specific code (explore-china-site has its own repo)
- Session data, logs, node_modules

## Updating

After making improvements on any server, push governance changes back:

```bash
cd ~/.openclaw/workspace
# The setup script adds this repo as 'config' remote
git add knowledge/ docs/ tools/ AGENTS.md SOUL.md
git commit -m "learning: update rules from <incident>"
git push config main
```

Sub-agent changes need manual sync (or run `config/sync-agents.sh`).
