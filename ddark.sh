#!/data/data/com.termux/files/usr/bin/bash

# 1. Remove old installation (if exists)
rm -rf "$HOME/DARK_SKIN"

# 2. Clone fresh copy
git clone https://github.com/darksideyt762/DARK_SKIN.git "$HOME/DARK_SKIN"

# 3. Enter directory and run setup
cd "$HOME/DARK_SKIN" && ./setup
