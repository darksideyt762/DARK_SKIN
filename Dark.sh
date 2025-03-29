#!/data/data/com.termux/files/usr/bin/bash

echo "Installing DARK SKIN tool..."

# 1. Clone repository
if [ -d "$HOME/DARK_SKIN" ]; then
    echo "Updating existing installation..."
    cd "$HOME/DARK_SKIN" && git pull
else
    git clone https://github.com/darksideyt762/DARK_SKIN.git "$HOME/DARK_SKIN"
fi

# 2. Make files executable
chmod +x "$HOME/DARK_SKIN"/{setup,pakskin,darkskin}

# 3. Create simple launcher
echo '#!/bin/bash
cd "$HOME/DARK_SKIN" && ./setup' > "$PREFIX/bin/skin"
chmod +x "$PREFIX/bin/skin"

echo "Installation complete!"
echo "Run the tool by typing: skin"
