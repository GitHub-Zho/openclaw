#!/usr/bin/env bash
set -euo pipefail
ROUND_DIR="${1:-}"
if [[ -z "$ROUND_DIR" ]]; then
  echo "Usage: check_builder_start_gate.sh <docs/workflow-rounds/<round-id>>"
  exit 2
fi
BRAIN="$ROUND_DIR/brain-spec.md"
PROMPT="$ROUND_DIR/prompt-optimized.md"
[[ -f "$BRAIN" ]] || { echo "FAIL missing brain-spec: $BRAIN"; exit 1; }
[[ -f "$PROMPT" ]] || { echo "FAIL missing optimized prompt: $PROMPT"; exit 1; }
grep -Eq 'frontend-design-3|ui-ux-design|tailwind-design-system|accessibility' "$BRAIN" || { echo "FAIL brain-spec missing required skill refs"; exit 1; }
echo "PASS builder-start gate: $ROUND_DIR"
