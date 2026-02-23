#!/bin/bash
# q3_log_analyzer.sh
# Log File Analyzer

if [ $# -ne 1 ]; then
    echo "Usage: $0 <logfile>"
    exit 1
fi

LOGFILE="$1"

if [ ! -f "$LOGFILE" ]; then
    echo "Error: Log file does not exist!"
    exit 1
fi

if [ ! -s "$LOGFILE" ]; then
    echo "Log file is empty!"
    exit 1
fi

echo "========== LOG FILE ANALYSIS =========="
echo "Log File: $LOGFILE"

TOTAL=$(wc -l < "$LOGFILE")
echo "Total Entries: $TOTAL"

echo "Unique IP Addresses:"
awk '{print $1}' "$LOGFILE" | sort | uniq
UNIQUE_COUNT=$(awk '{print $1}' "$LOGFILE" | sort | uniq | wc -l)
echo "Count: $UNIQUE_COUNT"

echo "Status Code Summary:"
awk '{print $NF}' "$LOGFILE" | sort | uniq -c

echo "Most Frequently Accessed Page:"
awk '{print $7}' "$LOGFILE" | sort | uniq -c | sort -nr | head -1

echo "Top 3 IP Addresses:"
awk '{print $1}' "$LOGFILE" | sort | uniq -c | sort -nr | head -3
