#!/bin/bash
# q5_user_report.sh
# User Account Reporter

echo "========== USER STATISTICS =========="

TOTAL_USERS=$(wc -l < /etc/passwd)
SYSTEM_USERS=$(awk -F: '$3 < 1000 {count++} END {print count}' /etc/passwd)
REGULAR_USERS=$(awk -F: '$3 >= 1000 {count++} END {print count}' /etc/passwd)
LOGGED_IN=$(who | awk '{print $1}' | sort -u | wc -l)

echo "Total Users: $TOTAL_USERS"
echo "System Users (UID < 1000): $SYSTEM_USERS"
echo "Regular Users (UID >= 1000): $REGULAR_USERS"
echo "Currently Logged In: $LOGGED_IN"

echo ""
echo "========== REGULAR USER DETAILS =========="
printf "%-15s %-8s %-20s %-15s\n" "Username" "UID" "Home Directory" "Shell"
awk -F: '$3 >= 1000 {printf "%-15s %-8s %-20s %-15s\n", $1, $3, $6, $7}' /etc/passwd

echo ""
echo "========== GROUP INFORMATION =========="
cut -d: -f1 /etc/group | while read group; do
    MEMBERS=$(grep "^$group:" /etc/group | awk -F: '{print $4}' | tr ',' '\n' | wc -l)
    echo "$group - $MEMBERS members"
done

echo ""
echo "========== SECURITY ALERTS =========="
ROOT_USERS=$(awk -F: '$3 == 0 {print $1}' /etc/passwd)
echo "Users with UID 0:"
echo "$ROOT_USERS"

echo "Users never logged in:"
lastlog | grep "**Never logged in**"
