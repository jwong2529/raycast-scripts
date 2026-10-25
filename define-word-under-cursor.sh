#!/usr/bin/env osascript

# @raycast.schemaVersion 1
# @raycast.title Define Word Under Cursor
# @raycast.mode silent
# @raycast.icon 📖

tell application "System Events"
    -- Simulates Ctrl + Cmd + D shortcut at current cursor position
    keystroke "d" using {control down, command down}
end tell