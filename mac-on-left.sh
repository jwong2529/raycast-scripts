#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Mac on Left
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 👈
# @raycast.packageName Display Setup

# Run displayplacer
/opt/homebrew/bin/displayplacer "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1512x982 hz:120 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0" "id:197ED73A-92C6-4D5A-B7EB-AA70F900BC43 res:1920x1200 hz:60 color_depth:8 enabled:true scaling:off origin:(1512,-218) degree:0"

# This echo triggers the native Raycast success HUD
echo "Display moved to the left"