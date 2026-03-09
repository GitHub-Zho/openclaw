# TODOList — Process Compliance Check (2026-03-09)

Parent goal: Confirm TODO protocol is actually being applied, not only documented.

- id: T1
  description: Verify a persistent task TODO directory exists
  status: done
  verification method: `ls docs/todolists`
  verification result: directory exists

- id: T2
  description: Verify protocol file exists and is committed
  status: done
  verification method: `test -f docs/task-todolist-protocol.md && git log --oneline -n 1 -- docs/task-todolist-protocol.md`
  verification result: exists and committed in 92ede9a

- id: T3
  description: Verify AGENTS/runbook reference TODO protocol
  status: done
  verification method: `grep -n "task-todolist-protocol" AGENTS.md docs/web-factory-runbook.md`
  verification result: references found in both files

- id: T4
  description: Confirm this specific user check has a concrete TODO artifact
  status: done
  verification method: presence of this file
  verification result: created at docs/todolists/2026-03-09-process-compliance-check.md

