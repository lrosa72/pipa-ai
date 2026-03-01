#!/bin/bash

# Pipa.ai 记忆系统备份脚本

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="backups/backup_${TIMESTAMP}"

echo "💾 Pipa.ai 记忆备份"
echo "───────────────────────────────────────────────────────────"

mkdir -p "$BACKUP_DIR"
cp -r memory "$BACKUP_DIR/"
cp -r tasks "$BACKUP_DIR/"

# 压缩备份
tar -czf "${BACKUP_DIR}.tar.gz" -C backups "backup_${TIMESTAMP}"
rm -rf "$BACKUP_DIR"

echo "✓ 备份已创建: backups/backup_${TIMESTAMP}.tar.gz"

# 清理超过30天的备份
find backups -name "backup_*.tar.gz" -mtime +30 -exec rm {} \; 2>/dev/null
echo "✓ 已清理 30天前 的旧备份"
