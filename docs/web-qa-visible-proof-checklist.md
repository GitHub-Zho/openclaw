# Web QA Visible-Proof Checklist (Mandatory for UX claims)

Use before claiming any UI/UX/interaction feature is complete.

## A) URL freshness
- [ ] Open the exact production URL directly.
- [ ] Confirm title/path matches expected page.
- [ ] If tool shows unrelated page (auth/login/error), discard and re-open.

## B) Static visual proof
- [ ] Capture screenshot/snapshot of target section.
- [ ] Confirm expected element exists (heading/button/card/etc.).
- [ ] Confirm expected styling difference is present (layout, color, spacing, etc.).

## C) Interaction proof
For each claimed interaction (carousel, accordion, hover-like behavior):
- [ ] Trigger interaction once.
- [ ] Confirm state change (position/index/open state/class changes).
- [ ] Trigger opposite direction and confirm reversibility.

## D) Claim discipline
- [ ] If all checks pass: can claim "completed and verified visible".
- [ ] If any check fails: claim only "code updated, visible verification pending".

## E) Evidence payload in final reply
- URL(s) verified
- What interaction was tested
- What state changed
- Any known limitations
