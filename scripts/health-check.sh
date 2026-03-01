#!/bin/bash

# Pipa.ai 系统健康检查脚本

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo "🔍 Pipa.ai 系统健康检查"

FAIL=0

check_dir() {
    if [ ! -d "$1" ]; then
        echo -e "${RED}✗ 缺少目录: $1${NC}"
        FAIL=$((FAIL+1))
    fi
}

check_file() {
    if [ ! -f "$1" ]; then
        echo -e "${RED}✗ 缺少文件: $1${NC}"
        FAIL=$((FAIL+1))
    fi
}

check_dir "memory"
check_dir "tasks"
check_dir "logs"
check_dir "prompts-core"
check_dir "workflows"

if [ $FAIL -eq 0 ]; then
    echo -e "${GREEN}通过: 所有核心系统正常${NC}"
    exit 0
else
    echo -e "${RED}失败: 发现 $FAIL 个问题${NC}"
    exit 1
fi
