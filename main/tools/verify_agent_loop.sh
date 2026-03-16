#!/usr/bin/env bash
set -euo pipefail
LOOP_ID="${1:-}"
if [ -z "$LOOP_ID" ]; then
  echo "Usage: verify_agent_loop.sh <loop-id>"
  exit 2
fi

base_main="/home/ubuntu/.openclaw/workspace/loop-runs/$LOOP_ID"
base_brain="/home/ubuntu/.openclaw/workspace-brain/loop-runs/$LOOP_ID"
base_research="/home/ubuntu/.openclaw/workspace-research/loop-runs/$LOOP_ID"
base_builder="/home/ubuntu/.openclaw/workspace-web-builder/loop-runs/$LOOP_ID"
base_qa="/home/ubuntu/.openclaw/workspace-web-qa/loop-runs/$LOOP_ID"
base_learning="/home/ubuntu/.openclaw/workspace-learning/loop-runs/$LOOP_ID"
base_prompt="/home/ubuntu/.openclaw/workspace-prompt-optimizer/loop-runs/$LOOP_ID"

missing=0
check_file(){
  if [ ! -f "$1" ]; then
    echo "MISSING: $1"
    missing=1
  else
    echo "OK: $1"
  fi
}

echo "== Artifact checks =="
check_file "$base_prompt/prompt-packet.md"
check_file "$base_research/research-brief.md"
check_file "$base_brain/plan.md"
check_file "$base_builder/build-report.md"
check_file "$base_qa/qa-report.md"
check_file "$base_learning/learning-report.md"
check_file "$base_main/main-decision.md"

echo "== Session checks =="
for a in prompt-optimizer research brain web-builder web-qa learning; do
  c=$(ls -1 "/home/ubuntu/.openclaw/agents/$a/sessions" 2>/dev/null | wc -l | tr -d ' ')
  echo "$a sessions: $c"
  if [ "$c" -lt 1 ]; then
    missing=1
  fi
done

if [ "$missing" -eq 0 ]; then
  echo "PASS: loop evidence complete for $LOOP_ID"
else
  echo "FAIL: loop evidence incomplete for $LOOP_ID"
  exit 1
fi
