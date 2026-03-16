# patterns.md — 成功模式沉淀
# learning agent 在每轮产出中追加经过验证的成功模式

## 格式规范
```
[P-NNNN] 日期 | 场景 | 模式描述 | 适用条件 | 已验证次数
```

## 已记录模式

[P-0001] 2026-03-09 | 质量门控 | verify_task_delivery.sh + handoff-log.jsonl 双重验证
→ 适用：所有 TYPE-M/C 任务；已验证 5+ 次无误报

[P-0002] 2026-03-11 | 双语交付 | 同一 Astro 组件接受 lang prop，EN/ZH 共用结构
→ 适用：bilingual Astro 页面；减少维护分叉

[P-0003] 2026-03-09 | 防幻觉 | DOM snapshot + interaction state change + screenshot 三合一证明
→ 适用：所有 UI/UX 完成声明；缺一不可
