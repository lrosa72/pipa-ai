# 项目上下文地图

## 项目基本信息
**项目名称**: Pipa.ai
**愿景**: 构建硅基公司，让AI自主运行项目
**当前阶段**: 基础设施搭建（第1周）
**技术栈**: Markdown + Shell + AI Agent框架

## 核心模块
| 模块 | 路径 | 负责人 | 状态 |
|------|------|--------|------|
| Agent核心 | `prompts-core/` | Echo/Elon/Yuci | 已完成 |
| 角色扮演 | `prompts-role/` | Echo/Elon/Yuci | 已完成 |
| Sub-Agent | `sub-agents/` | 各Agent | 已完成 |
| 工作流 | `workflows/` | Echo | 新增安全协议 |
| 任务系统 | `tasks/` | Echo | 初始化中 |
| 记忆系统 | `memory/` | Echo | 初始化中 |

## 关键约束（Chris设定）
- 优先使用现有工具，不引入复杂依赖
- 安全边界不可违背
- 所有操作必须记录日志

## 最近变更
- 2026-02-28: 添加安全边界协议（safety-guardrails.md）
- 2026-02-28: 添加状态管理协议（state-management.md）
- 2026-02-28: 添加记忆协议（memory-protocol.md）
- 2026-02-28: 初始化任务队列和记忆系统
