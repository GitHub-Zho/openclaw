# Agent Registry

Purpose: single source of truth for roles, IO contracts, approval levels, and reuse rules.

## Core architecture

### 1) main (default)
- Type: Orchestrator
- Owns: goals, constraints, approvals, release decisions
- Inputs: user requests, QA verdicts, learning proposals, public-agent delegation tickets
- Outputs: task packets, final decisions, release summaries
- Approval level: final gate for product delivery and high-risk external requests
- Reuse scope: all domains

### 2) brain
- Type: Planner/Spec
- Owns: IA options, style direction, acceptance criteria
- Inputs: main task packet
- Outputs: design/plan memo
- Approval level: advisory (main approves)
- Reuse scope: all domains requiring planning

### 3) research
- Type: Information Intelligence
- Owns: information collection, synthesis, confidence grading
- Inputs: research question/scope
- Outputs: decision brief (facts, conflicts, confidence, recommendation)
- Approval level: advisory (main/brain consume)
- Reuse scope: all domains

### 4) web-builder
- Type: Implementation
- Owns: coding, build, deploy for web tasks
- Inputs: approved spec/task packet
- Outputs: diffs, logs, URL, implementation note
- Approval level: execution-only
- Reuse scope: web domain

### 5) web-qa
- Type: Output QA (web only)
- Owns: visual/UX/content/perf/accessibility verdicts
- Inputs: URL + changed files + checklist
- Outputs: PASS/FAIL + evidence + mandatory fixes
- Approval level: gatekeeper for web output quality
- Reuse scope: web domain

### 6) learning
- Type: Governance QA / Capability Learning
- Owns: dialogue/process quality audits, learning-file proposals
- Inputs: conversation evidence, QA incidents, postmortems
- Outputs: rule updates, gate proposals, pending-update queue entries
- Approval level:
  - main+learning can auto-apply sub-agent learning-file updates
  - user approval required for main/learning critical learning-file updates
- Reuse scope: all domains

### 7) prompt-optimizer
- Type: Prompt Intelligence
- Owns: prompt refinement, constraint completion, acceptance-criteria injection
- Inputs: raw user intent + context + research findings
- Outputs: optimized prompt packets for brain/builder/qa
- Approval level: advisory (main chooses final packet)
- Reuse scope: all domains with underspecified instructions

## Reuse vs new-agent rule

### Reuse existing agents when:
- quality rubric is similar
- tools and outputs are similar
- task complexity is moderate

### Create new builder+qa pair when:
- evaluation standards differ significantly (e.g., stats correctness vs web UX)
- toolchain differs materially
- risk profile is high
- parallel workload requires isolation

Template for new domain:
- Keep: main + brain + research + learning
- Add: <domain>-builder + <domain>-qa

## Approval matrix (learning files)
- Main/Learning learning files: user approval required
- Sub-agent learning files (brain/research/web-builder/web-qa): main+learning approval sufficient

## Operating loop
### Lean mode (default)
1. main defines objective + sub-goal checklist
2. prompt-optimizer refines task packet (always)
3. research optional (when uncertainty/evidence risk is non-trivial)
4. builder implements
5. qa verifies PASS/FAIL
6. main approves release

### Full mode (escalation)
1. main defines objective + sub-goal checklist
2. prompt-optimizer refines task packets
3. research supplies evidence brief
4. brain defines plan/spec
5. builder implements
6. qa verifies PASS/FAIL
7. learning runs postmortem/rule proposal + quantitative score
8. main approves release and governance actions
