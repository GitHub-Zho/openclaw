#!/usr/bin/env bash
set -euo pipefail

# Sync sub-agent governance files FROM local workspaces TO the repo
# Run this before pushing to keep the repo up to date with local changes.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
OPENCLAW_HOME="${OPENCLAW_HOME:-$HOME/.openclaw}"

AGENTS=(brain web-builder web-qa learning research prompt-optimizer public-ops)

echo "🔄 Syncing sub-agent files to repo..."

for agent in "${AGENTS[@]}"; do
  ws="$OPENCLAW_HOME/workspace-$agent"
  dest="$REPO_DIR/agents/$agent"
  
  if [ ! -d "$ws" ]; then
    echo "   ⚠️  $agent workspace not found, skipping"
    continue
  fi
  
  mkdir -p "$dest"
  
  # Copy governance files (skip USER.md — may contain personal info)
  for f in AGENTS.md SOUL.md IDENTITY.md CONTEXT.md HEARTBEAT.md TOOLS.md; do
    if [ -f "$ws/$f" ]; then
      cp "$ws/$f" "$dest/$f"
    fi
  done
  
  # Copy agent-specific extras
  if [ "$agent" = "learning" ] && [ -f "$ws/learning-eval-rubric.md" ]; then
    cp "$ws/learning-eval-rubric.md" "$dest/"
  fi
  
  echo "   ✅ $agent"
done

echo ""
echo "🔄 Syncing main workspace governance files..."

WORKSPACE="$OPENCLAW_HOME/workspace"
for f in AGENTS.md SOUL.md HEARTBEAT.md TOOLS.md; do
  if [ -f "$WORKSPACE/$f" ]; then
    cp "$WORKSPACE/$f" "$REPO_DIR/main/$f"
    echo "   ✅ $f"
  fi
done

# Sync knowledge, docs, tools
for dir in knowledge docs tools scripts; do
  if [ -d "$WORKSPACE/$dir" ]; then
    # Use rsync-like behavior: copy newer files
    cp -ru "$WORKSPACE/$dir/"* "$REPO_DIR/main/$dir/" 2>/dev/null || true
    echo "   ✅ $dir/"
  fi
done

echo ""
echo "Done. Review changes with 'git diff' then commit and push."
