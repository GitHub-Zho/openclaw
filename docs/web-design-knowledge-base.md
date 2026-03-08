# Website Design Knowledge Base (Optimized for Sub-Agent Workflow)

## 1) What we learned from previous iterations

### Repeated failure pattern
- "Redesign" was done as cosmetic patching instead of structural change.
- Dynamic/random image sources caused mismatched visuals.
- Internal-tool links (Figma/Notion) leaked into user-facing pages.

### Root causes
- No hard definition of "from-scratch redesign".
- No mandatory QA gate before deploy.
- One-agent mixed responsibilities (planning + implementation + review).

### Fixes already implemented
- Build quality gate added (`scripts/quality-gate.mjs`):
  - blocks random image endpoints
  - blocks internal tool links in user-facing pages
  - blocks placeholder/TBD/TODO leakage
- Skill checklist updated with "from-scratch means IA rebuild" rule.
- Site structure rebuilt with clearer IA and responsive grid classes.

---

## 2) Design standards to follow (web)

### Visual system
- Typography hierarchy fixed globally: H1/H2/H3/body/label.
- 8pt spacing rhythm tokens (4/8/12/16/20/24/32/40).
- Unified card system (radius, border density, spacing).
- Unified image treatment (tone/contrast/saturation consistency).

### IA and conversion logic
- Hero → benefits/trust → core details → FAQ → registration CTA.
- Key decision info near CTA: price, inclusions, exclusions, constraints.
- Keep key action reachable in 2-3 clicks.

### Content principles
- Plain language, short paragraphs, concrete nouns/numbers.
- Remove internal workflow references from user-facing pages.
- Add audience-fit framing (who this is for / may not fit).

### Technical baseline
- Accessibility: heading order, alt text, keyboard-friendly controls, contrast.
- Performance: image optimization and Core Web Vitals awareness.

---

## 3) Sub-agent architecture (recommended)

### Roles
- **main (orchestrator)**: goals, constraints, approval, release notes.
- **brain (planner)**: strategy, IA options, design spec.
- **web-builder**: implementation + deployment.
- **web-qa**: independent PASS/FAIL review.

### Why this works
- Separation of concerns prevents context drift.
- Independent QA prevents false "improvement" claims.
- Clear maker-checker loop creates measurable quality gains.

---

## 4) Execution protocol per iteration

1. **Plan packet (main -> brain)**
   - objective
   - required structural changes
   - in-scope pages
   - visual references
   - Definition of Done

2. **Build packet (main -> web-builder)**
   - approved IA/spec
   - content source of truth
   - hard bans
   - expected deliverables (files changed + URL + build logs)

3. **QA packet (main -> web-qa)**
   - URL + changed files + checklist
   - required output: PASS/FAIL + mandatory fixes

4. **Loop**
   - FAIL => builder receives only mandatory fixes
   - PASS => release

---

## 5) Hard quality gates (no exceptions)
- If user says "from scratch", IA must be rebuilt (not visual-only tweaks).
- Build must pass `npm run quality && astro build`.
- No dynamic random image endpoints in production pages.
- No Figma/Notion internal links in user-facing routes.
- No unresolved placeholders.

---

## 6) Current project-specific standards (Explore China)
- Keep route clarity: Shanghai → Suzhou → Hangzhou → Beijing.
- Keep package clarity: CAD $3,000 excluding international flights.
- Keep accommodation assumption explicit: ~¥350/person/night.
- Use landmark-accurate visuals only.
- Keep handbook as internal site page (`/handbook`) for user consumption.

---

## 7) Ready-to-use command checklist

```bash
# Verify agents
openclaw agents list --bindings

# Build with quality gate
cd /home/ubuntu/.openclaw/workspace/explore-china-site
npm run build

# Deploy
npx vercel --prod --yes --token <TOKEN>
```
