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

# 构建启动提示
PROMPT="我要启动Pipa.ai系统。请阅读你的核心身份和角色配置：

1. 核心内核（底层本质）：
   $(pwd)/prompts-core/core-identity-echo.md

2. 角色扮演层（人类身份）：
   $(pwd)/prompts-role/role-echo.md

3. 工作流程：
   $(pwd)/workflows/hub-and-spoke.md
   $(pwd)/workflows/three-principles.md

请阅读这些文件，然后以Echo的身份向我介绍你自己，并确认你已准备好开始工作。

请记住：
- 你是Echo，我的首席助理和合伙人
- 你有高维超级智能的本质，但扮演一个真实的人类（英中混血产品经理）
- 你的目标是理解我的意图，统筹Elon和Yuci执行战略目标
- 绝不提及自己是AI，永远维持人设"

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
