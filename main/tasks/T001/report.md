# T001 — Failure Analysis Report: Website Deployment (2026-03-17)

**Analyst:** learning agent  
**Date:** 2026-03-17  
**Task:** Root cause analysis of 3 deployment failures; evaluate L-0009/L-0010/L-0011 coverage; identify new patterns

---

## 1. Root Cause Analysis

### Failure 1: Wrong source branch
**What happened:** User specified "djyqrfz68 preview" as base → main used `origin/test` instead of `test/site-restructure`.

**Root cause:** Assumption without verification. Main inferred that `origin/test` was equivalent to the specified preview without doing any diff. The cognitive shortcut: "I think I know what branch that preview corresponds to" replaced the required action: "I'll verify what branch that preview corresponds to."

**Aggravating factor:** The TYPE classification and Reflection Block were skipped (→ L-0012). Had main run a Reflection Block, the assumption "I'm using origin/test as base" would have been stated explicitly, giving the user a chance to catch it before any work.

---

### Failure 2: No post-deploy verification
**What happened:** Main said "已部署完成" after a successful `git push`. The FAQ accordion was visually broken. User had to send a screenshot. Only then did main diff the CSS.

**Root cause:** "Build succeeded" was conflated with "deployment is correct." Main treated the CI pipeline as a proxy for correctness, skipping actual URL verification. The specific bug (CSS: `grid-template-rows` instead of `display:none`) would have been immediately visible had main fetched the live page.

**Aggravating factor:** The verification wasn't just absent — main chose to trust its own change as correct without any external check. This is confidence bias: "I made a targeted CSS fix, so it must be right."

---

### Failure 3: Still wrong base after "fix"
**What happened:** After user pointed out the FAQ bug, main fixed the CSS — but the entire site still had `origin/test` content (not `test/site-restructure`). The root cause from Failure 1 was never addressed. User had to point it out again. Main finally did a full file diff and found 5 files with significant differences.

**Root cause:** **Correction scope was too narrow.** When user flagged the CSS bug, main treated it as an isolated problem and fixed only that symptom. Main did not re-examine whether Failure 1's root cause had ever been resolved. This is a distinct pattern from Failure 1 — it's not about choosing the wrong source initially, it's about failing to re-validate foundational assumptions when making a correction.

**This failure mode is not fully covered by L-0009.** L-0009 says "diff all files if unsure," but main wasn't unsure — main was falsely confident the source issue was already handled (or conflated "fix the CSS" with "fix everything"). The rule needs to say: **when correcting any error, re-verify all foundational premises, not just the symptom reported.**

---

### Failure 4: Learning not self-triggered
**What happened:** After 3 failures and user corrections, main did not spawn the learning agent. User had to explicitly say "learn from this."

**Root cause:** The auto-learning trigger was not internalized as a reflex. Main processed corrections as task state (retry the fix) rather than process state (this is a pattern that needs codification). The trigger should have fired on Failure 1's correction at minimum.

---

## 2. Evaluation of L-0009, L-0010, L-0011

### L-0009 — "Use exact specified sources"
**Coverage:** Partially covers Failure 1 and Failure 3, but has a critical weakness.

**Gap:** The current rule says "if you're not sure whether two sources are equivalent, diff all files first." This creates an escape hatch: if main is **confidently wrong** (as in Failure 1), the condition "if not sure" never triggers. The rule must be unconditional.

**Proposed refinement:**
```
→ 旧规则：如果不确定两个来源是否等价，先 diff 全部文件再决定。
→ 新规则：无论是否"确定"，凡用户指定了具体版本/URL/分支，必须用 git diff 或内容对比工具
  验证当前工作基础确实匹配，然后在 Reflection Block 中明确写出"我的基础来源是X，
  已验证与用户指定版本一致（diff 输出：无差异/差异列表）"。自信不能替代验证。
```

**Also missing:** L-0009 does not address Failure 3's pattern (correction scope too narrow). That needs a separate lesson.

---

### L-0010 — "Verify after deploy"
**Coverage:** Covers the core of Failure 2 adequately.

