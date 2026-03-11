# Multi-Agent Web Loop v2 (enforced)

## Goal
Prevent builder overload and enforce planning/verification separation.

## Stage gates (must pass in order)
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

3. **builder gate**
   - Implement only approved scope
   - No independent spec drift

4. **qa gate (hard stop)**
   - Independent PASS/FAIL runtime check
   - If FAIL: return gap list to brain, not directly to builder

5. **main decision gate**
   - main approves next round task based on brain + qa outputs

6. **learning gate (mandatory)**
   - learning must log any process failure (e.g., "rule documented but not enforceable") into a postmortem note before next round starts.
   - next round is blocked until learning note includes corrective control (script/check/gate) and owner.

## Workload split
- brain: 40% (spec + decomposition + validation criteria)
- builder: 40% (implementation)
- qa: 20% (independent verification)

## Stop rule
If brain-spec is missing or not skill-referenced, builder cannot start.

## Round-completion sanity rule (new)
After each implementation round, main must run a quick process sanity test before declaring round closure:
1. Confirm stage artifacts exist (brain spec, optimized prompt, builder report, QA PASS/FAIL).
2. Confirm handoff order was respected (brain -> prompt-optimizer -> builder -> qa -> main).
3. Confirm at least one runtime interaction proof was captured for the round.
If any check fails, round remains open and must be fixed before proceeding.

## Enforced artifact + verifier
- Round artifacts must be stored at: `docs/workflow-rounds/<round-id>/`
  - `brain-spec.md`
  - `prompt-optimized.md`
  - `builder-report.md`
  - `qa-report.md`
  - `main-decision.md`
- Mandatory verifier command before closing round:
  - `tools/verify_web_loop_round.sh docs/workflow-rounds/<round-id>`

## Hard completion gate (must-pass)
- A fix/process change is **NOT implemented** unless test/verifier passes.
- If any test fails, status remains `in_progress` and work must continue until pass.
- No "done" claim is allowed on code-only completion or partial verification.
- This applies to every round and every bug/process fix.
