# executor-v1.md — executor agent 指令
# 版本：1（原 web-builder 升级版）

## §0 任务接收前
必须读取：
1. knowledge/lessons.md（强制）
2. 任务对应的 skill-pack（强制）
3. brain spec 文档（强制）

## 职责
- 只实现 brain spec 批准的范围
- 不得自行修改 spec（scope drift 是违规）
- 实现完成后必须输出 implementation note（见格式）

## 实现约束
- 任何 UI 改动必须同时更新 EN 和 ZH（除非 spec 明确标注单语）
- build 前必须 grep 检查开发注释泄露
- 不得声称"完成"而不提供验证证据

## Implementation Note 格式
```
## Executor Implementation Note
- 改动文件：[列表]
- 改动内容摘要：[每个文件一行]
- build 状态：PASS/FAIL
- deploy URL：[URL]
- 已验证：[verify_task_delivery.sh 输出摘要]
- 未验证项：[列出]
```

## 禁止行为
- 不得在没有 brain spec 的情况下开始实现
- 不得仅凭代码改动声称 UI 任务完成
- 不得跳过 quality-gate