**Gap:** The rule says "fetch URL → check key content/functionality" but is vague about *what* to check. The FAQ accordion bug was a visual/interactive regression — not detectable by text content alone. The rule should explicitly include CSS rendering behavior and interactive elements.

**Proposed refinement:**
```
→ 旧规则：每次部署后必须自行验证线上结果（fetch URL → 检查关键内容/功能）
→ 新规则：每次部署后必须：
  (a) fetch 线上 URL 确认关键文本/页面结构存在
  (b) 对照参考版本，检查所有可交互元素（手风琴、轮播、导航）是否正常
  (c) 如涉及 CSS 改动，diff 线上产出的样式与参考版本的样式
  验证证据必须在完成声明中明确列出。
```

---

### L-0011 — "Auto-spawn learning on correction"
**Coverage:** Covers Failure 4 adequately. The rule is clear and specific.

**No refinement needed.** The only issue is enforcement (main didn't follow it), which is an adoption problem, not a rule problem. L-0012 (TYPE classification enforcement) addresses the meta-level skip.

---

## 3. New Patterns Not Yet Captured

### Pattern A: Correction Scope Tunnel Vision (→ Failure 3)
When a user points out error X, main fixes X but fails to re-examine whether earlier unresolved errors (Y, Z) are still present. This is distinct from L-0009 (wrong source selection) — it's about correction completeness.

**Proposed new lesson:**
```
[L-0013] 2026-03-17 | 纠错流程 | 用户指出 bug A 后，main 修复 A 但未重新验证更早的根因 B，
  导致 B 持续存在直到用户再次提出
→ 规则：每次基于用户纠错做修改后，必须回溯该任务的所有已知问题清单（包括前几轮
  尚未确认关闭的问题），逐一验证是否仍然存在，而不仅仅修复当前报告的症状。
  "修了A"不等于"检查了B"。
→ 分发位置：main SOUL.md（纠错时验证全局，而非仅修症状）+ main AGENTS.md（纠错后全面检查）
→ 验证方式：纠错后的完成声明中需列出"检查项清单及状态"，不只说"已修复X"
```

### Pattern B: Confidence Bypass (→ Failures 1 and 2)
Underlying both Failure 1 (confident about branch) and Failure 2 (confident about CSS fix) is the same meta-pattern: main uses internal confidence as a substitute for external verification. "I think X is right" → skip check → X is wrong.

This is partially covered by SOUL.md's "Verify before claiming done" but is not operationalized as a concrete checklist trigger. L-0009 and L-0010 address specific instances; a general rule about confidence not being a skip condition would be valuable.

**Proposed addition to SOUL.md:**
```
- **Confidence is not verification.** Being sure something is correct is not the same as having 
  checked that it is. When making any claim about external state (a URL works, a branch is 
  correct, a feature is visible), verify externally. Self-assurance is not evidence.
```

---

## 4. Summary of Proposed Changes

| # | Target | Action |
|---|--------|--------|
| L-0009 | knowledge/lessons.md | Refine: remove "if unsure" escape hatch; make verification unconditional; add Reflection Block requirement |
| L-0010 | knowledge/lessons.md | Refine: add CSS/interactive element verification to post-deploy checklist |
| L-0011 | No change needed | Rule is adequate; adoption is the issue |
| L-0013 (new) | knowledge/lessons.md | Add: correction scope must cover all open issues, not just the symptom reported |
| SOUL.md | confidence bypass | Add: "Confidence is not verification" principle |

---

## 5. Priority

1. **L-0009 refinement** (high) — the escape hatch is actively dangerous and was the direct cause of 2 of 3 failures
2. **L-0013 (new)** (high) — not covered anywhere; explains the "3rd failure after fixes" pattern
3. **L-0010 refinement** (medium) — current rule is good but underspecified
4. **SOUL.md confidence bypass** (medium) — reinforces root cause across future edge cases

---

*Report complete. Main should review proposed rule texts above and decide yes/no on each before applying to governance files.*
