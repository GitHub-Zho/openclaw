#!/usr/bin/env bash
set -euo pipefail

# OpenClaw Agent Configuration Setup Script
# Copies governance files, knowledge, tools, and sub-agent configs
# into the correct OpenClaw directory structure.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

# Detect OpenClaw home
OPENCLAW_HOME="${OPENCLAW_HOME:-$HOME/.openclaw}"
WORKSPACE="$OPENCLAW_HOME/workspace"

echo "╔══════════════════════════════════════════════╗"
echo "║  OpenClaw Agent Configuration Setup          ║"
echo "╚══════════════════════════════════════════════╝"
echo ""
echo "OpenClaw home: $OPENCLAW_HOME"
echo "Workspace:     $WORKSPACE"
echo ""

# Check OpenClaw is installed
if [ ! -d "$OPENCLAW_HOME" ]; then
  echo "❌ OpenClaw home not found at $OPENCLAW_HOME"
  echo "   Install OpenClaw first: https://docs.openclaw.ai"
  exit 1
fi

if [ ! -d "$WORKSPACE" ]; then
  echo "Creating workspace directory..."
  mkdir -p "$WORKSPACE"
fi

# ─── Step 1: Main Workspace Files ───────────────────────────────
echo "📁 Step 1: Copying main workspace files..."

# Core governance files (always overwrite — these are the source of truth)
for f in AGENTS.md SOUL.md HEARTBEAT.md TOOLS.md; do
  cp "$REPO_DIR/main/$f" "$WORKSPACE/$f"
  echo "   ✅ $f"
done

# Templates → only copy if target doesn't exist (don't overwrite personal data)
for f in USER.md IDENTITY.md; do
  if [ ! -f "$WORKSPACE/$f" ]; then
    cp "$REPO_DIR/main/${f}.template" "$WORKSPACE/$f"
    echo "   ✅ $f (from template)"
  else
    echo "   ⏭️  $f (already exists, skipped)"
  fi
done

# Create MEMORY.md if it doesn't exist
if [ ! -f "$WORKSPACE/MEMORY.md" ]; then
  echo "# MEMORY.md — Long-Term Memory" > "$WORKSPACE/MEMORY.md"
  echo "" >> "$WORKSPACE/MEMORY.md"
  echo "_Created $(date -u +%Y-%m-%d). Update as you learn._" >> "$WORKSPACE/MEMORY.md"
  echo "   ✅ MEMORY.md (empty, ready to fill)"
else
  echo "   ⏭️  MEMORY.md (already exists, skipped)"
fi

# Create memory directory
mkdir -p "$WORKSPACE/memory"

# ─── Step 2: Knowledge Base ─────────────────────────────────────
echo ""
echo "🧠 Step 2: Copying knowledge base..."

mkdir -p "$WORKSPACE/knowledge/agent-prompts" "$WORKSPACE/knowledge/skill-packs"
cp -r "$REPO_DIR/main/knowledge/"* "$WORKSPACE/knowledge/"
echo "   ✅ knowledge/ (lessons, patterns, skill-packs, agent-prompts)"

# ─── Step 3: Docs ───────────────────────────────────────────────
echo ""
echo "📄 Step 3: Copying docs..."

mkdir -p "$WORKSPACE/docs/postmortems" "$WORKSPACE/docs/todolists" \
         "$WORKSPACE/docs/governance-decisions" "$WORKSPACE/docs/workflow-rounds"
cp "$REPO_DIR/main/docs/"*.md "$WORKSPACE/docs/" 2>/dev/null || true
cp "$REPO_DIR/main/docs/postmortems/"*.md "$WORKSPACE/docs/postmortems/" 2>/dev/null || true
echo "   ✅ docs/ (workflow, protocols, postmortems, runbooks)"

# ─── Step 3b: Task System ────────────────────────────────────────
echo ""
echo "📋 Step 3b: Setting up async task system..."

mkdir -p "$WORKSPACE/tasks"
cp "$REPO_DIR/main/tasks/PROTOCOL.md" "$WORKSPACE/tasks/"
cp "$REPO_DIR/main/tasks/todolist.md" "$WORKSPACE/tasks/"
echo "   ✅ tasks/ (todolist + protocol)"

