#!/bin/bash
# Cleanup script for devops-monitor
# Deletes log files older than 7 days

LOG_DIR="$HOME/devops-monitor/logs"

echo "Starting log cleanup: $(date)"

# Delete .log files older than 7 days
find "$LOG_DIR" -type f -name "*.log" -mtime +7 -exec rm -f {} \;

echo "Cleanup completed: $(date)"
