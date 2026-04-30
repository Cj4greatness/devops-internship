#!/bin/bash
# ============================================
# Daily Log Report Script
# Saves reports to a logs folder
# ============================================

# Create logs directory
mkdir -p ~/server-logs

# Set report filename with date
REPORT_FILE=~/server-logs/report-$(date +%Y-%m-%d).txt

echo "Generating daily report..."

{
echo "========================================="
echo "DAILY SERVER REPORT — $(date)"
echo "========================================="

echo ""
echo "--- SYSTEM UPTIME ---"
uptime

echo ""
echo "--- DISK USAGE ---"
df -h

echo ""
echo "--- MEMORY ---"
free -h

echo ""
echo "--- LAST 10 LOGGED IN USERS ---"
last | head -10

echo ""
echo "--- FAILED LOGIN ATTEMPTS ---"
grep "Failed password" /var/log/auth.log 2>/dev/null | tail -5 || echo "No failed attempts found"

echo ""
echo "========================================="
echo "END OF REPORT"
echo "========================================="
} > "$REPORT_FILE"

echo "✅ Report saved to: $REPORT_FILE"
cat "$REPORT_FILE"
