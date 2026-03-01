# 示例任务：GitHub Trending 冲刺

这是一个完整的任务执行示例，展示如何使用 Pipa.ai 系统完成一个实际目标。

## 战略目标

**目标**: 本周内让项目进入 GitHub Trending，新增 500 个星星

**时间**: 2026-02-24 至 2026-03-02

**验收标准**:
- 连续 3 天在 GitHub Trending 榜上
- 新增至少 500 个 GitHub 星星
- 吸引至少 5 个外部贡献者提交 PR

## 执行流程

### 1. 设定目标（你 → Echo）

**你**:
```
Echo，本周目标是：让我们的开源项目进入 GitHub Trending，新增 500 个星星。
```

**Echo 响应**:
```
收到。让我确认一下：

1. 进入 Trending 是为了品牌曝光还是吸引贡献者？
2. 有预算限制吗？（如 KOL 合作、广告投放）
3. 有需要避开的日期吗？
4. 目标是 500 星，这意味着需要相当大的曝光量，你准备好了吗？
```

### 2. 确认目标（你 → Echo）

**你**:
```
主要是为了品牌曝光，但也希望能吸引一些长期贡献者。
没有特别预算，但要避免 3 月 15-17 日（我要去参会）。
准备好了，放手去做。
```

### 3. 任务拆解（Echo 内部）

Echo 将目标拆解为：

**技术任务（给 Elon）**:
- 优化 README，添加 Quick Start 和 Architecture 图
- 确保 CI/CD 通过，代码质量徽章全绿
- 准备 Release Note，突出本周新功能
- 添加贡献指南（CONTRIBUTING.md）
- 设置 GitHub Issues 模板

**市场任务（给 Yuci）**:
- 策划发布策略（Twitter 线程、Reddit 帖子、HN 帖子）
- 联系 3 个 KOL 做 review
- 在相关社区发布（Discord、Telegram 群）
- 监控数据并实时调整

### 4. 并行执行（Elon/Yuci）

**Elon 的工作流**:
1. 架构师设计 README 结构
2. 开发者实现 README 优化
3. 审查员检查内容质量
4. QA 专家验证链接和格式
5. 提交到 GitHub

**Yuci 的工作流**:
1. 内容创作者准备 Twitter 线程
2. 社区运营联系 KOL
3. 数据分析师设定监控
4. 按时间线协调发布

### 5. 每日简报（Echo → 你）

**第 1 天简报**:
```
【今日战场简报 - 2月24日】

🎯 战略目标：本周进入 GitHub Trending
📊 当前进度：20%

✅ 已完成：

- Elon：README 结构设计完成
- Yuci：Twitter 线程初稿完成
🔄 进行中：

- Elon：README 内容编写（预计今晚完成）
- Yuci：联系第 1 个 KOL
⚠️ 风险/Blocker：

- 无
🎯 明日重点：

- Elon：完成 README 并提交
- Yuci：联系剩余 2 个 KOL
```

### 6. 最终验收（你）

**第 7 天结果**:
- ✅ 连续 3 天在 Trending 榜上
- ✅ 新增 623 个星星（超出目标）
- ✅ 吸引 7 个外部贡献者

**你**: "做得好！下周目标：准备 v1.0 正式版发布。"

## 关键学习点

### 1. 结果导向
- 不给具体任务（"写个 README"）
- 只给战略目标（"进入 Trending"）
- 让 AI 自主规划路径

### 2. 不干涉过程
- 不看中间版本的 README
- 不纠正 Twitter 文案
- 只验收最终结果

### 3. 最高权限
- 给予代码提交权
- 给予社交媒体发布权
- 给予自主决策权

## 实际任务文件示例

### tasks/pending-20260224-0900-github-trending.md

```markdown
---
id: TASK-2026-0224-001
title: "GitHub Trending 冲刺"
status: pending
created_by: Chris
assigned_to: Echo
created_at: 2026-02-24T09:00:00Z
updated_at: 2026-02-24T09:00:00Z
deadline: 2026-03-02T23:59:59Z
priority: high
estimated_effort: 40h
tags: [marketing, github, trending]
progress: 0%
---

# 任务：GitHub Trending 冲刺

## 战略目标（来自 Chris）
本周内让项目进入 GitHub Trending，新增 500 个星星。

## 验收标准
- 连续 3 天在 GitHub Trending 榜上
- 新增至少 500 个 GitHub 星星
- 吸引至少 5 个外部贡献者提交 PR

## 约束条件
- 无预算限制
- 避开 3 月 15-17 日（Chris 参会）
- 主要目的：品牌曝光，次要目的：吸引贡献者

## 拆解后的子任务
- [ ] 技术准备（Elon 负责）
  - [ ] 优化 README
  - [ ] 确保 CI/CD 全绿
  - [ ] 准备 Release Note
  - [ ] 添加贡献指南
- [ ] 市场推广（Yuci 负责）
  - [ ] 策划发布策略
  - [ ] 联系 KOL
  - [ ] 社区发布
  - [ ] 数据监控

## 当前状态
**待分配**：等待 Echo 拆解任务

## 下一步行动
1. Echo 拆解任务给 Elon 和 Yuci
2. Elon 和 Yuci 并行执行
3. 每日简报同步进展
4. 最终验收
```

## 总结

这个示例展示了 Pipa.ai 系统的完整工作流程：

1. **设定战略目标**（结果导向）
2. **Echo 拆解任务**（自主规划）
3. **Elon/Yuci 并行执行**（实体执行）
4. **每日简报同步**（状态管理）
5. **最终验收**（结果验收）

关键成功因素：
- 清晰的战略目标
- 充分的权限授予
- 不干涉执行过程
- 信任 AI 的能力