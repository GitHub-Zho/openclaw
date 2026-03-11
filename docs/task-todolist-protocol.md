# Task TODOList Protocol (Mandatory)

Purpose: prevent "claimed done but not actually done" and reduce loss from long conversations.

## Rules
1. For every non-trivial task, create a TODO list before execution.
2. Split big goals into small verifiable sub-tasks.
3. Keep parent-child structure:
   - parent = user goal
   - children = decomposed implementation steps
4. A task can be marked complete only after verification evidence exists.
5. Never remove unchecked tasks from the list.
6. Keep TODO updated after each completed sub-task.
7. Final completion claim requires all TODO items verified complete.

## Required fields per TODO item
- id
- description
- status: `pending | in_progress | done`
- verification method
- verification result

## Suggested file path
- `docs/todolists/<date>-<task-slug>.md`

## Verification examples
- command output
- file diff confirmation
- deployed URL check
- loop integrity check (`verify_agent_loop.sh`)
- visible-state proof for UX claims (snapshot/screenshot from current URL + interaction evidence)

## Extra rule for visual/interaction tasks
- Do not mark a visual/interaction item `done` unless user-visible evidence exists.
- Evidence must come from current production URL (fresh open), not stale tab references.
- If evidence conflicts (e.g., user says not visible), downgrade status to `in_progress` and re-verify.
