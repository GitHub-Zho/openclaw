# lessons.md — 历史教训 + 强制规则
# 每轮开始时 main 强制读取此文件
# learning agent 每轮在此追加新教训

## 格式规范
每条教训使用以下结构：
```
[L-NNNN] 日期 | 触发场景 | 失败模式 | 预防规则 | 验证方式
```

## 已记录教训

[L-0001] 2026-03-09 | 多 agent 轮次 | learning-loop gap：learning 产出后没有 agent 在下轮读取
→ 规则：main 每轮 §0 强制读取 knowledge/lessons.md，在 reflection 输出中引用相关教训编号

[L-0002] 2026-03-09 | 任务完成声明 | builder 仅凭代码改动声称完成，未跑视觉验证
→ 规则：任何 UI/UX 声明完成前必须完成 web-qa-visible-proof-checklist.md 所有项，否则只能报告"代码已更新，视觉验证待完成"

[L-0003] 2026-03-11 | 双语任务 | EN 完成、ZH 遗漏，同一轮交付不完整
→ 规则：任何涉及双语的任务，brain spec 必须包含 EN/ZH parity matrix；executor 交付必须同时包含两种语言页面

[L-0004] 2026-03-09 | 需求误读 | 执行后才发现理解有误，造成浪费
→ 规则：main 每次派发前必须输出 Reflection Block（见 §3），用户确认后才能执行

[L-0005] 2026-03-09 | 任务范围 | 简单单文件修改被当成 full loop 处理，浪费资源
→ 规则：所有任务必须先经过 TYPE 分类（见 §4），TYPE-S 走快速路径，TYPE-M/C 走完整 loop

[L-0006] 2026-03-11 | QA | executor 和 brain spec 产生偏差，但 qa 直接做实质性审核，跳过了对齐检查
→ 规则：qa 必须先做 Layer 0 对齐检查（brain spec vs executor 实现），PASS 后才做 Layer 1 实质性 QA

[L-0007] 2026-03-11 | 开发注释泄露 | 开发说明文字出现在生产页面正文中（如"V3 Experience Rebuild"）
→ 规则：executor 每次 build 前必须 grep 源文件检查是否有开发注释泄露到内容区；quality-gate.mjs 增加此检查

[L-0008] 2026-03-09 | 学习输出格式 | learning 只输出"建议修改"，main 审核后还要自己再翻译成文件内容
→ 规则：learning 必须输出可直接写入的文件内容（完整 diff 或完整替换文本），main 只做 yes/no 决策
