# DEPLOY_RUNBOOK.md (Sanitized)

> Purpose: Allow a new AI/operator to deploy and verify the current architecture without exposing secrets.

## 0) Scope
- Website project: `explore-china-site` (Astro 5.x + Tailwind 3.x)
- Website Git repo: `GitHub-Zho/ExploreChina2026` (site-only)
- Ops/backup repo: `GitHub-Zho/openclaw` (docs/process only)

## 1) Required environment variables (never commit values)
- `VERCEL_TOKEN`
- `GITHUB_TOKEN` (optional, for GitHub API flows)
- `FIGMA_TOKEN` (optional, design integration)

Check:
```bash
printenv VERCEL_TOKEN >/dev/null && echo "VERCEL_TOKEN:OK" || echo "VERCEL_TOKEN:MISSING"
```

## 2) Branch policy
- Ongoing implementation: `test`
- Approved promotion snapshot: `main`
- Never mix workspace-only files into website repo.

## 3) Local quality + build
```bash
cd /home/ubuntu/.openclaw/workspace/explore-china-site
npm ci
npm run build
```
Expected success markers:
- `✅ Quality gate passed`
- `build Complete`

## 4) Preview deploy (safe)
```bash
cd /home/ubuntu/.openclaw/workspace/explore-china-site
npx --yes vercel --yes --token "$VERCEL_TOKEN"
```
Expected:
- Returns `Preview: https://<deployment>.vercel.app`

## 5) Production deploy (approval-gated)
```bash
cd /home/ubuntu/.openclaw/workspace/explore-china-site
npx --yes vercel --prod --yes --token "$VERCEL_TOKEN"
```
Expected:
- Returns production URL alias confirmation.

## 6) Deployment Protection troubleshooting (sanitized)
If preview is blocked for external analysis:
1. Check project protection fields via API.
2. Ensure project-level values are null where required:
   - `ssoProtection`
   - `passwordProtection`
   - `trustedIps`
3. If still blocked, inspect team-level policies.

## 7) Git push rules (strict)
- Website repo receives **site-only subtree** from `explore-china-site/`.
- Openclaw repo receives docs/process/governance only.
- Never push secrets or raw personal data.

## 8) Fast recovery checklist (new AI handover)
- Read:
  - `README.md` (privacy + backup rules)
  - `AGENTS.md`, `SOUL.md`, `USER.md`
  - latest `memory/YYYY-MM-DD.md`
- Confirm remotes and branch targets.
- Run build -> deploy preview -> verify routes EN/ZH -> report diff.

## 9) Rollback
- Website: redeploy previous stable commit from `main`.
- If deployment issue is config-only, revert Vercel project settings to prior known-good baseline.

## 10) Redaction requirements
Before sharing logs externally:
- Mask any token values
- Mask full personal identifiers
- Keep commands + outcomes intact for reproducibility

---
Last updated: 2026-03-13 (UTC)
Status: LOCAL DRAFT (not pushed)
