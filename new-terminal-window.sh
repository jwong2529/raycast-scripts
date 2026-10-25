#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title New Terminal Window
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

osascript -e 'tell application "Terminal" to do script ""' -e 'tell application "Terminal" to activate'
