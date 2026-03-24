#!/bin/bash

echo "====================================="
echo "        System Health Report"
echo "====================================="

# CPU Load
echo -e "\n[CPU Load]"
uptime

# Memory Usage
echo -e "\n[Memory Usage (MB)]"
free -m

# Disk Usage
echo -e "\n[Disk Usage]"
df -h

# Top 5 Memory Consuming Processes
echo -e "\n[Top 5 Memory Consuming Processes]"
ps aux --sort=-%mem | head -n 6