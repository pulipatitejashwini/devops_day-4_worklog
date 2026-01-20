#!/bin/bash
# Script Name: system_info.sh
# Description: Prints basic system information
# Author: Tejashwini Pulipati
# Date: 2026-01-20

HOSTNAME=$(hostname)
USER_NAME=$(whoami)
OS_VERSION=$(uname -o)
KERNEL_VERSION=$(uname -r)
UPTIME=$(uptime -p)
CPU_INFO=$(lscpu | grep "Model name" | awk -F: '{print $2}')
DISK_USAGE=$(df -h)
MEMORY_USAGE=$(free -h)
echo "=============== SYSTEM INFORMATION ==============="
echo "Hostname       : $HOSTNAME"
echo "Current User   : $USER_NAME"
echo "OS Version     : $OS_VERSION"
echo "Kernel Version : $KERNEL_VERSION"
echo "Uptime         : $UPTIME"
echo "=================================================="
echo "Memory Usage   : $MEMORY_USAGE"
echo "=================================================="
echo "Disk Usage     : $DISK_USAGE"
echo "=================================================="
echo "CPU Info       : $CPU_INFO"
echo "=================================================="

Disk_Usage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
echo "=============== Disk Check ======================="
if [ "$Disk_Usage" -gt 80 ]; then
  echo "WARNING: Disk usage is high ($Disk_Usage%)"
else
  echo "Disk usage is healthy ($Disk_Usage%)"
fi
echo "=================================================="

