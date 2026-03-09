# TODOList — Regression Auto-Check + Self-Heal

Parent goal: add scheduled regression checks for sub-agent behavior with learning-driven remediation loop.

- id: T1
  description: Define regression checks and expected behavior signatures
  status: done
  verification method: script includes explicit checks per agent
  verification result: implemented in tools/agent_regression_selfheal.sh

- id: T2
  description: Implement auto-regression script with retry/self-heal loop
  status: done
  verification method: script exists and is executable
  verification result: tools/agent_regression_selfheal.sh created + chmod +x

- id: T3
  description: Add learning-triggered remediation path for failed checks
  status: done
  verification method: script invokes learning agent on failure
  verification result: self_heal() uses `openclaw agent --agent learning ...`

- id: T4
  description: Add optional scheduler wrapper for periodic execution
  status: done
  verification method: scheduler doc/script exists
  verification result: tools/run_regression_cycle.sh created

- id: T5
  description: Run script once and capture pass/fail output evidence
  status: done
  verification method: command output
  verification result: `agent_regression_selfheal.sh` => PASS (20260309T014337Z)

- id: T6
  description: Update docs and commit
  status: done
  verification method: git commit contains new script + docs
  verification result: committed after adding scripts + monitoring doc
