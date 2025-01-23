#!/bin/bash

# Install Python
sudo apt install -y python3-venv

# Verify installations
python3 --version

# Create a Python virtual environment
python3 -m venv ~/udmrt-env

# Activate the virtual environment in every terminal session
echo 'source ~/udmrt-env/bin/activate' >> ~/.bashrc

# Reload .bashrc to apply changes
source ~/.bashrc

echo "Python virtual environment has been created and configured to activate in every terminal session."

# Install packages from general_dependencies.txt
pip install -r ~/virtualization/python-setup/general_dependencies.txt

echo "General packages have been successfully installed."
