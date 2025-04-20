#!/bin/bash

# Absolute path of codespace-tracker dir
TRACKER_PATH="$(pwd)"

START_TAG="# >>> Codespace Tracker Auto Start with Delay <<<"
END_TAG="# <<< Codespace Tracker Auto Start with Delay <<<"

# Auto-start block content
AUTO_BLOCK=$(cat <<EOF
$START_TAG
cd "$TRACKER_PATH" || exit

# Step 1: Run chalu.sh first
if [ -f "chalu.sh" ]; then
    bash chalu.sh
fi

# Step 2: Run start_all.sh after 30 sec
(
    sleep 30
    if [ -f "start_all.sh" ]; then
        bash start_all.sh &
    fi
) &
$END_TAG
EOF
)

# Check if block already exists
if grep -q "$START_TAG" ~/.bashrc; then
    echo "🟡 Codespace Tracker block already exists in ~/.bashrc. Skipping insert."
else
    echo -e "\n$AUTO_BLOCK" >> ~/.bashrc
    echo "✅ Codespace Tracker auto-run block added to ~/.bashrc!"
fi
