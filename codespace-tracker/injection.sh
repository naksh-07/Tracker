#!/bin/bash

# Absolute path of codespace-tracker dir
TRACKER_PATH="$(pwd)"

START_TAG="# >>> Codespace Tracker Auto Start with Boot Detection <<<"
END_TAG="# <<< Codespace Tracker Auto Start with Boot Detection <<<"

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

# Clean old block
sed -i "/$START_TAG/,/$END_TAG/d" ~/.bashrc

# Inject smart block
echo -e "\n$AUTO_BLOCK" >> ~/.bashrc
echo "✅ Smart Codespace Tracker boot-based block added to ~/.bashrc!"
