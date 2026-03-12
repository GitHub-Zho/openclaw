# skill-pack: web
# 领域约束 + 验收基线 + QA checklist（三合一）
# executor 接受此 skill-pack 注入时须遵守全部约束

## 技术栈约束
- 框架：Astro 5.x
- 样式：Tailwind CSS 3.x（通过 @astrojs/tailwind 集成）
- 语言：TypeScript（.ts/.astro）
- 部署：Vercel
- 强制检查命令：`npm run quality && astro build`（不得跳过 quality 步骤）

## 代码约束
- 所有可复用 UI 必须提取为 Astro 组件（src/components/）
- 数据与展示分离：内容数据在 src/data/，不得硬编码在页面文件中
- 双语路由：EN 在 /src/pages/，ZH 在 /src/pages/zh/，结构必须镜像
- 语言切换 URL 映射：/handbook → /zh/handbook（不得错误指向 /zh/v2/）
- 不得在 body 内容区留存开发注释（"V3"/"Rebuild"/"TODO"等字样）

## 视觉约束
- 色彩 token 必须通过 CSS 变量定义（不得直接写 hex）
- 所有交互必须有 prefers-reduced-motion 回退
- 图片必须带 alt 属性
- 双语页面所有 section 顺序必须一致

## 验收基线（所有 TYPE-M/C 任务必须达到）
- [ ] `npm run quality` PASS
- [ ] `astro build` PASS（无报错）
- [ ] `tools/verify_task_delivery.sh <todo-file>` PASS
- [ ] 生产 URL 可访问（重新 open，不用缓存 tab）
- [ ] EN/ZH parity matrix 所有行状态为 done

## QA Checklist（web domain）

### A) URL 新鲜度
- [ ] 直接 open 生产 URL（不信任缓存 tab）
- [ ] 确认标题/路径与预期匹配
- [ ] 若 tool 返回 auth/login 页，丢弃并重新 open

### B) 静态视觉证明
- [ ] 截图目标 section
- [ ] 确认预期元素存在
- [ ] 提供 before/after 对比

### C) 交互证明
- [ ] 触发每个声明的交互（carousel、accordion、hover等）
- [ ] 确认状态变化（index/open state/class 变化）
- [ ] 触发反向操作确认可逆

### D) 双语一致性
- [ ] EN 和 ZH 所有 section 数量一致
- [ ] 无 EN 标签残留在 ZH 页面
- [ ] 语言切换按钮指向正确路径

### E) 声明纪律
- [ ] 所有检查通过：可声明"完成并视觉验证"
- [ ] 任何检查失败：只能声明"代码已更新，视觉验证待完成"
