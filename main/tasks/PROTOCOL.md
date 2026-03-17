# Task Protocol

## For Main (Dispatcher)

### Creating a Task
1. Assign next ID: T001, T002, ...  (read todolist.md to find next)
2. Create folder: `tasks/<ID>/`
3. Write `tasks/<ID>/brief.md` with:
   - **Objective:** what needs to be done
   - **Context:** relevant background
   - **Assigned to:** which agent(s)
   - **Expected output:** what the report should contain
   - **Dependencies:** any tasks that must complete first (or "none")
4. Update `tasks/todolist.md` — add row with status ⏳
5. Spawn the assigned agent with task instruction:
   ```
   Read tasks/<ID>/brief.md. Complete the task described.
   Write your findings/results to tasks/<ID>/report.md.
   If you produce any artifacts (code, screenshots, data), put them in tasks/<ID>/.
   ```
6. Update todolist status to 🔄
7. **Return to user immediately** — do NOT wait for completion

### On Completion Notification
1. Update todolist status to ✅
2. Notify user: "Task <ID> complete: <one-line summary>"
3. Do NOT read the full report unless user asks

### Multi-Agent Tasks
For tasks needing collaboration (e.g., brain plans → builder executes):
1. Create ONE task ID
2. Spawn brain first with: "Plan this task, write plan to tasks/<ID>/plan.md"
3. When brain completes, spawn the executor with: "Read tasks/<ID>/plan.md and brief.md, implement, write report"
4. Todolist shows the current active agent

### When User Asks "todolist" / "status" / "任务进度"
1. Read `tasks/todolist.md`
2. For any 🔄 tasks, check sub-agent status via `subagents list`
3. Report current state

### When User Says "show me T00X" / "看看报告"
1. Read `tasks/<ID>/report.md`
2. Give user a concise summary (not the raw file)
3. If user confirms they've reviewed it, mark as 📖

### Archiving
When user confirms a ✅ task is reviewed:
1. Mark as 📖 read
2. When convenient, move row to "Completed Tasks" section → 📦

## For Sub-Agents (Workers)

### When Spawned with a Task
1. Read the brief: `tasks/<ID>/brief.md`
2. Do the work (research, analysis, coding, review — whatever your role is)
3. Write results to `tasks/<ID>/report.md` using this format:

```markdown
# Task <ID> Report

**Agent:** <your role>
**Date:** <date>
**Status:** Complete / Partial (explain why)

## Summary
<2-3 sentence executive summary>

## Findings / Results
<detailed content>

## Recommendations
<if applicable>

## Artifacts
<list any files created, with paths>
```

4. If the task needs another agent to continue, note it in the report under "Next Steps"
5. Do NOT update todolist.md yourself — main handles that

### Collaboration
- If your brief says "read plan.md first", read `tasks/<ID>/plan.md` before starting
- If you need info from another task, reference it by ID (e.g., "see T003 report")
- Write your part of the work, don't try to do other agents' jobs
