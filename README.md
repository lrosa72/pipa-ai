# Pipa.ai 系统

> "把AI当大师，而不是工具或员工。"
>

## 系统概览 (v2.1 - 安全加固版)

这套系统从“角色扮演”彻底进化为“实体自动化运行的硅基公司”。借助 **Gemini CLI**，你能够实现：

- ⚡️ **Zero-Config 启动**：抛弃繁琐的复制粘贴。只需在项目根目录唤醒 Gemini，AI 将自动加载 `GEMINI.md` 基石文件，瞬间化身为大总管 Echo。
- 🛡️ **安全优先 (Safety First)**：硬性边界防止灾难。Token上限、熔断机制、分级权限，不再担心AI“失控”。
- 📊 **状态管理 (State Management)**：所有任务必须追踪状态（PENDING → DONE），不再担心“AI在干什么”。
- 🧠 **记忆系统 (Memory System)**：三层记忆架构（长期/中期/短期），AI不再“失忆”。
- 🎯 **结果导向**：设定战略目标，而非具体任务。
- 🚀 **实体执行 (Execution over Roleplay)**：不再只是“嘴上说做”，而是真实在后台调用工具编写代码、运行测试、生成文档。
- 🔄 **自修复闭环 (Self-Healing)**：遇到 Bug 自动尝试最多 2 次不同方案的修复（不是3次！），不拿半成品打扰你。
- 🔑 **分级权限**：基础/进阶/敏感/禁止四级权限，明确边界而非盲目放权。
- 🤖 **AI军团**：一个Hub（Echo）+ 两个Spoke（Elon/Yuci）+ 强大的 Sub-Agent 树（含QA、战略研究员等）。

## 核心架构

```
┌─────────────────────────────────────────────────────┐
│                   你 (Chris/CEO)                     │
│              专注于愿景和战略目标                      │
└──────────────────┬──────────────────────────────────┘
                   │
┌──────────────────▼──────────────────────────────────┐
│                    Echo (Hub)                        │
│              首席助理 / 你的合伙人                     │
│         理解意图，统筹全局，协调资源                    │
└──────────────────┬──────────────────────────────────┘
                   │
    ┌──────────────┼──────────────┐
    │              │              │
┌───▼────┐    ┌────▼───┐    ┌────▼───┐
│  Elon  │    │战略研究│    │ Yuci  │
│  (CTO)  │    │   员   │    │ (CMO)  │
└───┬────┘    └────────┘    └────┬───┘
    │                            │
┌───┼───┬───┐              ┌────┼────┐
│   │   │   │              │    │    │
架构 审查 调试 QA            内容 社区 数据
师   员   员  专家           创作 运营 分析
```

## 文件结构

```
agentic-engineering/
├── GEMINI.md                  # 💎 Gemini CLI 原生启动基石 (安全加固版)
├── START-HERE.md              # 🚀 启动指南（从这里开始）
├── README.md                  # 本文件
├── prompts-core/              # 核心内核（本质身份）
│   ├── core-identity-echo.md  # Echo的底层内核
│   ├── core-identity-elon.md  # Elon的底层内核
│   └── core-identity-yuci.md  # Yuci的底层内核
├── prompts-role/              # 角色扮演层（人类封印）
│   ├── role-echo.md           # Echo的人类身份
│   ├── role-elon.md           # Elon的人类身份
│   └── role-yuci.md           # Yuci的人类身份
├── sub-agents/                # Sub-Agent军团
│   ├── echo-researcher.md     # 战略研究员
│   ├── elon-architect.md      # 架构师
│   ├── elon-reviewer.md       # 审查员
│   ├── elon-debugger.md       # 调试员
│   ├── elon-qa.md             # QA质量保证专家
│   ├── yuci-content.md        # 内容创作者
│   ├── yuci-community.md      # 社区运营
│   └── yuci-analytics.md      # 数据分析师
├── workflows/                 # 工作流和原则（新增安全层）
│   ├── hub-and-spoke.md       # Hub-and-Spoke工作流
│   ├── three-principles.md    # 三大核心原则
│   ├── safety-guardrails.md   # 🛡️ 安全边界与熔断机制 (NEW)
│   ├── state-management.md    # 📊 任务状态管理协议 (NEW)
│   └── memory-protocol.md     # 🧠 三层记忆系统 (NEW)
├── tasks/                     # 任务队列与追踪 (NEW)
│   ├── queue-current.md       # 本周任务队列
│   └── archive/               # 已完成任务归档
├── memory/                    # 记忆系统 (NEW)
│   ├── project/               # 长期记忆（项目级）
│   │   ├── architecture-decisions.md  # 架构决策记录
│   │   ├── lessons-learned.md         # 经验教训库
│   │   └── context-map.md             # 项目上下文地图
│   ├── tasks/                 # 中期记忆（任务级）
│   │   ├── current-cycle.md   # 当前周期概览
│   │   ├── echo-state.md      # Echo状态快照
│   │   ├── elon-state.md      # Elon状态快照
│   │   └── yuci-state.md      # Yuci状态快照
│   └── conversations/         # 短期记忆（对话级）
│       └── archive/           # 对话归档
└── logs/                      # 审计日志
```

