# Pipa.ai 自动化脚本

本目录包含 Pipa.ai 系统日常维护的核心脚本。

## 脚本列表

- `health-check.sh`: 系统健康检查
- `task-status.sh`: 快速查看当前任务状态
- `memory-cleanup.sh`: 清理过期日志和已完成的任务并将其归档
- `backup-memory.sh`: 备份记忆和任务记录到 `backups/`

## 使用说明

所有脚本均需在赋予执行权限后直接运行：

```bash
chmod +x scripts/*.sh
./scripts/health-check.sh
```
