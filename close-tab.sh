#!/bin/bash
w=$(echo "$1" | awk -F'\\|\\|\\|' '{print $1}')
t=$(echo "$1" | awk -F'\\|\\|\\|' '{print $2}')
osascript -e "tell application \"Google Chrome\" to close tab $t of window $w" 2>/dev/null
