# Agent Slimming Plan (Quality-Preserving)

## Diagnosis
Current architecture is powerful but can become heavy for routine tasks.
Risks:
- extra token/latency from unnecessary handoffs
- duplicated analysis across prompt-optimizer/research/brain
- over-governance for low-risk requests

## Principles (from eval/multi-agent best practices)
1. Use multi-agent only when specialization adds clear value.
2. Pass minimal context to each agent (no full transcript dumps).
3. Prefer criteria-based checks over verbose free-form commentary.
4. Keep a default "lean mode" for low/medium complexity tasks.

## Execution modes

### Mode A — Lean (default)
Use for low/medium complexity, low risk.
Pipeline:
`main -> prompt-optimizer -> (research optional) -> builder -> qa -> main`
Skip:
- brain (unless IA unclear)
- learning realtime loop (log only; heartbeat audits later)

### Mode B — Full (escalation)
Use for high complexity/risk or repeated failures.
Pipeline:
`main -> prompt-optimizer -> research -> brain -> builder -> qa -> learning -> main`
Requires loop-evidence verification.

## Escalation triggers (switch Lean -> Full)
- user says quality still poor after one iteration
- safety/compliance-critical changes
- cross-language/cross-region consistency required
- repeated incident category in last 7 days

## Token-control rules
- Limit each specialist output to structured bullets with fixed sections.
- Prompt-optimizer is always-on in both Lean and Full modes.
- Research is optional in Lean mode; if enabled, default references = 3-5, but may scale up for high-complexity/high-uncertainty tasks.
- Prohibit duplicate analyses (if research runs, brain consumes it; does not re-research).

## KPI targets
- reduce average agent hops per task by >=30% on routine tasks
- maintain QA pass rate
- keep critical/high incident rate non-increasing