# ─── Step 4: Tools & Scripts ────────────────────────────────────
echo ""
echo "🔧 Step 4: Copying tools and scripts..."

mkdir -p "$WORKSPACE/tools" "$WORKSPACE/scripts"
cp "$REPO_DIR/main/tools/"*.sh "$WORKSPACE/tools/" 2>/dev/null || true
chmod +x "$WORKSPACE/tools/"*.sh 2>/dev/null || true
cp "$REPO_DIR/main/scripts/"* "$WORKSPACE/scripts/" 2>/dev/null || true
echo "   ✅ tools/ (6 verification scripts)"
echo "   ✅ scripts/ (quality-gate.mjs)"

# ─── Step 5: Sub-Agent Workspaces ───────────────────────────────
echo ""
echo "🤖 Step 5: Setting up sub-agent workspaces..."

AGENTS=(brain web-builder web-qa learning research prompt-optimizer public-ops)

for agent in "${AGENTS[@]}"; do
  agent_ws="$OPENCLAW_HOME/workspace-$agent"
  agent_dir="$OPENCLAW_HOME/agents/$agent/agent"
  
  # Create directories
  mkdir -p "$agent_ws" "$agent_dir"
  
  # Copy workspace governance files
  src="$REPO_DIR/agents/$agent"
  if [ -d "$src" ]; then
    for f in "$src"/*.md; do
      [ -f "$f" ] && cp "$f" "$agent_ws/"
    done
  fi
  
  # Create USER.md from template if not exists
  if [ ! -f "$agent_ws/USER.md" ]; then
    # Use main USER.md if it has content, otherwise use a minimal version
    if [ -f "$WORKSPACE/USER.md" ] && [ -s "$WORKSPACE/USER.md" ]; then
      cp "$WORKSPACE/USER.md" "$agent_ws/USER.md"
    else
      cat > "$agent_ws/USER.md" << 'USEREOF'
# USER.md — About the Human

_Copy from main workspace USER.md after filling it in._
USEREOF
    fi
  fi
  
  echo "   ✅ $agent (workspace + agent dir)"
done

# ─── Step 6: OpenClaw Config ────────────────────────────────────
echo ""
echo "⚙️  Step 6: OpenClaw configuration..."

OPENCLAW_JSON="$OPENCLAW_HOME/openclaw.json"

if [ -f "$OPENCLAW_JSON" ]; then
  echo "   ⏭️  openclaw.json already exists"
  echo "   📋 Template available at: $REPO_DIR/config/openclaw.json.template"
  echo "   Compare and merge manually if needed."
else
  echo "   openclaw.json not found. Generating from template..."
  
  # Replace path placeholders
  sed "s|\${OPENCLAW_HOME}|$OPENCLAW_HOME|g" \
    "$REPO_DIR/config/openclaw.json.template" > "$OPENCLAW_JSON"
  
  echo ""
  echo "   ⚠️  You need to fill in API keys in openclaw.json:"
  echo "   Search for '__REPLACE_ME__' and replace with your actual keys."
  echo ""
  echo "   Required keys:"
  grep -n '__REPLACE_ME__' "$OPENCLAW_JSON" | while read line; do
    echo "     $line"
  done
fi

# ─── Step 7: Git Remote ─────────────────────────────────────────
echo ""
echo "🔗 Step 7: Setting up git remote..."

cd "$WORKSPACE"
if ! git remote get-url config &>/dev/null; then
  git remote add config "https://github.com/GitHub-Zho/openclaw.git" 2>/dev/null || true
  echo "   ✅ Added 'config' remote for pushing governance updates"
else
  echo "   ⏭️  'config' remote already exists"
fi

# ─── Done ────────────────────────────────────────────────────────
echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║  ✅ Setup Complete                           ║"
echo "╚══════════════════════════════════════════════╝"
echo ""
echo "Next steps:"
echo "  1. Fill in API keys:  nano $OPENCLAW_JSON"
echo "     (search for '__REPLACE_ME__')"
echo "  2. Fill in your info: nano $WORKSPACE/USER.md"
echo "  3. Start OpenClaw:    openclaw gateway start"
echo "  4. Talk to your agent — it will guide identity setup"
echo ""
echo "To sync governance changes back to the repo:"
echo "  cd $WORKSPACE"
echo "  git push config main"
