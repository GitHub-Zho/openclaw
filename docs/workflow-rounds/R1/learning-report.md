# Learning Report R1

Round: R1
Status: completed

## Failures observed
1. Brain run failed/unfinished while builder round still progressed.
2. Rules were documented before enforceable checks existed.

## Corrective controls added
- `tools/verify_web_loop_round.sh` now requires round artifacts and learning completion flag.
- `tools/check_builder_start_gate.sh` enforces brain-spec + prompt readiness before builder.
- Main response-test rule added in AGENTS.md.

## Owner and follow-up
- Owner: main
- Follow-up check: run `verify_web_loop_round.sh docs/workflow-rounds/R1` and ensure PASS with learning artifact.
