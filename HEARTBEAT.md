# HEARTBEAT.md

## Goal
Run lightweight process-quality maintenance for multi-agent workflow without spamming or high API cost.

## On each heartbeat
1. Read `memory/learning-state.json` if it exists (create if missing).
2. If last learning audit < 12 hours ago: reply `HEARTBEAT_OK`.
3. If >= 12 hours:
   - Review recent web-related conversation snippets and latest docs changes.
   - Detect repeated failures (e.g., "changed but not improved", wrong visuals, leaked placeholders/internal links, missed from-scratch request).
   - If no meaningful issue found: update timestamp in `memory/learning-state.json` and reply `HEARTBEAT_OK`.
   - If issue found:
     - Append a short incident note to `memory/YYYY-MM-DD.md`.
     - Draft rule/gate improvement proposal in `docs/postmortem-template.md` format under `docs/postmortems/<date>-<topic>.md`.
     - Update `memory/learning-state.json` timestamp.
     - Send only a concise alert summary (no HEARTBEAT_OK).

## Guardrails
- Do not modify product/business code in heartbeat mode.
- Only update learning/process files (docs, skills, gates, memory notes).
- Keep heartbeat work under 5 minutes.
