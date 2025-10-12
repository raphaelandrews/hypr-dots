#!/usr/bin/env bash

# Run Fastfetch and extract values safely
output=$(fastfetch 2>/dev/null)

os=$(echo "$output" | grep -oP ' OS:\s*\K.*')
kernel=$(echo "$output" | grep -oP '│ ├:\s*\K.*')
uptime=$(echo "$output" | grep -oP '󱫐 Uptime:\s*\K.*')

# Build JSON for Waybar
printf ' %s |  %s |  %s' \
  "${os:-n/a}" "${kernel:-n/a}" "${uptime:-n/a}"
