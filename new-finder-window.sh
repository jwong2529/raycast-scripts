#!/usr/bin/osascript

# @raycast.schemaVersion 1
# @raycast.title Open Downloads
# @raycast.mode silent
# @raycast.packageName Navigation
# @raycast.icon 📥

tell application "Finder"
    activate
    -- This opens a new window specifically at the Downloads path
    make new Finder window to (path to downloads folder)
end tell