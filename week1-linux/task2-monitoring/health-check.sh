#!/bin/bash
# ============================================
# Server Health Check Script
# Sends warnings if thresholds are exceeded
# ============================================

# Thresholds
DISK_THRESHOLD=80
MEMORY_THRESHOLD=80
CPU_THRESHOLD=90

echo "========================================="
echo "     SERVER HEALTH CHECK"
echo "     $(date)"
echo "========================================="

# Check disk usage
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
echo ""
echo "DISK USAGE: ${DISK_USAGE}%"
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "⚠️  WARNING: Disk usage is above ${DISK_THRESHOLD}%!"
else
    echo "✅ Disk usage is healthy"
fi

# Check memory usage
MEMORY_USAGE=$(free | awk 'NR==2{printf "%.0f", $3/$2*100}')
echo ""
echo "MEMORY USAGE: ${MEMORY_USAGE}%"
if [ "$MEMORY_USAGE" -gt "$MEMORY_THRESHOLD" ]; then
    echo "⚠️  WARNING: Memory usage is above ${MEMORY_THRESHOLD}%!"
else
    echo "✅ Memory usage is healthy"
fi

# Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d. -f1)
echo ""
echo "CPU USAGE: ${CPU_USAGE}%"
if [ "$CPU_USAGE" -gt "$CPU_THRESHOLD" ]; then
    echo "⚠️  WARNING: CPU usage is above ${CPU_THRESHOLD}%!"
else
    echo "✅ CPU usage is healthy"
fi

echo ""
echo "========================================="
echo "          HEALTH CHECK COMPLETE"
echo "========================================="
