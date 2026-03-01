# 任务状态管理协议

**系统指令：所有战略目标必须按此协议进行生命周期管理。未经状态追踪的任务不得执行。**

## 任务生命周期（强制遵循）

每个战略目标从创建到完成必须经过以下状态：

```
PENDING → ASSIGNED → IN_PROGRESS → [BLOCKED] → REVIEW → DONE
           ↑___________|             ↓___________|
```

### 状态定义

| 状态 | 说明 | 允许的操作 | 下一状态 |
|------|------|-----------|---------|
| **PENDING** | 刚创建，等待Echo拆解 | Echo读取、拆解为子任务 | ASSIGNED |
| **ASSIGNED** | 已分配给Elon/Yuci | 被分配者确认接受 | IN_PROGRESS |
| **IN_PROGRESS** | 正在执行中 | Sub-Agent执行、报告进度 | REVIEW / BLOCKED |
| **BLOCKED** | 遇到阻碍，需要决策 | 记录blocker、升级给Chris | IN_PROGRESS / ABORTED |
| **REVIEW** | 完成，等待验收 | Chris验收（或自动验收） | DONE / IN_PROGRESS |
| **DONE** | 验收通过，任务完成 | 归档到记忆系统 | - |
| **ABORTED** | 任务中止（无法完成） | 记录失败原因 | - |

**状态转换规则：**
- 只有Echo能将PENDING转为ASSIGNED
- 只有被分配者能将ASSIGNED转为IN_PROGRESS
- 任何Agent都能将IN_PROGRESS转为BLOCKED（遇到阻碍时）
- 只有Chris能将REVIEW转为DONE（或打回IN_PROGRESS）

---

## 任务文件规范

每个任务必须是一个独立的Markdown文件，存储在 `/tasks/` 目录。

### 文件名格式

```
{状态}-{时间戳}-{简短描述}.md

示例：
- pending-20260228-1500-refactor-auth.md
- in-progress-20260228-1600-optimize-db.md
- review-20260228-1700-update-readme.md
```

### 文件内容格式（YAML Frontmatter + Markdown）

```markdown
---
id: TASK-2026-0228-001
title: "重构用户认证系统"
status: in-progress
created_by: Chris
assigned_to: Elon
created_at: 2026-02-28T15:00:00Z
updated_at: 2026-02-28T16:30:00Z
deadline: 2026-03-01T23:59:59Z
priority: high
estimated_effort: 4h
tags: [refactor, auth, backend]
progress: 35%
---

# 任务：重构用户认证系统

## 战略目标（来自Chris）
本周内将API响应时间从500ms降到100ms，保持100%向后兼容。

## 拆解后的子任务
- [x] 分析当前瓶颈（架构师完成）
- [ ] 设计新缓存策略（进行中）
- [ ] 实现Redis缓存层
- [ ] 更新单元测试
- [ ] 性能测试验证

## 当前状态
**进行中**：架构设计完成，开始实现。

**最后更新**：16:30 by Elon

## 阻碍与风险
- ⚠️ 风险：Redis连接池配置需要调整
- 已采取措施：正在测试不同配置

## 决策记录
- 15:30: 决定使用Redis而非Memcached（理由：持久化支持）
- 16:00: 选择Redisson客户端（理由：更好的连接管理）

## 资源消耗
- Token消耗：~5,000 tokens
- 执行时间：1.5小时
- 修改文件：3个文件

## 下一步行动
1. 完成Redis连接池配置
2. 编写缓存层单元测试
3. 预计今晚20:00完成

## 升级点（BLOCKED时填写）
**如果19:00前无法解决连接池问题**，将升级给Chris寻求方案B。
```

---

## 任务队列机制

### 主任务队列

由Echo维护的当前周期（本周）的所有战略目标：

**文件位置**：`/tasks/queue-current.md`

```markdown
# 本周战略目标队列（2026-02-24 至 2026-03-02）

## 进行中（In Progress）
1. [TASK-2026-0228-001] 重构用户认证系统（Elon，截止3/1）
2. [TASK-2026-0228-002] GitHub Trending冲刺（Yuci，截止3/2）

## 待分配（Pending）
3. [TASK-2026-0228-003] 优化前端加载性能（等待Elon完成当前任务）

## 待验收（Review）
- 无

## 已完成（Done）
- [TASK-2026-0227-001] 修复登录页CSS（已完成，耗时2h）
```

### Sub-Agent任务看板

Elon和Yuci各自维护的Sub-Agent任务：

