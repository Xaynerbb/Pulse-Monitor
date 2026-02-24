#!/bin/bash
# Generate a summary report from network logs

LOG_FILE="$HOME/devops-monitor/logs/network-monitor.log"

echo "===== NETWORK REPORT ====="
if [ -f "$LOG_FILE" ]; then
    tail -n 20 "$LOG_FILE"
else
    echo "No log file found at $LOG_FILE"
fi
