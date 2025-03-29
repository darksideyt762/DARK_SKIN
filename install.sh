#!/data/data/com.termux/files/usr/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m'

echo -e "${GREEN}Installing DARK SKIN tool...${NC}"

# 2. Clone repository
echo -e "${GREEN}[2/4] Cloning repository...${NC}"
if [ -d "$HOME/DARK_SKIN" ]; then
    echo -e "${YELLOW}Directory exists. Updating...${NC}"
    cd $HOME/DARK_SKIN
    git clone https://github.com/darksideyt762/DARK_SKIN.git $HOME/DARK_SKIN || {
        echo -e "${RED}Failed to clone repository!${NC}"
        exit 1
    }
    cd $HOME/DARK_SKIN
fi

# 3. Set permissions and create symlink
echo -e "${GREEN}[3/4] Setting up permissions...${NC}"
chmod +x setup darkskin pakskin

echo -e "${GREEN}[4/4] Creating symbolic link...${NC}"
ln -sf $HOME/DARK_SKIN/setup $PREFIX/bin/skin || {
    echo -e "${RED}Failed to create symbolic link!${NC}"
    echo -e "${YELLOW}Trying with sudo...${NC}"
    sudo ln -sf $HOME/DARK_SKIN/setup /usr/local/bin/skin
}

# Verify installation
if [ -f "$PREFIX/bin/skin" ]; then
    echo -e "${GREEN}Installation successful!${NC}"
    echo -e "Run the tool by typing: ${RED}skin${NC}"
else
    echo -e "${RED}Installation failed!${NC}"
    echo -e "Try running manually: ${RED}cd $HOME/DARK_SKIN && ./setup${NC}"
fi
