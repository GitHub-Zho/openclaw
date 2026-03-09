#!/usr/bin/env bash
set -euo pipefail

TODO_FILE="${1:-}"
if [ -z "$TODO_FILE" ]; then
  echo "Usage: verify_task_delivery.sh <todo-file-path>"
  exit 2
fi

if [ ! -f "$TODO_FILE" ]; then
  echo "FAIL: TODO file not found: $TODO_FILE"
  exit 1
fi

echo "Checking TODO file: $TODO_FILE"

# Must contain at least one task id
if ! grep -q "id:" "$TODO_FILE"; then
  echo "FAIL: no task items (id:) found"
  exit 1
fi

# No pending/in_progress allowed for final completion claims
if grep -Eq "status:\s*(pending|in_progress)" "$TODO_FILE"; then
  echo "FAIL: unresolved tasks remain (pending/in_progress)"
  grep -En "status:\s*(pending|in_progress)" "$TODO_FILE" || true
  exit 1
fi

# Each task should include verification method and result
if ! grep -q "verification method:" "$TODO_FILE"; then
  echo "FAIL: missing verification method fields"
  exit 1
fi

if ! grep -q "verification result:" "$TODO_FILE"; then
  echo "FAIL: missing verification result fields"
  exit 1
fi

echo "PASS: delivery evidence complete for $TODO_FILE"
