#!/bin/bash

# Navigate to DARK_SKIN directory or clone if missing
cd ~/DARK_SKIN 2>/dev/null || {
    echo -e "\033[1;33mDARK_SKIN folder not found! Cloning repository...\033[0m"
    if git clone https://github.com/darksideyt762/DARK_SKIN ~/DARK_SKIN; then
        cd ~/DARK_SKIN || {
            echo -e "\033[1;31mFailed to enter DARK_SKIN directory!\033[0m"
            exit 1
        }
    else
        echo -e "\033[1;31mFailed to clone repository!\033[0m"
        exit 1
    fi
}

# Ensure setup is executable
if ! chmod +x setup 2>/dev/null; then
    echo -e "\033[1;31mError: setup not found or permission denied!\033[0m"
    exit 1
fi

# Clear screen and run
clear
exec ./setup "$@"
