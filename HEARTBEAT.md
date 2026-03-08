# HEARTBEAT.md

## Goal
Run process-quality maintenance for multi-agent workflow with controlled noise and explicit approval gates.

## Inputs
- `memory/learning-state.json`
- `memory/pending-learning-updates.json`

## Audit cadence
Run learning audit when either condition is true:
1. Last learning audit >= 4 hours, OR
2. Pending updates count >= 2

Otherwise reply `HEARTBEAT_OK`.

## On audit
1. Review recent conversations and agent outputs for process-quality issues.
2. Classify findings by severity:
   - critical/high
   - medium/low
3. Create/append proposal entries to `memory/pending-learning-updates.json`.
4. Update `memory/learning-state.json` timestamps/counters.

## Notification policy
- If critical/high found: send concise alert summary (do NOT auto-apply changes).
- If only medium/low: do not alert; log only, then `HEARTBEAT_OK`.

## Approval policy (strict + tiered)
- In heartbeat mode:
  - Important-agent learning files (`main`, `learning`) require explicit user approval before apply.
  - Sub-agent learning files (`brain`, `web-builder`, `web-qa`) may be applied by `main + learning` decision.
- Learning-file changes include: skills, learning runbooks/governance docs, quality gates, postmortem templates.
- Keep unapproved important-agent proposals pending until user confirms.

## User-away behavior
- If user is away, keep accumulating pending updates.
- On next user return (or 24h checkpoint), summarize pending updates for batch approval.

## Guardrails
- Do not modify product/business code in heartbeat mode.
- Keep heartbeat work under 5 minutes.
