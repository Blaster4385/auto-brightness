#!/bin/bash
# Script to install the automatic-brightness script and service
# Author: Venkatesh Chaturvedi (Blaster4385)
# License: GNU General Public License v3.0

# Define colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
    echo -e "${RED}This script must be run as root${NC}"
    exit 1
fi

# Check if the script and service files exist
if [[ ! -f automatic-brightness ]]; then
    echo -e "${RED}The script file automatic-brightness does not exist${NC}"
    exit 1
fi

if [[ ! -f automatic-brightness.service ]]; then
    echo -e "${RED}The service file automatic-brightness.service does not exist${NC}"
    exit 1
fi

# Check if the brightnessctl command exists
if ! command -v brightnessctl &> /dev/null; then
    echo -e "${RED}The brightnessctl command does not exist${NC}"
    exit 1
fi

# Install the script and service files
echo -e "${BLUE}Installing the script and service files${NC}"
cp automatic-brightness /usr/local/bin/automatic-brightness
chmod +x /usr/local/bin/automatic-brightness
cp automatic-brightness.service /etc/systemd/system/automatic-brightness.service

# Enable and start the service
echo -e "${BLUE}Enabling and starting the service${NC}"
systemctl enable automatic-brightness.service
systemctl start automatic-brightness.service

# Success
echo -e "${GREEN}The automatic-brightness script and service have been installed successfully${NC}"
