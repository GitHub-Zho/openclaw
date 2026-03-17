# lessons.md — Lessons Learned
# Read before multi-agent work. Keep concise.

## Active Rules (distilled from incidents)

**R1: Verify externally, always.** (from L-0002, L-0009, L-0010, L-0013)
Never claim done based on confidence. Fetch the URL, diff the output, check interactive elements.
When user specifies a source, diff against it — even if you "know" it matches.
When fixing bug A, re-check bugs B, C, D too.

**R2: Classify and dispatch.** (from L-0004, L-0005, L-0012)
Output TYPE + Reflection Block before any work. TYPE-M/C goes to sub-agents, not main.
Skipping this caused the 2026-03-17 triple failure.

**R3: Bilingual parity.** (from L-0003)
EN/ZH must ship together. Brain spec includes parity matrix. QA checks both.

**R4: QA is structural, not optional.** (from L-0006)
QA does Layer 0 (spec alignment) then Layer 1 (substance). Builder cannot self-approve.

**R5: Learning auto-triggers.** (from L-0008, L-0011)
On correction/redo/self-caught error → spawn learning. Output must be directly writable (not suggestions).

**R6: No dev artifacts in production.** (from L-0007)
Grep for dev comments before build. quality-gate.mjs checks this.

## Incident Log (reference only)

- L-0001: learning-loop gap → R2 (main reads lessons.md)
- L-0002: builder claimed done without visual verification → R1
- L-0003: EN done, ZH forgotten → R3
- L-0004: requirement misread → R2 (Reflection Block)
- L-0005: TYPE-S treated as full loop → R2 (classification)
- L-0006: QA skipped alignment check → R4
- L-0007: dev notes in production → R6
- L-0008: learning output not writable → R5
- L-0009: wrong source branch, 3x failure → R1
- L-0010: no post-deploy verification → R1
- L-0011: learning not auto-triggered → R5
- L-0012: skipped TYPE classification → R2
- L-0013: fixed A but didn't recheck B → R1
