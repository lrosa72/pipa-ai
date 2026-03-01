#!/bin/bash

# Pipa.ai 配置验证脚本
# 用法: ./tests/config-validation.sh

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

# 颜色定义
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "🔍 Pipa.ai 配置验证"
echo "═══════════════════════════════════════════════════════"
echo ""

PASS=0
FAIL=0

# 验证函数
validate_file() {
    local file="$1"
    local description="$2"
    
    if [ -f "$file" ]; then
        echo -e "${GREEN}✓${NC} $description"
        ((PASS++))
        return 0
    else
        echo -e "${RED}✗${NC} $description (缺失)"
        ((FAIL++))
        return 1
    fi
}

validate_dir() {
    local dir="$1"
    local description="$2"
    
    if [ -d "$dir" ]; then
        echo -e "${GREEN}✓${NC} $description"
        ((PASS++))
        return 0
    else
        echo -e "${RED}✗${NC} $description (缺失)"
        ((FAIL++))
        return 1
    fi
}

echo "📁 验证核心目录结构"
echo "───────────────────────────────────────────────────────────"
validate_dir "prompts-core/" "核心内核目录"
validate_dir "prompts-role/" "角色扮演目录"
validate_dir "sub-agents/" "Sub-Agent 目录"
validate_dir "workflows/" "工作流目录"
validate_dir "memory/" "记忆系统目录"
validate_dir "tasks/" "任务系统目录"
echo ""

echo "📄 验证核心文件"
echo "───────────────────────────────────────────────────────────"
validate_file "GEMINI.md" "GEMINI 启动基石"
validate_file "README.md" "项目说明"
validate_file "START-HERE.md" "启动指南"
validate_file "CHEATSHEET.md" "速查表"
echo ""

echo "🎭 验证 Agent 配置"
echo "───────────────────────────────────────────────────────────"
validate_file "prompts-core/core-identity-echo.md" "Echo 核心内核"
validate_file "prompts-core/core-identity-elon.md" "Elon 核心内核"
validate_file "prompts-core/core-identity-yuci.md" "Yuci 核心内核"
validate_file "prompts-role/role-echo.md" "Echo 角色设定"
validate_file "prompts-role/role-elon.md" "Elon 角色设定"
validate_file "prompts-role/role-yuci.md" "Yuci 角色设定"
echo ""

echo "🛡️ 验证安全协议"
echo "───────────────────────────────────────────────────────────"
validate_file "workflows/safety-guardrails.md" "安全边界协议"
validate_file "workflows/state-management.md" "状态管理协议"
validate_file "workflows/memory-protocol.md" "记忆协议"
echo ""

echo "📊 验证记忆系统"
echo "───────────────────────────────────────────────────────────"
validate_dir "memory/project/" "长期记忆目录"
validate_dir "memory/tasks/" "中期记忆目录"
validate_file "memory/project/context-map.md" "项目上下文地图"
validate_file "memory/project/architecture-decisions.md" "架构决策记录"
validate_file "memory/project/lessons-learned.md" "经验教训库"
validate_file "memory/tasks/current-cycle.md" "当前周期记忆"
echo ""

echo "═══════════════════════════════════════════════════════"
echo -e "验证结果: ${GREEN}通过 $PASS${NC} / ${RED}失败 $FAIL${NC}"
echo ""

if [ $FAIL -eq 0 ]; then
    echo -e "${GREEN}✓ 配置验证通过！${NC}"
    exit 0
else
    echo -e "${RED}✗ 发现 $FAIL 个配置问题${NC}"
    exit 1
fi