---
name: web-brand-builder
description: Build, redesign, and deploy content-driven marketing websites with modern minimalist UX (Claude/OpenAI/Apple-like quality bar). Use when the user asks for better visual design, typography hierarchy, layout logic, information architecture, conversion flow (CTA/FAQ/register), or end-to-end website implementation/deployment (especially Astro-based sites).
---

# Web Brand Builder

Use this workflow to turn raw content + references into a polished, deployable site.

## 1) Define target and constraints
- Confirm site purpose (promo, handbook, conversion, docs, mixed).
- Confirm audience and tone (student, premium, playful, enterprise).
- Lock hard constraints: stack, deadline, deployment target, brand rules.

## 2) Build design direction before coding
- Pick 2-3 reference sites with explicit reasons.
- Extract:
  - typography scale (H1/H2/H3/body/label)
  - spacing system (8pt/12pt grid)
  - button style + interaction states
  - card/border/radius density
  - image style (tone/contrast/saturation)
- Translate into CSS tokens first, not ad-hoc inline tweaks.

## 3) Information architecture first
- Map content into pages/sections before UI polish.
- Default marketing IA:
  1. Hero (single value proposition + primary CTA)
  2. Proof/benefits
  3. Core content (trip/program details)
  4. FAQ
  5. Conversion block (register/apply)
- Keep user-facing routes internal. Avoid exposing workspace tools (Figma/Notion links) unless explicitly requested.

## 4) Implement with maintainable structure
- Keep content data in `src/data/*`.
- Keep style tokens global in layout/theme.
- Keep sections componentized when repeated.
- Ensure responsive behavior from first pass.

## 5) Visual QA checklist
- Verify typography hierarchy consistency across all pages.
- Verify spacing rhythm and section cadence.
- Verify unified border/radius/shadow language.
- Verify image color consistency (same tone family).
- Verify CTA clarity and click paths (2-3 clicks to key action).

## 6) Conversion/interaction QA
- Ensure at least one primary CTA visible above fold.
- Ensure registration CTA appears again near bottom.
- Ensure FAQ reduces friction and repeats key constraints.
- Ensure navigation labels are short and obvious.

## 7) Deploy and iterate
- Build locally (`npm run build`) before deploy.
- Deploy to target (e.g., Vercel).
- Collect user feedback in three buckets:
  - Visual polish
  - Content clarity
  - Conversion friction
- Patch quickly; keep commit history clean.

## References
- For UX/UI heuristics: read `references/ux-principles.md`.
- For travel/handbook page composition: read `references/content-patterns.md`.
