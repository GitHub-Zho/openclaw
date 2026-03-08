# Web Factory Blueprint (Main Brain + Builder + QA)

## Objective
Build a repeatable local pipeline for high-quality website design + implementation + deployment with role isolation.

## Agent topology
- **main (you + orchestrator in DM)**
  - Owns product direction, constraints, approvals.
  - Co-decides learning-rule changes with learning agent.
  - Delegates execution and review tasks to sub-agents.
- **web-builder**
  - Owns implementation only: IA-to-code, responsive layout, content mapping, deployment.
- **web-qa**
  - Owns web-output quality only: visual/UX/content/accessibility/perf checks and accept/reject verdicts.
  - Does not judge governance/process decisions; that belongs to `learning`.
- **brain** (optional planning specialist)
  - Generates design strategy/options before coding when task is ambiguous.
- **research** (information intelligence)
  - Collects and synthesizes multi-source evidence for higher-quality decisions.
  - Provides confidence-graded briefs to main/brain.
- **learning** (conversation/capability QA)
  - Audits dialogue quality + agent capability gaps.
  - Proposes and implements learning-file updates after main approval.
  - Focuses on process quality, not business feature coding.

## Why this structure
- Separates design judgment from coding execution.
- Adds explicit maker-checker loop (builder vs QA) to prevent “changed but not improved”.
- Reduces context pollution from mixed responsibilities.

## Acceptance gates (must pass)
1. IA changes visible (if redesign requested).
2. Visual system consistency: typography, spacing, card density.
3. Content clarity: price/inclusions/CTA/FAQ aligned.
4. Relevance: all visuals semantically match route/activity.
5. Technical checks: build passes + quality gate passes + production deploy verified.

## Learning loop (dialogue + capability quality)
- Trigger conditions:
  - user says quality did not improve
  - repeated mistakes across >=2 iterations
  - mismatch between claimed change and actual diff
- Flow:
  1. `learning` produces incident analysis from conversation/session evidence
  2. `main` + `learning` agree on rule/gate updates
  3. `learning` patches learning files (skills/checklists/runbooks/gates)
  4. `main` reviews and approves ship
- Learning-file scope only (no feature coding by learning agent unless explicitly requested).

## Step-by-step local implementation

### Step 0 — Current state
Agents created locally:
- main (default)
- brain
- web-builder
- web-qa

### Step 1 — Plan (optional via brain)
Use `brain` when requirements are fuzzy or style choices are open.
Deliverable:
- 1-page plan with IA map + style system + change scope.

### Step 2 — Build (web-builder)
Builder receives strict task packet:
- target pages
- required structural changes
- content sources (Notion/Figma/project memory)
- prohibited patterns (random images, external internal-tool links)

Builder output:
- code changes
- build log
- deploy URL
- diff summary

### Step 3 — QA (web-qa)
QA receives:
- target criteria
- deployed URL
- changed files

QA output format:
- PASS/FAIL
- failed checks with exact evidence
- mandatory fixes list

### Step 4 — Loop until PASS
If FAIL:
- main sends only the mandatory-fix list back to builder.
- repeat Step 2/3.

### Step 5 — Final handoff
Main returns:
- what changed
- why it is better
- production URL
- remaining TODOs (if any)

## OpenClaw operating pattern
- Keep user channels bound to `main` unless explicit channel-level routing is required.
- Use sub-agent sessions for web tasks; do not mix web build logs into user-facing DM session.
- Keep all web repos in main workspace unless intentionally isolated.

## Task packet template (send to builder)
```
Goal:
Required structural changes:
Pages in scope:
Content source of truth:
Visual constraints:
Hard bans:
Definition of done:
```

## QA rubric template
```
Verdict: PASS | FAIL
1) IA change evidence:
2) Visual consistency checks:
3) Content clarity checks:
4) Image relevance checks:
5) Technical checks:
Required fixes (if FAIL):
```
