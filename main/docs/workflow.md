# Multi-Agent Workflow Reference

_Consolidated from: multi-agent-web-loop-v2, web-factory-runbook, web-factory-blueprint, agent-slimming-plan._

## Goal

Prevent builder overload, enforce planning/verification separation, and keep overhead proportional to task complexity.

## Execution Modes

### Lean 模式（TYPE-S / simple TYPE-M）
`main → prompt-optimizer → builder → qa → main`
- Skip brain (unless IA unclear) and learning realtime loop (heartbeat audits later)
- Use for low/medium complexity, low risk

### Standard 模式（TYPE-M）
`main → prompt-optimizer → brain → builder → qa → main → learning`
- Default for multi-file, bilingual, or visual tasks

### Full 模式（TYPE-C / high-risk TYPE-M）
`main → prompt-optimizer → research → brain → builder → qa → main → learning`
- Requires loop-evidence verification via `verify_web_loop_round.sh`

### Mode Selection

Score 0-2 on each: scope breadth, ambiguity, risk, novelty, failure history.
- Total 0-4 → Lean
- Total 5-10 → Full
- Force Full if: user says quality still poor, compliance-sensitive, cross-language consistency, or user explicitly requests closed-loop proof

## Stage Gate Details

### 1. Prompt-Optimizer Gate (always)
- Convert raw intent into precise builder prompt
- Include non-goals and anti-regression constraints
- Add ambiguity checks to prevent requirement misread

### 2. Brain-Spec Gate (TYPE-M/C, before builder)
Required content:
- IA map
- Visual tokens (type, spacing, contrast, component density)
- Acceptance checklist (measurable)
- Skill references (frontend-design-3, ui-ux-design, tailwind-design-system, accessibility)

Verify with: `tools/check_builder_start_gate.sh <round-dir>`

### 3. Research Gate (TYPE-C or when evidence needed)
- Research returns digested findings to main/brain (not via optimizer)
- If research fails/timeouts: retry once with narrowed scope, record both attempts

### 4. Builder Gate
- Implement approved scope only, no drift
- Must pass `scripts/quality-gate.mjs` before deploy
- Output: changed files, build log, deploy URL, implementation notes

### 5. QA Gate (hard stop)
- **Layer 0:** Brain-spec ↔ builder alignment check (first)
- **Layer 1:** Substantive QA with visible-proof checklist (second)
- FAIL → gap list returns to brain, not directly to builder

### 6. Main Decision Gate
- Ship/no-ship based on brain + qa outputs
- Round-completion sanity: confirm all artifacts exist, handoff order respected, interaction proof captured

### 7. Learning Gate (TYPE-M/C, mandatory)
- Produce learning-report.md with 5-dimension scorecard
- Output writable file content (complete diff), main does yes/no
- Update `docs/learning-experience-library.md` (or state "no new lesson")
- Include at least one random spot-check finding per round

## Round Artifacts

Store at: `docs/workflow-rounds/<round-id>/`
- brain-spec.md, prompt-optimized.md, research-report.md
- builder-report.md, qa-report.md, learning-report.md
- main-decision.md, handoff-log.jsonl

Verify with: `tools/verify_web_loop_round.sh <round-dir>`

## Handoff Log Format (handoff-log.jsonl)

Each line: `{"stage": "<agent>", "timestamp": "<ISO>", "status": "<result>"}`
Expected order: brain → prompt-optimizer → research → builder → qa → main → learning

## Anti-Hallucination Rules

- Never claim visual/interaction delivery from code/build logs alone
- Re-open production URL directly before verification (don't trust stale tabs)
- If screenshot returns unrelated page, discard and re-open
- For dynamic interactions, collect state-change proof
- If proof incomplete: "shipped in code, visible verification pending"

## Task Packet Template (main → builder)

```
Goal:
Required structural changes:
Pages in scope:
Content source of truth:
Visual constraints:
Hard bans:
Definition of done:
```

## QA Rubric Template

```
Verdict: PASS | FAIL
1) IA change evidence:
2) Visual consistency checks:
3) Content clarity checks:
4) Image relevance checks:
5) Technical checks:
Required fixes (if FAIL):
```

## Workload Split (approximate)
- brain: 40% (spec + decomposition + validation criteria)
- builder: 40% (implementation)
- qa: 20% (independent verification)
