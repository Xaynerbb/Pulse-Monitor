#!/bin/bash


# ==============================
# NETWORK MONITORING SCRIPT
# DevOps-grade with logging + alerts
# ==============================

# Log file
LOGFILE="$HOME/devops-monitor/logs/network-monitor.log"
mkdir -p "$(dirname "$LOGFILE")"

# Timestamp
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Email for alerts
ALERT_EMAIL="zainababdulazeez691@gmail.com"

# Status tracker
STATUS=0

# ==============================
# Start Logging
# ==============================

echo "========== NETWORK CHECK =========="
echo "Run at: $TIMESTAMP"

echo "------------------------------------" >> "$LOGFILE"
echo "NETWORK CHECK" >> "$LOGFILE"
echo "Run at: $TIMESTAMP" >> "$LOGFILE"

# ==============================
# Router Check
# ==============================
GATEWAY=$(ip route | grep default | awk '{print $3}')
ping -c 2 $GATEWAY > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Router: OK"
    echo "$TIMESTAMP - Router: OK" >> "$LOGFILE"
else
    echo "Router: FAIL"
    echo "$TIMESTAMP - Router: FAIL" >> "$LOGFILE"
    STATUS=1
fi

# ==============================
# Internet Check (Google DNS)
# ==============================
ping -c 2 8.8.8.8 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Internet: OK"
    echo "$TIMESTAMP - Internet: OK" >> "$LOGFILE"
else
    echo "Internet: FAIL"
    echo "$TIMESTAMP - Internet: FAIL" >> "$LOGFILE"
    STATUS=1
fi

# ==============================
# DNS Check (Google)
# ==============================
ping -4 -c 2 google.com > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "DNS: OK"
    echo "$TIMESTAMP - DNS: OK" >> "$LOGFILE"
else
    echo "DNS: FAIL"
    echo "$TIMESTAMP - DNS: FAIL" >> "$LOGFILE"
    STATUS=1
fi

echo ""

# ==============================
# Final Network Status & Alert
# ==============================
if [ $STATUS -eq 0 ]; then
    echo "NETWORK STATUS: HEALTHY"
    echo "$TIMESTAMP - NETWORK STATUS: HEALTHY" >> "$LOGFILE"
else
    echo "NETWORK STATUS: DOWN"
    echo "$TIMESTAMP - NETWORK STATUS: DOWN" >> "$LOGFILE"

    # Send Gmail alert using msmtp
    if command -v msmtp > /dev/null; then
        echo "Network DOWN on $(hostname) at $TIMESTAMP" | msmtp $ALERT_EMAIL
    else
        echo "msmtp not installed — cannot send email alert"
    fi
fi

# ==============================
# Exit Code
# ==============================
exit $STATUS
