---
name: web-brand-builder
description: Design, build, and deploy conversion-focused websites from raw content and references, with a modern minimalist quality bar (Claude/OpenAI/Apple-like). Use when users ask for website visual redesign, typography/layout system, information architecture, CTA/FAQ/register flow, internal handbook pages, or end-to-end Astro implementation and deployment.
---

# Web Brand Builder

Turn raw docs/notes into a polished, user-facing site.

## 1) Scope and constraints
- Confirm goal: promo, handbook, conversion, docs, or mixed.
- Confirm audience + tone.
- Lock constraints: stack, timeline, deployment target, brand limits.

## 2) Reference research (before coding)
- Select 2-3 benchmark sites and state what to borrow.
- Prefer reputable references (official tourism sites, major product sites, design systems).
- Extract only actionable patterns:
  - type hierarchy
  - spacing grid
  - button/interaction states
  - card density (radius, border, shadow)
  - image tone system

## 3) IA and click logic
- Map content into page architecture first.
- Default conversion IA:
  1. Hero + primary CTA
  2. Trust/proof or benefits
  3. Core details
  4. FAQ
  5. Conversion block near bottom
- Keep key actions within 2-3 clicks.
- Use internal routes for user-facing content (no raw workspace/tool links unless requested).

## 4) Content distribution
- Put short, essential content high on the page.
- Put detail where users decide (pricing, inclusions, constraints near CTA).
- Split long material into dedicated internal pages (e.g., `/handbook`).
- Keep wording plain and concrete.

## 5) Systemized implementation
- Keep content in `src/data/*`.
- Keep tokens/global styles in layout/theme.
- Reuse components for repeated sections.
- Build responsive from first pass.

## 6) Quality gates (must pass)
- Visual consistency: type, spacing, card language, image tone.
- UX consistency: clear nav labels, CTA prominence, low friction flow.
- Accessibility baseline: semantic headings, alt text, keyboard-friendly controls, acceptable contrast.
- Performance baseline: optimize images and target Core Web Vitals (LCP, INP, CLS).

## 7) Deploy, verify, iterate
- Run build locally before deploy.
- Deploy and verify live routes.
- Collect feedback in 3 buckets: visual polish, clarity, conversion friction.
- If user says "redesign from scratch", do not only tweak existing sections: replace page IA and layout structure end-to-end, then explicitly report what was rebuilt.
- Patch quickly and keep commit history clean.

## References
- `references/ux-principles.md` (visual + UX heuristics)
- `references/content-patterns.md` (page composition)
- `references/quality-checklist.md` (pre-launch checks)
