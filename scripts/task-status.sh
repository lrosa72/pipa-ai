#!/bin/bash

# Pipa.ai 任务状态查看脚本

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

echo "📊 Pipa.ai 任务状态"
echo "───────────────────────────────────────────────────────────"

echo "【待分配 (Pending)】"
ls -1 tasks/pending-*.md 2>/dev/null | awk -F/ '{print "- "$NF}' || echo "  无"
echo ""

echo "【进行中 (In Progress)】"
ls -1 tasks/in-progress-*.md 2>/dev/null | awk -F/ '{print "- "$NF}' || echo "  无"
echo ""

echo "【已完成 (Done - 最近7天)】"
find tasks -name "done-*.md" -mtime -7 2>/dev/null | awk -F/ '{print "- "$NF}' || echo "  无"
echo ""
