#!/bin/bash
# q1_system_info.sh
# Displays system information in formatted output

# Collect system information
USERNAME=$(whoami)
HOSTNAME=$(hostname)
DATETIME=$(date "+%Y-%m-%d %H:%M:%S")
OS=$(uname -s)
CURRENT_DIR=$(pwd)
HOME_DIR=$HOME
USERS_ONLINE=$(who | wc -l)
UPTIME=$(uptime -p)

# Display output
echo "╔════════════════════════════════════════╗"
echo "║        SYSTEM INFORMATION DISPLAY     ║"
echo "╠════════════════════════════════════════╣"
echo "║ Username        : $USERNAME"
echo "║ Hostname        : $HOSTNAME"
echo "║ Date & Time     : $DATETIME"
echo "║ OS              : $OS"
echo "║ Current Dir     : $CURRENT_DIR"
echo "║ Home Dir        : $HOME_DIR"
echo "║ Users Online    : $USERS_ONLINE"
echo "║ Uptime          : $UPTIME"
echo "╚════════════════════════════════════════╝"
