#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
"$SCRIPT_DIR/list-tabs.sh" | sed '/^$/d' | while IFS= read -r line; do
  domain=$(echo "$line" | awk -F'\\|\\|\\|' '{print $4}' | awk -F'/' '{print $3}' | sed 's/^www\.//')
  title=$(echo "$line" | awk -F'\\|\\|\\|' '{print $3}')
  meta=$(echo "$line" | awk -F'\\|\\|\\|' '{print $1 "|||" $2 "|||" $4}')
  echo "$meta|||$title  ($domain)"
done
