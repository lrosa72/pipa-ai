#!/bin/bash

# Pipa.ai 周报生成脚本
# 用法: ./monitoring/weekly-report.sh

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

WEEK_START=$(date -d "last monday" +%Y-%m-%d 2>/dev/null || date -v-1w +%Y-%m-%d)
WEEK_END=$(date +%Y-%m-%d)
REPORT_FILE="monitoring/reports/weekly-$(date +%Y-%W).md"

echo "📊 生成周报"
echo "═══════════════════════════════════════════════════════"
echo "周期: $WEEK_START 至 $WEEK_END"
echo ""

# 创建报告目录
mkdir -p "monitoring/reports"

# 统计任务
TASKS_PENDING=$(find tasks -name "pending-*.md" 2>/dev/null | wc -l | tr -d ' ')
TASKS_IN_PROGRESS=$(find tasks -name "in-progress-*.md" 2>/dev/null | wc -l | tr -d ' ')
TASKS_DONE=$(find tasks -name "done-*.md" 2>/dev/null | wc -l | tr -d ' ')
TASKS_TOTAL=$((TASKS_PENDING + TASKS_IN_PROGRESS + TASKS_DONE))

# 统计日志
LOG_COUNT=$(find logs -name "*.md" -type f -mtime -7 2>/dev/null | wc -l | tr -d ' ')

# 统计备份
BACKUP_COUNT=$(find backups -type d -mtime -7 2>/dev/null | wc -l | tr -d ' ')

# 生成报告
cat > "$REPORT_FILE" << EOF
# Pipa.ai 周报

**周期**: $WEEK_START 至 $WEEK_END
**生成时间**: $(date '+%Y-%m-%d %H:%M:%S')

## 📊 任务统计

| 状态 | 数量 |
|------|------|
| 待分配 | $TASKS_PENDING |
| 进行中 | $TASKS_IN_PROGRESS |
| 已完成 | $TASKS_DONE |
| **总计** | **$TASKS_TOTAL** |

## 📝 系统活动

- 本周日志文件: $LOG_COUNT
- 本周备份: $BACKUP_COUNT

## 🎯 本周目标

$(cat memory/tasks/current-cycle.md 2>/dev/null | grep -A 10 "本周战略目标" || echo "无目标设定")

## 📈 性能指标

- 系统健康度: $(./scripts/health-check.sh 2>/dev/null | grep "通过:" | head -1 || echo "未检查")
- 磁盘使用: $(du -sh . 2>/dev/null | cut -f1)

## 🐛 问题与风险

$(find logs -name "*.md" -type f -mtime -7 -exec grep -l "ERROR\|WARNING" {} \; 2>/dev/null | while read log; do
    echo "- $(basename "$log")"
done || echo "无重大问题")

## 💡 改进建议

1. 定期运行 `./scripts/memory-cleanup.sh` 清理过期记忆
2. 每周运行 `./scripts/backup-memory.sh` 创建备份
3. 监控任务完成率，优化工作流程

---

*此报告由 monitoring/weekly-report.sh 自动生成*
EOF

echo -e "${GREEN}✓${NC} 周报已生成: $REPORT_FILE"
echo ""
echo "报告内容预览:"
echo "───────────────────────────────────────────────────────────"
head -30 "$REPORT_FILE"
echo ""
echo "═══════════════════════════════════════════════════════"