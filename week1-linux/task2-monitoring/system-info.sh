#!/bin/bash
# ============================================
# System Information Script
# Author: Chisom Johnson
# ============================================

echo "========================================="
echo "       SERVER SYSTEM REPORT"
echo "  Generated: $(date)"
echo "========================================="

echo ""
echo "--- SYSTEM INFO ---"
echo "Hostname:    $(hostname)"
echo "OS:          $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2)"
echo "Kernel:      $(uname -r)"
echo "Uptime:      $(uptime -p)"

echo ""
echo "--- CPU USAGE ---"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " $2 "%"}'

echo ""
echo "--- MEMORY USAGE ---"
free -h | awk 'NR==2{printf "Total: %s | Used: %s | Free: %s | Usage: %.1f%%\n", $2,$3,$4,$3/$2*100}'

echo ""
echo "--- DISK USAGE ---"
df -h | grep -v tmpfs | awk 'NR==1 || /\/$/{print}'

echo ""
echo "--- TOP 5 PROCESSES BY CPU ---"
ps aux --sort=-%cpu | head -6 | awk '{printf "%-20s %s%%\n", $11, $3}'

echo ""
echo "--- NETWORK INFO ---"
ip addr show | grep "inet " | awk '{print "IP: " $2}'

echo "========================================="
echo "          END OF REPORT"
echo "========================================="
