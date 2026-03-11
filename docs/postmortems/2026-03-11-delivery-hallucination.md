# Postmortem — 2026-03-11 delivery hallucination (false-visible-claim)

## Incident
- Date/time: 2026-03-11 UTC
- Related sessions: Explore-China visual iteration thread
- Summary: Assistant claimed carousel/hover changes were visible, while user could not observe them. A screenshot workflow also returned unrelated Vercel login pages, creating false confidence in verification.

## Impact
- What quality/capability was affected?
  - Trust in delivery accuracy
  - Verification reliability for visual features
- User-visible consequence:
  - User repeatedly reported "no visible change" despite completion claims.

## Evidence
- Conversation evidence:
  - User: "哪有轮播哪有悬停，根本没有看到"
  - Assistant had claimed these features were done.
- Tool evidence:
  - Browser screenshot flow intermittently captured Vercel login instead of target pages.
  - Stale-tab snapshots were used in some checks.

## Root cause
- Process cause:
  - Verification was tool-success centric (build/deploy pass) rather than user-visible-state centric.
  - No mandatory "prove-visible" gate before making UX claims.
- Decision cause:
  - Overconfident inference from code edits + deployment logs.
  - Insufficient skepticism when browser tool returned unrelated pages.
- Tooling/gate cause:
  - No explicit stale-tab prohibition in runbook.
  - No required dual-source verification (DOM + screenshot + direct URL fetch).

## Rule update proposal
- File(s) to change:
  - docs/request-preflight-protocol.md
  - docs/task-todolist-protocol.md
  - docs/web-qa-visible-proof-checklist.md (new)
- New rule text (summary):
  1) Never claim visual/interaction delivery without live proof from current production URL.
  2) If snapshot/screenshot target mismatch occurs once, force re-open by URL and re-verify.
  3) For interactions, require explicit behavior evidence (e.g., click next/prev changes carousel state).
  4) Claim wording must be downgraded to "code shipped, visibility pending" until proof exists.
- Why this prevents recurrence:
  - Converts subjective confidence into objective visible-state gates.

## Gate update proposal
- Script/checklist updates:
  - Add manual checklist (web-qa-visible-proof-checklist) for visible behavior assertions.
  - Tie completion claims to checklist evidence.
- Expected false-positive risk:
  - Slightly longer verification time; low risk of false positives.

## Approval
- main decision: approve
- rationale: user trust was impacted; process-level fix is mandatory.

## Implementation
- Changed files:
  - docs/request-preflight-protocol.md
  - docs/task-todolist-protocol.md
  - docs/web-qa-visible-proof-checklist.md
- Verification steps:
  - read updated docs + run delivery gate script
- Result:
  - PASS (see associated TODO verification)
