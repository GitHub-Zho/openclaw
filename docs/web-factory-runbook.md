# Web Factory Runbook (Operator Steps)

## 1) Verify agent topology
```bash
openclaw agents list --bindings
```
Expected agents:
- main (default)
- brain
- web-builder
- web-qa

## 2) Keep user channels on main
No channel binding changes required unless you explicitly want channel-specific agents.

Main-agent rule:
- main is orchestration-only for web projects (goal/constraints/approval), not detailed design execution.

## 3) Execute one web iteration (manual orchestration)

### A. main -> brain (optional)
Ask for plan/IA if requirements are unclear.

### B. main -> web-builder
Send task packet:
- goal
- required structural changes
- page scope
- constraints
- Definition of Done

### C. web-builder output
Must include:
- changed files
- local build result
- deployed URL

### D. main -> web-qa
Send QA rubric + URL + changed files.

### E. web-qa verdict
- PASS: ship
- FAIL: return mandatory fixes to web-builder and loop

### F. learning audit (post-iteration)
- learning reviews dialogue + agent outputs for process-quality gaps.
- If improvement gaps found, learning submits rule/gate patch proposal.
- main approves/rejects and learning applies approved learning-file changes.

## 4) Release note format
- What changed
- Why better
- Remaining risks
- Next improvement step