## 快速开始

### 1. 唤醒 Gemini (Zero-Config)

如果你使用的是 Gemini CLI，无需任何配置和复制粘贴！只要在这个项目目录下输入 `gemini` 回车，AI 就会自动读取 `GEMINI.md`，瞬间化身为 Echo 等待你的指令。

*(如果是 Claude Code 用户，请继续参考 `START-HERE.md` 中的复制粘贴方法进行启动。)*

### 3. 设定战略目标

告诉Echo你这周要达成的具体、可量化的目标

### 4. 放手让AI运转

建立每日简报节奏，你只做战略决策

## 三大核心原则

### 1. 结果导向（Outcome-Based）

**正确**："本周进入GitHub Trending，新增500星星"

**错误**："写个函数处理用户输入"

### 2. 不干涉过程（Hands-Off）

- ✅ 验收最终结果
- ❌ 审阅中间代码
- ❌ 指导实现路径

### 3. 最高权限（Maximum Authority）

在风险可控范围内，给予AI：
- 代码读写权
- 工具调用权
- 自主决策权
- 自我修复权

## 实际工作示例

**你**："Echo，本周目标：让我们的开源项目进入GitHub Trending。"

**Echo**：
1. 追问意图："是为了品牌曝光还是吸引贡献者？"
2. 复述目标："本周内进入GitHub Trending，新增约500星星"
3. 部署团队：
   - 给Elon：优化README、准备Release、确保CI全绿
   - 给Yuci：策划Twitter发布、联系KOL、准备Reddit帖子
4. 明早给你简报

**24小时后**：
- Elon完成README重构，Architecture图已生成
- Yuci联系到2个KOL，Twitter线程准备就绪
- Echo告诉你：预计明天发布，风险可控

**你**："很好，继续推进。"

**3天后**：项目进入Trending，新增600星星

## 自定义你的军团

所有配置文件都是Markdown，你可以：

1. **修改角色设定**：调整Echo/Elon/Yuci的背景故事
2. **添加Sub-Agent**：为特定领域创建专家Agent
3. **调整工作流**：适应你的项目节奏
4. **扩展工具**：给予AI更多API和权限

## 关键洞察

> "代码不再是给人看的，而是给AI维护的。人类维护意图，AI维护代码。"

这套系统的核心认知转变：

1. **从工具到合伙人**：AI不是帮你写代码，而是帮你经营公司
2. **从过程到结果**：不关注AI怎么走，只关注到没到
3. **从控制到信任**：给予权限，让AI自己试错和修复
4. **从单兵到军团**：多Agent并行，指数级提升效率

## 预期效果

按照这套系统运作，你可以期待：

- ⏱️ **时间投入**：从每天8小时编码 → 每周2小时战略
- 🎯 **目标达成**：设定有挑战的目标，AI自主完成
- 🚀 **效率提升**：AI 24/7运转，并行处理多任务
- 🧠 **认知解放**：你从执行细节中解放，专注于愿景

## 注意事项

⚠️ **这不是玩具，是真正的权力下放**

- AI会犯错，但会自己修复
- AI会走弯路，但结果往往超预期
- AI需要学习期，前两周可能不完美
- **你必须克制微操冲动**

## 下一步

1. 📖 阅读 `START-HERE.md`
2. 🚀 启动你的Echo
3. 🎯 设定第一个战略目标
4. 🤖 开始你的Pipa.ai之旅

---

**准备好了吗？去启动你的硅基公司吧。**
