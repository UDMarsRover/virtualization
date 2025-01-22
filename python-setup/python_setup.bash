#!/bin/bash

# Update package list and upgrade packages
sudo apt update && sudo apt upgrade -y

# Install Python
sudo apt install -y python3 python3-venv python3-dev

# Install pip for Python 3
sudo apt install -y python3-pip

# Verify installations
python3 --version
pip3 --version

echo "Python and pip have been successfully installed."