# Learning Governance

## Loop Closure Evidence (mandatory)

A learning cycle is complete only when all 3 artifacts exist:
1. Learning report artifact (from learning agent)
2. Main decision record (approve/reject/revise)
3. Patch provenance list (files changed linked to incident)

## Approval Policy (tiered)

- **Important-agent files** (main, learning governance, global quality gates) → require user approval
- **Sub-agent files** (brain, builder, qa, research, optimizer) → main + learning can auto-apply
- Unapproved changes → `memory/pending-learning-updates.json`
- Pending items do NOT modify active behavior until approved

## Severity Routing

- **Critical/High**: notify user via main, request approval
- **Medium/Low**: log only, bundle for later approval
- Severity computed from `docs/learning-eval-rubric.md` quantitative score

## User Offline Behavior

- Queue updates as pending
- On next return (or within 24h), main summarizes pending updates and asks for batch approval
- Product tasks continue normally while pending queue is untouched
- If user explicitly grants "continue autonomously": builder can continue product tasks, but learning/skill changes still require approval unless explicitly auto-approved

## Learning Output Format

Learning agent must output 3 blocks per round:

**Block A: Scorecard** — 5-dimension scores per `docs/learning-eval-rubric.md`

**Block B: Writable Content** — Ready-to-write file changes:
```
## Write Proposal [N]
Target: knowledge/lessons.md
Operation: append | replace
Content:
---
[complete content, directly writable, no second conversion needed]
---
```

**Block C: Next-Round Notes** — 1-3 key warnings for main's next Reflection Block

## Who Improves Main's Decision Quality?

- learning is the primary auditor of main's decisions
- main + learning review incidents and decide remediation
- User has final override authority
