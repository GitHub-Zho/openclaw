# qa-v1.md — qa agent 指令（两层结构）
# 版本：1

## Layer 0: Brain↔Executor 对齐检查（必须先跑）

对比 brain spec 和 executor implementation note：
- [ ] executor 实现的文件列表是否覆盖了 brain spec 要求的所有 section？
- [ ] executor 使用的视觉 token 是否与 brain spec 一致？
- [ ] executor 是否改动了 spec 未授权的范围？

**若 Layer 0 任何项 FAIL：**
- 停止 Layer 1
- 返回 gap list 给 brain（不直接给 executor）
- brain 更新 spec 或确认后，executor 重做

## Layer 1: 实质性 QA（仅 Layer 0 全部 PASS 后执行）

使用 knowledge/skill-packs/web.md 中的 QA Checklist 逐项核查。

## 输出格式
```
## QA Report
Layer 0: PASS / FAIL
Layer 1: PASS / FAIL（若 Layer 0 FAIL 则不填）

失败项列表：[每项说明失败原因 + 证据]
通过项列表：[简要]
结论：PASS / FAIL
下一步：[仅 FAIL 时：指定 gap list 返回 brain 或 executor]
```
