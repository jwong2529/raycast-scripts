#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Peek Bluetooth
# @raycast.mode silent
# @raycast.packageName System

# Optional parameters:
# @raycast.icon 🎧

osascript << 'EOF'
tell application "System Events"
    tell process "ControlCenter"
        -- Click the Bluetooth menu bar item
        try
            click (first menu bar item of menu bar 1 whose description is "Bluetooth")
        end try
        
        -- Wait 3 seconds to let you read the battery level
        delay 3
        
        -- Dismiss the menu
        key code 53
    end tell
end tell
EOF