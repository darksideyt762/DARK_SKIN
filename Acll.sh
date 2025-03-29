#!/data/data/com.termux/files/usr/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Installing DARK SKIN tool...${NC}"

# 1. Clone or update repository
echo -e "${GREEN}[1/3] Handling repository...${NC}"
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
fi

# 2. Set permissions
echo -e "${GREEN}[2/3] Setting up permissions...${NC}"
chmod +x "$HOME/DARK_SKIN"/{setup,darkskin,pakskin} || {
    echo -e "${RED}Failed to set permissions!${NC}"
    exit 1
}

# 3. Create wrapper script
echo -e "${GREEN}[3/3] Creating launcher...${NC}"
cat > "$PREFIX/bin/skin" << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
cd "$HOME/DARK_SKIN" && ./setup
EOF

chmod +x "$PREFIX/bin/skin" || {
    echo -e "${RED}Failed to create launcher!${NC}"
    exit 1
}

echo -e "${GREEN}Installation successful!${NC}"
echo -e "Run the tool by typing: ${RED}skin${NC}"
