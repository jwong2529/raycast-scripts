#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Save Clipboard Image to Downloads
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📥
# @raycast.packageName Screenshots
# @raycast.description Prompts for filename and saves clipboard PNG to ~/Downloads

# 1. Generate default timestamp name
DEFAULT_NAME="Screenshot $(date +'%Y-%m-%d at %H.%M.%S')"

# 2. Prompt user via native macOS dialog box
FILE_NAME=$(osascript -e "
try
    set dialogResult to display dialog \"Enter a filename for the screenshot:\" default answer \"$DEFAULT_NAME\" buttons {\"Cancel\", \"Save\"} default button \"Save\"
    return text returned of dialogResult
on error
    return \"CANCELED\"
end try
")

# Exit if user canceled or entered nothing
if [ "$FILE_NAME" = "CANCELED" ] || [ -z "$FILE_NAME" ]; then
    echo "Canceled"
    exit 0
fi

# Append .png extension automatically if omitted
if [[ "$FILE_NAME" != *.png ]]; then
    FILE_NAME="${FILE_NAME}.png"
fi

TARGET_PATH="$HOME/Downloads/$FILE_NAME"

# 3. Extract clipboard PNG data directly to file
RESULT=$(osascript -e '
on run argv
    set targetPath to item 1 of argv
    try
        set imgData to (get the clipboard as «class PNGf»)
        set theFile to open for access (POSIX file targetPath) with write permission
        write imgData to theFile
        close access theFile
        return "SUCCESS"
    on error
        try
            close access (POSIX file targetPath)
        end try
        return "NO_IMAGE"
    end try
end run
' "$TARGET_PATH")

# 4. Display Raycast notification
if [ "$RESULT" = "SUCCESS" ]; then
    echo "Saved as $FILE_NAME in Downloads"
else
    echo "Error: No image found on clipboard"
    exit 1
fi