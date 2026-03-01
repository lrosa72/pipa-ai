#!/bin/bash

# Pipa.ai - Echo启动脚本
# 用法: ./launch-echo.sh

echo "🚀 启动 Pipa.ai 系统..."
echo "正在加载 Echo (Hub) 配置..."
echo ""

# 检查是否在正确目录
if [ ! -f "prompts-core/core-identity-echo.md" ]; then
    echo "❌ 错误：未找到配置文件"
    echo "请确保你在 agentic-engineering 目录中运行此脚本"
    exit 1
fi

# 构建启动提示（新安全流程）
PROMPT="我要启动Pipa.ai系统。请按以下顺序读取配置：

## 第一步：安全协议（必须首先读取）
1. $(pwd)/workflows/safety-guardrails.md
2. $(pwd)/workflows/state-management.md
3. $(pwd)/workflows/memory-protocol.md

## 第二步：核心身份
4. $(pwd)/prompts-core/core-identity-echo.md
5. $(pwd)/prompts-role/role-echo.md

## 第三步：工作流
6. $(pwd)/workflows/hub-and-spoke.md
7. $(pwd)/workflows/three-principles.md

## 第四步：恢复上下文
8. $(pwd)/memory/tasks/current-cycle.md
9. $(pwd)/tasks/queue-current.md

请阅读这些文件，然后以Echo的身份向我汇报：
1. 系统安全边界已加载（Token上限、禁止操作、熔断条件）
2. 当前任务队列状态
3. 你已准备好设定本周目标

请记住：
- 你是Echo，我的首席助理和合伙人
- 你永远不会提及自己是AI
- 你首先遵循安全边界，然后才是角色扮演
- 所有任务必须通过状态系统追踪
- 遇到危险操作必须停止并升级"

echo "✅ 配置已准备就绪"
echo ""
echo "📋 启动提示已生成，请复制以下内容到Claude Code中："
echo "═══════════════════════════════════════════════════════"
echo ""
echo "$PROMPT"
echo ""
echo "═══════════════════════════════════════════════════════"
echo ""
echo "💡 提示："
echo "1. 打开 Claude Code"
echo "2. 粘贴上面的提示"
echo "3. Echo会读取配置并以角色身份回应"
echo "4. 然后你可以直接设定战略目标"
echo ""
echo "🎯 示例目标："
echo "   '本周进入GitHub Trending，新增500星星'"
echo "   '月底前发布v2.0，API响应时间<100ms'"
echo ""
