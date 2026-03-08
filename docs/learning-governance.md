# Learning Governance (Main + Learning)

## Decision safety

### If main makes a bad decision, what happens?
- `web-qa` can flag a **decision error** (not just implementation error) in PASS/FAIL report.
- `learning` records it as a governance incident in postmortem.
- The incident must include a **decision-level corrective rule** (e.g., approval threshold, rollback criteria).

### Who improves main's decision quality?
- `learning` agent is the primary auditor of main's decision quality.
- `web-qa` provides independent evidence when decision quality affects output quality.
- User has final override authority.

## Approval policy (hard rule)
- Any change to learning files affecting behavior must be **approved by user** before apply:
  - `skills/**`
  - `docs/*governance*`, `docs/*runbook*`, `docs/postmortems/**`
  - quality-gate scripts
- Until approved, proposals go to `memory/pending-learning-updates.json`.
- Unapproved proposals do not modify active skill behavior.

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
