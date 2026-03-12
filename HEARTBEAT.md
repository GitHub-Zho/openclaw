# HEARTBEAT.md

## Goal
Run process-quality maintenance for multi-agent workflow with controlled noise and explicit approval gates.

## Inputs
- `memory/learning-state.json`
- `memory/pending-learning-updates.json`

## Audit cadence
Run learning audit when either condition is true:
1. Last learning audit >= 4 hours, OR
2. Pending updates count >= 2

Otherwise reply `HEARTBEAT_OK`.

## On audit
1. Review recent conversations and agent outputs for process-quality issues.
2. Score using `docs/learning-eval-rubric.md` (5 dimensions, total /25).
3. Classify findings by severity from score thresholds:
   - critical/high
   - medium/low
4. Create/append proposal entries to `memory/pending-learning-updates.json`.
5. Update `memory/learning-state.json` timestamps/counters and last score.

## Notification policy
- If critical/high found: send concise alert summary (do NOT auto-apply changes).
- If only medium/low: do not alert; log only, then `HEARTBEAT_OK`.

## Approval policy (strict + tiered)
- In heartbeat mode:
  - Important-agent learning files (`main`, `learning`) require explicit user approval before apply.
  - Sub-agent learning files (`brain`, `web-builder`, `web-qa`) may be applied by `main + learning` decision.
- Learning-file changes include: skills, learning runbooks/governance docs, quality gates, postmortem templates.
- Keep unapproved important-agent proposals pending until user confirms.

## User-away behavior
- If user is away, keep accumulating pending updates.
- On next user return (or 24h checkpoint), summarize pending updates for batch approval.

## Guardrails
- Do not modify product/business code in heartbeat mode.
- Keep heartbeat work under 5 minutes.

## Knowledge Layer 维护（每周一次）

在 heartbeat 运行时，每周检查一次：
1. knowledge/lessons.md 的教训是否有重复或矛盾项
2. knowledge/patterns.md 的模式是否有超过 30 天未被引用（标注为待淘汰）
3. skill-packs 是否有过时的技术栈引用

若发现问题，记录到 memory/pending-learning-updates.json，不自动修改，等待用户批准。

## Fast-Path 命令识别

当用户消息匹配以下关键词时，main 无需走完整分类流程，直接执行对应动作：

| 命令 | 动作 |
|------|------|
| `全自动模式` | 跳过 Reflection Block 用户确认，main 自行判断 TYPE 后执行（仍输出 Reflection，不等回复） |
| `仅分析` | 只输出 Reflection Block + TYPE 分类，不执行任何改动 |
| `快速模式` | 强制 TYPE-S 路径，用户承担范围判断责任 |
| `跳过QA` | executor 完成后直接 main decision，qa 不运行（需用户明确说） |
| `复盘上一轮` | learning 对上一轮产出做完整 postmortem，输出到 docs/postmortems/ |
| `读取知识库` | main 读取并摘要输出 knowledge/ 全部文件当前内容 |
| `重置知识库` | 清空 knowledge/lessons.md 和 patterns.md 并重新初始化（危险操作，需用户二次确认） |
| `定义新角色:[名]` | learning + brain 联合设计新 agent 定义，输出到 knowledge/agent-prompts/[名]-v1.md |