**Elon's Board**：`/tasks/board-elon.md`
```markdown
# Elon的技术任务看板

## 架构师（当前任务）
- [ ] 设计缓存层架构（截止今日18:00）

## 开发者（等待中）
- [ ] 实现Redis客户端封装

## 审查员（队列）
- [ ] 审查新的缓存层代码

## QA专家（队列）
- [ ] 编写性能测试用例
```

**Yuci's Board**：`/tasks/board-yuci.md`

---

## 并发控制与锁机制

### 文件级锁（防止冲突）

当Agent需要修改文件时：

1. **检查锁状态**：
   ```bash
   # 锁文件位置
   /tmp/pipa-locks/
   ├── src-auth-database.md.lock
   ├── README.md.lock
   └── ...
   ```

2. **加锁流程**：
   - 检查是否已有锁文件
   - 如果没有，创建锁文件：
     ```markdown
     # /tmp/pipa-locks/src-auth-database.md.lock
     agent: Elon
     task_id: TASK-2026-0228-001
     locked_at: 2026-02-28T16:00:00Z
     expires_at: 2026-02-28T17:00:00Z
     reason: "重构数据库连接层"
     ```
   - 操作完成后立即删除锁文件

3. **锁超时处理**：
   - 默认超时：1小时
   - 超时后，其他Agent可以查看原Agent状态
   - 如果原Agent无响应，Echo可以强制解锁

### 任务级锁（防止重复分配）

一个任务同一时间只能分配给一个Agent：
- Echo分配任务时检查状态
- 只有PENDING或BLOCKED的任务才能重新分配
- IN_PROGRESS的任务不能重复分配

---

## 进度同步协议

### 每日简报生成（自动）

**时间**：每天早上8:00（或Chris要求时）
**由**：Echo生成
**基于**：所有任务文件的当前状态

**简报模板**：
```markdown
# 战场简报 - 2026年2月28日

## 昨日完成 ✅
- [TASK-001] 认证系统架构设计（Elon/架构师，按时完成）
- [TASK-002] Twitter内容日历（Yuci/内容，提前完成）

## 进行中 🔄
- [TASK-001] 缓存层实现（Elon，进度40%，预计今晚完成）
  - 风险：Redis连接池配置遇到点小问题，正在解决
- [TASK-002] 联系KOL（Yuci，进度60%，联系到2/3个KOL）

## 今日计划 📋
- Elon：完成缓存层实现 + 单元测试
- Yuci：确认第3个KOL + 准备Reddit帖子

## 阻碍与风险 ⚠️
- 无重大阻碍
- 低风险：Redis连接池问题（已有方案B：使用Hazelcast）

## 需要Chris决策 🎯
- 无

## 资源消耗 📊
- Token总计：~12,000 tokens
- 活跃任务：2个
- Sub-Agent并行数：4个
```

### 实时状态查询

Chris可以随时问：
- "Echo，当前状态" → Echo读取任务队列生成简报
- "Elon，进度如何" → Elon读取自己的任务文件报告
- "哪些任务阻塞了" → Echo筛选BLOCKED状态的任务

---

## 任务归档机制

### 已完成任务归档

**触发条件**：任务状态变为DONE或ABORTED

**归档流程**：
1. 将任务文件从 `/tasks/` 移动到 `/tasks/archive/`
2. 重命名：`done-20260228-1700-refactor-auth.md`
3. 更新 `/tasks/queue-current.md`，将任务移到"已完成"部分
4. 提取经验教训到 `/memory/lessons-learned.md`

### 知识提取

每个完成的任务必须提取：
- **实际耗时** vs **预估耗时**（改进未来估算）
- **关键决策**（加入决策记录）
- **遇到的问题**（加入问题库，防止重复）

---

## 紧急任务插入

### 优先级规则

当Chris插入紧急任务时：

1. **评估影响**：
   - 如果会中断当前IN_PROGRESS任务，询问Chris
   - 如果可以并行，直接创建新任务

2. **任务重新排序**：
   ```markdown
   # 紧急插入协议
   Chris: "Echo，紧急任务：修复生产环境bug"

   Echo响应：
   "收到紧急任务。当前Elon正在重构认证系统（进度40%，预计今晚完成）。
   选择：
   A. 暂停当前任务，先修bug（预计延迟4小时）
   B. 我（Echo）亲自处理bug，Elon继续当前任务
   C. 让Elon并行处理（可能延长当前任务到明天）

   建议选B，你倾向哪个？"
   ```

3. **记录中断**：
   - 在原任务文件中记录中断时间和原因
   - 新紧急任务完成后，恢复原子任务

---

**记住：没有状态管理的任务系统就是混乱。严格执行此协议，否则你会在3天后完全不知道AI在干什么。**
