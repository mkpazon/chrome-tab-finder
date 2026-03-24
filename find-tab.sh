#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

format_tabs() {
  "$SCRIPT_DIR/list-tabs.sh" | sed '/^$/d' | while IFS= read -r line; do
    domain=$(echo "$line" | awk -F'\\|\\|\\|' '{print $4}' | awk -F'/' '{print $3}' | sed 's/^www\.//')
    title=$(echo "$line" | awk -F'\\|\\|\\|' '{print $3}')
    meta=$(echo "$line" | awk -F'\\|\\|\\|' '{print $1 "|||" $2 "|||" $4}')
    echo "$meta|||$title  ($domain)"
  done
}

tabs=$(format_tabs)

if [ -z "$tabs" ]; then
  echo "No Chrome tabs found. Is Chrome running?"
  exit 1
fi

selected=$(echo "$tabs" | fzf \
  --scheme=path \
  --delimiter='\|\|\|' \
  --with-nth=4 \
  --preview-window=hidden \
  --prompt="Tab > " \
  --header="Enter=focus | Ctrl-D=close tab" \
  --height=10 \
  --reverse \
  --bind "ctrl-d:execute-silent($SCRIPT_DIR/close-tab.sh {})+reload($SCRIPT_DIR/format-tabs.sh)")

if [ -n "$selected" ]; then
  w=$(echo "$selected" | awk -F'\\|\\|\\|' '{print $1}')
  t=$(echo "$selected" | awk -F'\\|\\|\\|' '{print $2}')
  osascript -e "
    tell application \"Google Chrome\"
      set active tab index of window $w to $t
      set index of window $w to 1
      activate
    end tell" 2>/dev/null
fi
