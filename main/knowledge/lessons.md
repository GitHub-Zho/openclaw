# lessons.md — 历史教训 + 强制规则
# main 在多 agent 工作前强制读取此文件
# learning agent 每轮在此追加新教训

## 格式规范
```
[L-NNNN] 日期 | 触发场景 | 失败模式 | 预防规则 | 分发位置
```

## 已记录教训

[L-0001] 2026-03-09 | 多 agent 轮次 | learning-loop gap：learning 产出后没有 agent 在下轮读取
→ 规则：main 每轮 §0 强制读取 knowledge/lessons.md，在 reflection 输出中引用相关教训编号
→ 分发：main AGENTS.md §Session Startup #5

[L-0002] 2026-03-09 | 任务完成声明 | builder 仅凭代码改动声称完成，未跑视觉验证
→ 规则：任何 UI/UX 声明完成前必须完成 visible-proof checklist，否则只能报告"代码已更新，视觉验证待完成"
→ 分发：web-builder SOUL.md + web-qa SOUL.md

[L-0003] 2026-03-11 | 双语任务 | EN 完成、ZH 遗漏，同一轮交付不完整
→ 规则：任何涉及双语的任务，brain spec 必须包含 EN/ZH parity matrix；builder 交付必须同时包含两种语言页面
→ 分发：web-qa SOUL.md checklist #6

[L-0004] 2026-03-09 | 需求误读 | 执行后才发现理解有误，造成浪费
→ 规则：main 每次派发前必须输出 Reflection Block，用户确认后才能执行
→ 分发：main AGENTS.md §Reflection Block

[L-0005] 2026-03-09 | 任务范围 | 简单单文件修改被当成 full loop 处理，浪费资源
→ 规则：所有任务必须先经过 TYPE 分类，TYPE-S 走快速路径，TYPE-M/C 走完整 loop
→ 分发：main AGENTS.md §Task Classification

[L-0006] 2026-03-11 | QA | executor 和 brain spec 产生偏差，但 qa 直接做实质性审核，跳过了对齐检查
→ 规则：qa 必须先做 Layer 0 对齐检查（brain spec vs executor 实现），PASS 后才做 Layer 1 实质性 QA
→ 分发：web-qa SOUL.md（两层 QA）

[L-0007] 2026-03-11 | 开发注释泄露 | 开发说明文字出现在生产页面正文中（如"V3 Experience Rebuild"）
→ 规则：executor 每次 build 前必须 grep 源文件检查；quality-gate.mjs 已包含此检查
→ 分发：web-builder SOUL.md + scripts/quality-gate.mjs

[L-0008] 2026-03-09 | 学习输出格式 | learning 只输出"建议修改"，main 审核后还要自己再翻译成文件内容
→ 规则：learning 必须输出可直接写入的文件内容（完整 diff 或完整替换文本），main 只做 yes/no 决策
→ 分发：learning AGENTS.md

## 待分发确认

以上所有教训已分发到对应 agent 的治理文件中。新教训添加时必须同时标注分发位置。

[L-0009] 2026-03-17 | 网站部署任务 | 使用错误源分支(origin/test)代替用户指定的(test/site-restructure)，3次错误后才修正
→ 规则：当用户指定具体版本/URL/分支时，必须使用该精确来源。无论是否"确定"等价，必须用 diff 验证全部文件，并在 Reflection Block 中写出验证结果。自信不能替代验证。
→ 分发位置：main SOUL.md（"Use exact source" + "Confidence is not verification"）+ main AGENTS.md（"Use exact specified sources"）
→ 验证方式：Reflection Block 中必须包含 diff 验证证据

[L-0010] 2026-03-17 | 网站部署任务 | 推送后未验证线上结果就声称完成，用户发现 FAQ 手风琴坏了
→ 规则：每次部署后必须：(a) fetch URL 确认关键文本/结构 (b) 对照参考版本检查所有可交互元素（手风琴、轮播、导航）(c) 如涉及 CSS 改动，diff 产出样式与参考版本样式。验证证据必须在完成声明中列出。
→ 分发位置：main SOUL.md（"Verify before claiming done"）+ main AGENTS.md（"Post-deploy verification is mandatory"）
→ 验证方式：完成声明中必须包含逐项验证清单

[L-0011] 2026-03-17 | 学习流程 | learning agent 只在用户提醒后才启动，用户不得不充当监督者推动学习
→ 规则：main 检测到被纠正/重做/自发现错误时，必须自动 spawn learning agent，不等用户指示
→ 分发位置：main AGENTS.md（"Auto-Learning Triggers" 节）+ main SOUL.md（"Learn without being told"）
→ 验证方式：下次被纠正时检查是否自动触发了 learning

[L-0012] 2026-03-17 | 网站部署任务 | main 跳过 TYPE 分类和 Reflection Block，直接自己执行 TYPE-M 任务导致连环错误
→ 规则：TYPE 分类是强制步骤，必须在做任何工作之前输出。TYPE-M 任务 main 不可自己执行，必须分配给子 agent。
→ 分发位置：main AGENTS.md（TYPE classification enforcement + TYPE-M dispatch rule）
→ 验证方式：检查 main 的回复是否在执行前包含 TYPE 分类和 Reflection Block

[L-0013] 2026-03-17 | 纠错流程 | 用户指出 bug A 后，main 修复 A 但未重新验证更早的根因 B，导致 B 持续存在直到用户再次提出
→ 规则：每次基于用户纠错做修改后，必须回溯该任务的所有已知问题清单，逐一验证是否仍然存在。"修了A"不等于"检查了B"。
→ 分发位置：main SOUL.md（"Fix the forest, not just the tree"）
→ 验证方式：纠错后的完成声明中需列出"检查项清单及状态"
