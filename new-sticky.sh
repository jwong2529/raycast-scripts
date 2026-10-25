#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title New Sticky
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

osascript -e 'tell application "Stickies" to activate'
osascript -e 'tell application "System Events" to keystroke "n" using command down'
