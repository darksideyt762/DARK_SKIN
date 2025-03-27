#!/bin/bash

cd ~/DARK_SKIN || { echo "DARK_SKIN folder not found! Cloning..."; git clone https://github.com/darksideyt762/DARK_SKIN ~/DARK_SKIN && cd ~/DARK_SKIN; }

chmod +x setup
./setup
