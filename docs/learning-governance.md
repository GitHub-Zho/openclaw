# Learning Governance (Main + Learning)

## Loop closure evidence (mandatory)
A learning-governance cycle is considered complete only when all 3 artifacts exist:
1. Learning artifact (from `workspace-learning/reports/...`)
2. Main decision record (approve/reject/revise)
3. Patch provenance list (files changed linked to incident)

No "loop complete" claim is allowed without these artifacts.

## Decision safety

### If main makes a bad decision, what happens?
- `web-qa` is limited to web output quality only (UI/UX/content/perf on deliverables).
- `learning` is the governance QA for decision/process mistakes.
- `learning` records governance incidents in postmortem with corrective rules (approval threshold, rollback criteria).

### Who improves main's decision quality?
- `learning` agent is the primary auditor of main's decision quality.
- `main` + `learning` review incidents and decide remediation.
- User has final override authority.

## Approval policy (tiered)
- **Important-agent learning files** require user approval before apply:
  - `skills/**` for `main` and `learning`
  - governance docs for `main` and `learning`
  - global quality-gate scripts affecting main behavior
- **Sub-agent learning files** (`brain`, `web-builder`, `web-qa`) can be updated by `main + learning` decision without user pre-approval.
- Any unapproved important-agent change goes to `memory/pending-learning-updates.json`.
- Pending items do not modify active behavior until approved.

## Severity routing
- **critical/high**: notify user via main and request approval.
- **medium/low**: log only; bundle for later approval.

Severity must be computed from `docs/learning-eval-rubric.md` quantitative score.

## User offline behavior
- If user is away, queue updates as pending.
- On next return (or within 24h checkpoint), main summarizes pending updates and asks for batch approval.
- Other product tasks continue normally while pending queue is untouched.

## Autonomous-task exception
- If user explicitly says "I’m away, continue autonomously", builder can continue product tasks.
- Learning/skill changes still require user approval unless user explicitly grants temporary auto-approve scope.

## Learning 产出格式规范（v2）

learning 每轮产出必须包含以下三个区块：

### 区块 A：评分
按 docs/learning-eval-rubric.md 五维度打分，输出分数和证据。

### 区块 B：可写入内容（核心升级）
learning 必须输出"可直接写入"的文件内容，而非"建议修改"。

格式：
```
## 写入建议 [编号]
目标文件：knowledge/lessons.md
操作类型：append / replace
内容：
---
[此处粘贴完整的新内容，可直接写入，无需 main 二次转换]
---
```

main 对每条写入建议输出 APPROVE / REJECT / REVISE，然后由 learning 执行文件写入。

### 区块 C：下轮注意事项
给 main 的一句话提示，在下轮 §0 读取时显示。

格式：
```
## 下轮注意
[1-3 条关键提示，main 在 §0 读取 knowledge/lessons.md 后必须在 Reflection Block 中引用]
```
