#!/data/data/com.termux/files/usr/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m'

echo -e "${GREEN}Installing DARK SKIN tool...${NC}"

# Install dependencies
pkg update -y && pkg install -y git clang wget unzip pv figlet toilet

# Clone repository
git clone https://github.com/yourusername/DARK_SKIN.git $HOME/DARK_SKIN

# Compile the setup
cd $HOME/DARK_SKIN

# Set permissions
chmod +x setup darkskin pakskin

# Create symbolic link
ln -sf $HOME/DARK_SKIN/setup $PREFIX/bin/skin

echo -e "${GREEN}Installation complete!${NC}"
echo -e "Run the tool by typing: ${RED}skin${NC}"
