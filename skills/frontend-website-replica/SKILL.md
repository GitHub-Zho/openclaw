---
name: frontend-website-replica
description: Rebuild a reference website with high visual and interaction fidelity while avoiding direct copyright/trademark copying. Use when the user asks to “clone/replicate/复刻” a website’s UI, animations, layout rhythm, and component behavior, especially for bilingual EN/ZH delivery with strict visual QA evidence.
---

# Frontend Website Replica

Execute a high-fidelity rebuild workflow for modern websites.

## Workflow

1. Capture reference scope.
2. Extract visual system tokens.
3. Rebuild page structure and interactions.
4. Localize to EN/ZH with parity.
5. Run visual and functional QA.
6. Package evidence and release notes.

Do not skip validation.

## 1) Capture Reference Scope

Collect and lock:
- Reference URL(s)
- Pages in scope (home only vs full site)
- Device targets (mobile/desktop)
- Must-match interactions (hover, transitions, carousel, sticky CTA, form states)
- Legal boundaries (no logos/brand names/proprietary copy unless user-owned)

When unclear, prioritize homepage + key conversion section first.

## 2) Extract Visual System

Create a compact token sheet before coding:
- Color roles: primary / neutrals / accents / feedback
- Typography scale: heading/body/label/caption
- Radius, spacing scale, elevation, border styles
- Motion timings and easing patterns
- Component states: default/hover/active/focus/disabled/loading

Use reusable CSS variables or Tailwind tokens.

## 3) Rebuild Structure + Interactions

Implement in this order:
1. Global layout shell and responsive breakpoints
2. Header + hero + main sections
3. Buttons, cards, forms, nav interactions
4. Motion and microinteractions
5. Accessibility hardening (`:focus-visible`, keyboard, aria, reduced motion)

Prefer modular components for reuse across EN/ZH routes.

## 4) EN/ZH Parity Rule (Strict)

If bilingual is required:
- Ship both `/v2` and `/zh/v2` in the same round.
- Keep section order, CTA intent, and interaction behavior aligned.
- Avoid EN-only labels in shared components.

If one side is intentionally different, document the reason explicitly.

## 5) QA and Proof (Required)

Run objective checks before claiming complete:
- Responsive check: mobile/tablet/desktop
- Visual check: spacing, colors, typography rhythm, component states
- Interaction check: hover/active/focus/scroll/motion
- Accessibility check: keyboard path + reduced motion
- Performance sanity: obvious regressions only

Store visual proof:
- Before/after screenshots for EN and ZH
- Notes for any intentional deviations

Use project verification scripts when available:
- `tools/verify_task_delivery.sh <todo-file>`
- `tools/verify_web_loop_round.sh <round-file>`

Do not mark complete if any mandatory check fails.

## 6) Output Format

For each delivery, report:
1. What changed (components/sections)
2. Validation method used
3. Raw verification summary
4. PASS/FAIL conclusion
5. Remaining gaps and next patch plan

## Guardrails

- Do not claim “1:1 identical” for copyrighted material.
- Do not copy protected text/assets unless provided by the user.
- Recreate style and interaction quality with safe assets and original wording.
- Respect `prefers-reduced-motion`.

## References

Read these when needed:
- `references/replica-checklist.md` for execution checklist
- `references/parity-matrix-template.md` for EN/ZH parity tracking
