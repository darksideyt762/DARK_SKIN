#!/data/data/com.termux/files/usr/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Installing DARK SKIN tool...${NC}"

# Clone or update repository
echo -e "${GREEN}[1/4] Handling repository...${NC}"
if [ -d "$HOME/DARK_SKIN" ]; then
    echo -e "${YELLOW}Directory exists. Updating...${NC}"
    cd "$HOME/DARK_SKIN" || {
        echo -e "${RED}Failed to enter directory!${NC}"
        exit 1
    }
    git pull || {
        echo -e "${RED}Failed to update repository!${NC}"
        exit 1
    }
else
    git clone https://github.com/darksideyt762/DARK_SKIN.git "$HOME/DARK_SKIN" || {
        echo -e "${RED}Failed to clone repository!${NC}"
        exit 1
    }
    cd "$HOME/DARK_SKIN" || {
        echo -e "${RED}Failed to enter directory!${NC}"
        exit 1
    }
fi

# Set permissions
echo -e "${GREEN}[2/4] Setting up permissions...${NC}"
chmod +x setup darkskin pakskin || {
    echo -e "${RED}Failed to set permissions!${NC}"
    exit 1
}

# Create symbolic links
echo -e "${GREEN}[3/4] Creating symbolic links...${NC}"
mkdir -p "$PREFIX/bin"
ln -sf "$HOME/DARK_SKIN/setup" "$PREFIX/bin/skin" || {
    echo -e "${RED}Failed to create main symlink!${NC}"
    exit 1
}

# Create symlink for pakskin in the same directory
ln -sf "$HOME/DARK_SKIN/pakskin" "$PREFIX/bin/pakskin" || {
    echo -e "${YELLOW}Warning: Could not create pakskin symlink${NC}"
}

# Add directory to PATH if not already present
echo -e "${GREEN}[4/4] Setting up environment...${NC}"
if [[ ":$PATH:" != *":$HOME/DARK_SKIN:"* ]]; then
    echo 'export PATH="$PATH:$HOME/DARK_SKIN"' >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
    echo -e "${GREEN}Added DARK_SKIN to PATH${NC}"
fi

# Verify installation
if [ -f "$PREFIX/bin/skin" ] && [ -f "$HOME/DARK_SKIN/pakskin" ]; then
    echo -e "${GREEN}Installation successful!${NC}"
    echo -e "Run the tool by typing: ${RED}skin${NC}"
else
    echo -e "${RED}Installation failed!${NC}"
    echo -e "Try running manually: ${RED}cd $HOME/DARK_SKIN && ./setup${NC}"
    exit 1
fi
