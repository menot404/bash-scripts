#!/bin/bash
set -euo pipefail

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" >&2
    exit 1
fi

# System info
echo "=== SYSTEM ==="
hostnamectl | grep -E 'Operating System|Kernel|Architecture'

# CPU info
echo -e "\n=== CPU ==="
lscpu | grep -E '^Model name|^CPU\(s\)|^Thread|^Core|^CPU MHz|^CPU max MHz'

# Memory
echo -e "\n=== MEMORY ==="
free -h

# Disk Usage — exclut les systèmes de fichiers virtuels
echo -e "\n=== DISK USAGE ==="
df -hT | grep -v -E '^tmpfs|^devtmpfs|^udev|^none|Filesystem'
df -hT | head -n 1  # header
df -hT | grep -v -E '^tmpfs|^devtmpfs|^udev|^none|^Filesystem'

# Network Interfaces
echo -e "\n=== NETWORK INTERFACES ==="
ip -o -4 addr show | awk '{print $2, $4}'

# Network Ports — uniquement les ports en écoute, sans tronquer
echo -e "\n=== NETWORK PORTS (LISTENING) ==="
ss -tulnp

# System Uptime
echo -e "\n=== UPTIME ==="
uptime -p

# System Load
echo -e "\n=== LOAD AVERAGE (1/5/15 min) ==="
awk '{print "1min: "$1"  5min: "$2"  15min: "$3}' /proc/loadavg

# Top processes — CPU
echo -e "\n=== TOP 10 PROCESSES (CPU) ==="
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 11

# Top processes — MEM
echo -e "\n=== TOP 10 PROCESSES (MEM) ==="
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 11