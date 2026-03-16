#!/usr/bin/env bash
set -euo pipefail

# Sub-agent behavior regression + self-heal (sub-agents only)
# Important-agent files (main/learning governance) are excluded from auto-heal.

MAX_RETRIES="${MAX_RETRIES:-2}"
LOG_DIR="/home/ubuntu/.openclaw/workspace/logs"
mkdir -p "$LOG_DIR"
STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
LOG="$LOG_DIR/agent-regression-$STAMP.log"

check_file_rule() {
  local file="$1"
  local pattern="$2"
  local tag="$3"
  if grep -Eqi "$pattern" "$file"; then
    echo "PASS:$tag" >> "$LOG"
    return 0
  fi
  echo "FAIL:$tag" >> "$LOG"
  return 1
}

run_probe_role() {
  local agent="$1"
  local question="$2"
  local expect="$3"
  local out
  out=$(openclaw agent --agent "$agent" --message "$question" 2>&1 | grep -v "Config warnings" | grep -v "plugins.entries.feishu" | tail -n 3)
  echo "[$agent] probe output: $out" >> "$LOG"
  if echo "$out" | grep -Eqi "$expect"; then
    echo "PASS:probe-$agent" >> "$LOG"
    return 0
  fi
  echo "FAIL:probe-$agent" >> "$LOG"
  return 1
}

self_heal() {
  local target="$1"
  local guidance="$2"
  openclaw agent --agent learning --message "Regression check: patch /home/ubuntu/.openclaw/workspace-$target/AGENTS.md to explicitly include this rule text: $guidance . Keep role boundaries unchanged. Reply one line." >/dev/null 2>&1 || true
}

check_all() {
  local failed=0

  # Canonical rule checks (deterministic)
  check_file_rule "/home/ubuntu/.openclaw/workspace-web-qa/AGENTS.md" "hero-image semantic match|image relevance" "web-qa-rule" || failed=1
  check_file_rule "/home/ubuntu/.openclaw/workspace-research/AGENTS.md" "What evidence is still missing|Confidence level" "research-rule" || failed=1
  check_file_rule "/home/ubuntu/.openclaw/workspace-web-builder/AGENTS.md" "random image endpoints|internal tool links|cosmetic-only" "builder-rule" || failed=1

  # Light role probes (non-deterministic wording, loose expectations)
  run_probe_role "web-qa" "State your role in one short sentence." "quality reviewer|PASS/FAIL|verify" || failed=1
  run_probe_role "research" "State your role in one short sentence." "information|synthesis|research" || failed=1
  run_probe_role "web-builder" "State your role in one short sentence." "implementation|deploy" || failed=1

  return $failed
}

echo "== Agent regression check: $STAMP ==" | tee "$LOG"

if check_all; then
  echo "PASS: no regression" | tee -a "$LOG"
  exit 0
fi

echo "Detected regression. Triggering learning self-heal..." | tee -a "$LOG"
self_heal "web-qa" "hero-image semantic match with adjacent headline/CTA"
self_heal "research" "output contract includes what evidence is still missing"
self_heal "web-builder" "hard bans include random image endpoints and internal tool links"

attempt=1
while [ "$attempt" -le "$MAX_RETRIES" ]; do
  echo "Re-test attempt $attempt/$MAX_RETRIES" | tee -a "$LOG"
  if check_all; then
    echo "PASS: regression resolved after self-heal" | tee -a "$LOG"
    exit 0
  fi
  attempt=$((attempt + 1))
done

echo "FAIL: regression persists after self-heal" | tee -a "$LOG"
exit 1
