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
