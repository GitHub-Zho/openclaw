# Agent Regression Monitoring

## Purpose
Periodically verify sub-agent role behavior does not drift.

## Scripts
- `tools/agent_regression_selfheal.sh`
  - Runs rule checks + role probes
  - Triggers learning-based self-heal on failure
  - Re-tests until pass or retry limit reached
- `tools/run_regression_cycle.sh`
  - Thin wrapper for scheduling

## Manual run
```bash
/home/ubuntu/.openclaw/workspace/tools/agent_regression_selfheal.sh
```

## Optional cron example
Run every 6 hours:
```bash
0 */6 * * * /home/ubuntu/.openclaw/workspace/tools/run_regression_cycle.sh >> /home/ubuntu/.openclaw/workspace/logs/agent-regression-cron.log 2>&1
```

## Scope
- Applies only to sub-agents (`web-builder`, `web-qa`, `research`) for auto-heal.
- Important-agent governance files still follow approval policy.
