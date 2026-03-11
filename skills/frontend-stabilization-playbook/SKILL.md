---
name: frontend-stabilization-playbook
slug: frontend-stabilization-playbook
description: Merged workflow skill for high-quality frontend design delivery with mandatory visual proof, user-operation simulation, and self-improvement loops.
---

# Frontend Stabilization Playbook (Merged)

This local skill merges the best parts of:
- frontend-design-3 (strong aesthetic direction)
- ui-ux-design (mobile-first hierarchy/accessibility)
- tailwind-design-system (systematic component patterns)
- self-improving (reflection + correction logging)

## Activation triggers
- Any web UI redesign/refactor task
- Any task with user complaint about visual quality or missing interactions
- Any "it doesn't look changed" feedback

## Mandatory execution sequence
1) **Design intent lock**
- Define target visual direction in 1 sentence.
- Define 5 acceptance criteria: hierarchy, spacing, contrast, interaction, mobile fit.

2) **Implementation constraints**
- Mobile-first breakpoints.
- 8px spacing rhythm.
- Text contrast >= WCAG target.
- Components use reusable class patterns (avoid ad-hoc random CSS).

3) **Visible-proof gate (non-negotiable)**
- Fresh-open production URL.
- Capture desktop + mobile screenshots.
- Simulate user actions for each interaction (carousel/accordion/form).
- Record state-change evidence (not just visual impression).

4) **Self-improving reflection gate**
- After delivery, write:
  - what went wrong
  - what worked
  - one reusable rule
- If repeated 3x, promote to persistent rule.

## Anti-hallucination rules
- Never claim "done" from build/deploy logs alone.
- If screenshot target mismatch occurs, discard and re-open URL.
- If user reports mismatch, immediately downgrade status and re-verify.

## Output contract
Every completion note must include:
- URLs verified
- screenshots captured (desktop + mobile)
- interaction tests and observed state changes
- known limitations

