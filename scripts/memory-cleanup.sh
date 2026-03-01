#!/bin/bash

# Pipa.ai 记忆系统清理脚本

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

echo "🧹 Pipa.ai 记忆清理"
echo "───────────────────────────────────────────────────────────"

# 归档超过14天的已完成任务
find tasks -name "done-*.md" -mtime +14 -exec mv {} tasks/archive/deep-archive/ \; 2>/dev/null
echo "✓ 已归档 14天前 的已完成任务"

# 归档超过30天的日志
find logs -name "*.md" -mtime +30 -exec mv {} logs/archive/ \; 2>/dev/null
echo "✓ 已归档 30天前 的日志文件"

echo "清理完成！"
