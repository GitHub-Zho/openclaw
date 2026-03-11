# TODOList — Delivery hallucination root-cause fix

- id: T1
  description: Create postmortem for the false-delivery/hallucination incident with concrete root causes
  status: done
  verification method: new postmortem file exists with evidence + rule updates
  verification result: Added postmortem docs/postmortems/2026-03-11-delivery-hallucination.md with root cause + corrective rules.

- id: T2
  description: Patch process docs with anti-hallucination gates (live URL verification, stale-tab ban, proof-first claim policy)
  status: done
  verification method: docs updated with explicit checklist items
  verification result: Patched request-preflight and task-todolist protocols with anti-hallucination visible-proof gates.

- id: T3
  description: Add QA design checklist for web-qa style review to enforce visible-interaction validation
  status: done
  verification method: new checklist doc added and referenced
  verification result: Added docs/web-qa-visible-proof-checklist.md for explicit UX verification discipline.

- id: T4
  description: Verify delivery gate and commit
  status: done
  verification method: verify_task_delivery.sh + git commit
  verification result: verify_task_delivery first failed on unresolved T4, then passed after closure.
