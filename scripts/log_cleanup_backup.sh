#!/bin/bash
# Script Name : log_cleanup_backup.sh
# Description : Backup and delete log files older than 7 days
# Author      : Tejashwini Pulipati
# Date        : 2026-01-20

# Variables
LOG_DIR="/var/log"
BACKUP_DIR="/home/ubuntu/log_backup"
LOG_FILE="/home/ubuntu/log_backup/cleanup.log"
DAYS=7

# Create backup directory if not exists
mkdir -p "$BACKUP_DIR"

echo "===== Log Cleanup Started: $(date) =====" >> "$LOG_FILE"

# Find and backup old log files
find "$LOG_DIR" -type f -mtime +"$DAYS" -exec cp {} "$BACKUP_DIR" \;

# Check if backup was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully" >> "$LOG_FILE"
else
  echo "Backup failed" >> "$LOG_FILE"
  exit 1
fi

# Delete old log files after backup
find "$LOG_DIR" -type f -mtime +"$DAYS" -exec rm -f {} \;

echo "Old log files deleted successfully" >> "$LOG_FILE"
echo "===== Log Cleanup Finished: $(date) =====" >> "$LOG_FILE"

