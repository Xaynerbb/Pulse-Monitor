# DevOps Monitoring System

## Overview

This project is a Linux-based monitoring system written in Bash. 
It provides automated monitoring for network and system health, complete with logging and email alerting.

The system includes:

- Network monitoring (Router, Internet, DNS)
- System monitoring (via `monitor.sh` and `report.sh`)
- Logging of all monitoring activity
- Email alerts for failures
- Automatic execution using cron
- Cleanup routines via `cleanup.sh`

---

## Features

- Router connectivity checks 
- Internet availability checks 
- DNS resolution monitoring 
- Persistent system logs in `logs/` 
- Automated email alerts using `msmtp` 
- Cron automation (every 5 minutes) 
- Log cleanup scripts to maintain storage 

---

## File Structure

```text
devops-monitor/
├── cleanup.sh      # Cleans old logs and temporary files
├── monitor.sh      # Main script to run all monitoring tasks
├── network.sh      # Network-specific monitoring script
├── report.sh       # Optional: generates summary reports
├── logs/           # Stores log files
├── docs/           # Project documentation
└── README.md       # This file
````

> Note: `logs/` contains runtime logs and `docs/` can store diagrams or documentation.

---

## Installation

Clone the repository:

```bash
git clone https://github.com/Xaynerbb/devops-monitor.git
cd devops-monitor
```

Make all scripts executable:

```bash
chmod +x *.sh
```

---

## Usage

Run the monitoring system manually:

```bash
./monitor.sh
```

Log files are stored here:

```text
~/devops-monitor/logs/network-monitor.log
```

Each run creates a timestamped log entry so you can track network and system status over time.

---

## Automation

Set up cron to run the monitor every 5 minutes:

```bash
crontab -e
```

Add the following line:

```text
# Run monitoring every 5 minutes
*/5 * * * * /home/Xaynerbb/Desktop/devops-monitor/monitor.sh
```

> This cron job automates monitoring, logging, and alerting without manual intervention.

---

## Example Log Entry

```text
------------------------------------
Run at: 2026-02-24 08:10:02
2026-02-24 08:10:02 - Router: OK
2026-02-24 08:10:02 - Internet: OK
2026-02-24 08:10:02 - DNS: OK
2026-02-24 08:10:02 - NETWORK STATUS: HEALTHY
```

> Logs are cumulative and provide historical insights for troubleshooting.

---

## Scripts

* `network.sh` — Checks network connectivity (router, Internet, DNS)
* `monitor.sh` — Main script to run all monitoring tasks
* `report.sh` — Generates summary reports (optional)
* `cleanup.sh` — Removes old logs to keep the system tidy

All scripts are executable and can be run independently or via `monitor.sh`.

---

## Author
Zainab Abdulazeez | Software Engineering Student | Passionate about building real-world systems | DevOps Engineer



