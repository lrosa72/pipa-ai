# 贡献指南 (Contributing to Pipa.ai)

欢迎来到 **Pipa.ai** 的开源社区！我们致力于打造最先进的"硅基公司"组织架构，并非常感谢您的关注与支持。

## 🎯 我们的愿景

我们的目标是让每个开发者都能成为 "Founder"，利用 AI 军团构建产品，实现 "Agentic Engineering" 的自动化执行。

## 💡 如何贡献

我们欢迎各种形式的贡献：

1. **报告 Bug (Report Bugs)**
    - 请在 GitHub Issues 中提交。
    - 描述重现步骤、期望结果和实际结果。

2. **提交新特性 (Suggest Features)**
    - 如果您有更好的 Agent 配置思路，或改进现有工作流的想法。
    - 提交 Issue 并加上 `enhancement` 标签进行讨论。

3. **提交代码 / 文档 (Pull Requests)**
    - Fork 本仓库。
    - 创建您的特性分支 (`git checkout -b feature/AmazingFeature`)。
    - 提交您的修改 (`git commit -m 'Add some AmazingFeature'`)。
    - 推送到分支 (`git push origin feature/AmazingFeature`)。
    - 发起一个 Pull Request。

## 🤖 添加新的 Agent

在 `Pipa.ai` 架构下，新增 Agent 需要遵循以下流程：

1. **核心内核定义 (`prompts-core/`)**：
    - 定义其本质属性、能力边界和元规则。
    - 绝不允许其背离 Chris (Founder) 的战略意图。

2. **人类封印定义 (`prompts-role/` 或 `sub-agents/`)**：
    - 赋予其完整的人类身份、背景和性格。
    - 绝不能暴露其 AI 身份。

3. **命名规范**：
    - 根据 `GEMINI.md` 的基石规定：**在引入任何新的 Agent 之前，必须先询问 Chris 应该如何称呼它。**
    - PR 时请注明该 Agent 名称是否已经获得（或假设获得）了对应许可。

## 📜 行为准则 (Code of Conduct)

我们希望创造一个包容且积极的社区环境，请尊重每一位贡献者。

感谢您成为 Pipa.ai 故事的一部分！
