#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Clear System Cache
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Define the cache path
CACHE_DIR="$HOME/Library/Caches"

# Delete everything inside (but keep the folder itself)
if [ -d "$CACHE_DIR" ]; then
    # Moves files to the macOS Trash instead of permanent deletion
    osascript -e 'tell application "Finder" to delete every item of (POSIX file "'"$CACHE_DIR"'" as alias)'
    echo "Cache cleared!"
else
    echo "Cache folder not found."
    exit 1
fi

