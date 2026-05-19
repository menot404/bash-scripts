#!/bin/bash


# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

#
echo "=== SYSTEM ==="
hostnamectl | grep -E 'Operating System|Kernel|Architecture'

echo -e "\n=== CPU ==="
lscpu | grep -E 'Model name|CPU|Thread|Core|MHz'

# Memory
echo -e "\n=== MEMORY ==="
free -h

# Disk Usage
echo -e "\n=== DISK USAGE ==="
df -hT | awk 'NR==1 || $7 ~ /^\/(home|var|root|\/|boot|data)/'


# Network Interfaces
echo -e "\n=== NETWORK INTERFACES ==="
ip -o -4 addr show | awk '{print $2, $4}'

# Network Ports
echo -e "\n=== NETWORK PORTS ==="
ss -tuln | head -n 10

# System Uptime
echo -e "\n=== UPTIME ==="
uptime -p


# System Load
echo -e "\n=== LOAD AVERAGE (1/5/15) ==="
awk '{print $1,$2,$3}' /proc/loadavg

echo -e "\n=== TOP PROCESSES ==="
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 10