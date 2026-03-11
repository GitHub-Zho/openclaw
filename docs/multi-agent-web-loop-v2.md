# Multi-Agent Web Loop v2 (enforced)

## Goal
Prevent builder overload and enforce planning/verification separation.

## Stage gates (must pass in order)
Contract reference: `docs/agent-role-contract.md` (must be followed)
1. **brain-spec gate (required before builder)**
   - IA map
   - visual tokens (type, spacing, contrast, component density)
   - acceptance checklist (measurable)
   - explicit references to installed skills:
     - frontend-design-3
     - ui-ux-design
     - tailwind-design-system
     - accessibility

2. **prompt-optimizer gate**
   - Convert brain spec into strict builder prompt
   - Include non-goals and anti-regression constraints
   - Also optimize: user->main, main->research, brain->research, brain->builder prompt channels
   - Add ambiguity checks to prevent requirement misread

3. **research gate (before builder when external context is needed)**
   - main/brain draft research request -> prompt-optimizer refines -> research executes
   - research returns digested findings directly to main/brain (not via optimizer)

4. **builder gate**
   - Implement only approved scope
   - No independent spec drift

5. **qa gate (hard stop)**
   - Independent PASS/FAIL runtime check
   - If FAIL: return gap list to brain, not directly to builder

6. **main decision gate**
   - main approves next round task based on brain + qa outputs

7. **learning gate (mandatory)**
   - learning must run every round and produce `learning-report.md` in the round artifact folder.
   - learning must monitor subagent performance quality (brain/prompt-optimizer/research/builder/qa), detect weak patterns, and propose fixes.
   - learning must log process failures (e.g., "rule documented but not enforceable") into postmortem notes.
   - learning-proposed subagent fixes must be submitted to main first; apply only after main approval.
   - next round is blocked until learning report includes corrective control (script/check/gate), owner, and follow-up check.

## Workload split
- brain: 40% (spec + decomposition + validation criteria)
- builder: 40% (implementation)
- qa: 20% (independent verification)

## Stop rule
If brain-spec is missing or not skill-referenced, builder cannot start.

## Round-completion sanity rule (new)
After each implementation round, main must run a quick process sanity test before declaring round closure:
1. Confirm stage artifacts exist (brain spec, optimized prompt, builder report, QA PASS/FAIL).
2. Confirm handoff order was respected (brain -> prompt-optimizer -> research -> builder -> qa -> main -> learning), validated from `handoff-log.jsonl`.
3. Confirm at least one runtime interaction proof was captured for the round.
If any check fails, round remains open and must be fixed before proceeding.

## Enforced artifact + verifier
- Round artifacts must be stored at: `docs/workflow-rounds/<round-id>/`
  - `brain-spec.md`
  - `prompt-optimized.md`
  - `research-report.md`
  - `builder-report.md`
  - `qa-report.md`
  - `learning-report.md`
  - `main-decision.md`
  - `handoff-log.jsonl`
- Mandatory verifier command before closing round:
  - `tools/verify_web_loop_round.sh docs/workflow-rounds/<round-id>`

## Hard completion gate (must-pass)
- A fix/process change is **NOT implemented** unless test/verifier passes.
- If any test fails, status remains `in_progress` and work must continue until pass.
- No "done" claim is allowed on code-only completion or partial verification.
- This applies to every round and every bug/process fix.
