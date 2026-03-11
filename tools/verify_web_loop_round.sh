#!/usr/bin/env bash
set -euo pipefail
ROUND_DIR="${1:-}"
if [[ -z "$ROUND_DIR" ]]; then
  echo "Usage: verify_web_loop_round.sh <docs/workflow-rounds/<round-id>>"
  exit 2
fi
req=(
  "$ROUND_DIR/brain-spec.md"
  "$ROUND_DIR/prompt-optimized.md"
  "$ROUND_DIR/research-report.md"
  "$ROUND_DIR/builder-report.md"
  "$ROUND_DIR/qa-report.md"
  "$ROUND_DIR/learning-report.md"
  "$ROUND_DIR/main-decision.md"
  "$ROUND_DIR/handoff-log.jsonl"
)
for f in "${req[@]}"; do
  [[ -f "$f" ]] || { echo "FAIL missing artifact: $f"; exit 1; }
done

grep -Eq 'frontend-design-3|ui-ux-design|tailwind-design-system|accessibility' "$ROUND_DIR/brain-spec.md" || { echo "FAIL brain-spec missing required skill references"; exit 1; }

grep -Eq '^QA_RESULT:\s*FAIL' "$ROUND_DIR/qa-report.md" && \
  ! grep -Eq '^REPLAN_BY:\s*brain' "$ROUND_DIR/main-decision.md" && { echo "FAIL QA FAIL must route back to brain"; exit 1; }

grep -Eq '^BRAIN_SPEC_READY:\s*yes' "$ROUND_DIR/main-decision.md" || { echo "FAIL builder start gate missing (BRAIN_SPEC_READY: yes)"; exit 1; }

grep -Eq '^INTERACTION_PROOF:\s*yes' "$ROUND_DIR/main-decision.md" || { echo "FAIL missing round sanity interaction proof flag"; exit 1; }
grep -Eq '^LEARNING_REVIEW_DONE:\s*yes' "$ROUND_DIR/main-decision.md" || { echo "FAIL missing learning review completion flag"; exit 1; }

# strict handoff order check via jsonl log
ORDER=$(python3 - <<'PY' "$ROUND_DIR/handoff-log.jsonl"
import json,sys
path=sys.argv[1]
stages=[]
with open(path,'r',encoding='utf-8') as f:
    for line in f:
        line=line.strip()
        if not line: continue
        obj=json.loads(line)
        stage=obj.get('stage','').strip()
        if stage: stages.append(stage)
print(','.join(stages))
PY
)
EXPECTED="brain,prompt-optimizer,research,builder,qa,main,learning"
if [[ "$ORDER" != "$EXPECTED" ]]; then
  echo "FAIL handoff order mismatch"
  echo "  expected: $EXPECTED"
  echo "  observed: $ORDER"
  exit 1
fi

echo "PASS web-loop round verification: $ROUND_DIR"
