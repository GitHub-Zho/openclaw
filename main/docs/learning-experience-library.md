# Learning Experience Library

## L-2026-03-11-RESEARCH-TIMEOUT-SAMPLING
- Trigger: Random QA sampling found a long research run timeout.
- Failure mode: Main accepted process viability without mandatory random spot-check and timeout fallback.
- Affected roles: main, research, learning.
- Preventive rule:
  1) Every round must include at least one random spot-check on a delegated subagent output.
  2) Any long-running external/research task must define timeout fallback/retry behavior before being considered reliable.
  3) Learning must record discovered cross-role failure patterns and attach required process patches.
- Verifier:
  - presence of `LEARNING_LESSON_REF` in round learning-report
  - research timeout/retry rule present in `multi-agent-web-loop-v2.md`
  - round verifier passes with learning artifact checks.
