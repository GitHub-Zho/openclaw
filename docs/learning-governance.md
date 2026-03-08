# Learning Governance (Main + Learning)

## Decision safety

### If main makes a bad decision, what happens?
- `web-qa` is limited to web output quality only (UI/UX/content/perf on deliverables).
- `learning` is the governance QA for decision/process mistakes.
- `learning` records governance incidents in postmortem with corrective rules (approval threshold, rollback criteria).

### Who improves main's decision quality?
- `learning` agent is the primary auditor of main's decision quality.
- `main` + `learning` review incidents and decide remediation.
- User has final override authority.

## Approval policy (tiered)
- **Important-agent learning files** require user approval before apply:
  - `skills/**` for `main` and `learning`
  - governance docs for `main` and `learning`
  - global quality-gate scripts affecting main behavior
- **Sub-agent learning files** (`brain`, `web-builder`, `web-qa`) can be updated by `main + learning` decision without user pre-approval.
- Any unapproved important-agent change goes to `memory/pending-learning-updates.json`.
- Pending items do not modify active behavior until approved.

## Severity routing
- **critical/high**: notify user via main and request approval.
- **medium/low**: log only; bundle for later approval.

## User offline behavior
- If user is away, queue updates as pending.
- On next return (or within 24h checkpoint), main summarizes pending updates and asks for batch approval.
- Other product tasks continue normally while pending queue is untouched.

## Autonomous-task exception
- If user explicitly says "I’m away, continue autonomously", builder can continue product tasks.
- Learning/skill changes still require user approval unless user explicitly grants temporary auto-approve scope.
