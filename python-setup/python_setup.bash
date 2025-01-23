#!/bin/bash
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
# Update package list and upgrade packages
sudo apt update && sudo apt upgrade -y
sudo apt install python3.9 -y

# Install Python
sudo apt install -y python3 python3-venv python3-dev

# Install pip for Python 3
sudo apt install -y python3-pip

# Verify installations
python3 --version
pip3 --version

echo "Python and pip have been successfully installed."

# Create a Python virtual environment
python3 -m venv ~/udmrt-env

# Activate the virtual environment in every terminal session
echo 'source ~/udmrt-env/bin/activate' >> ~/.bashrc

# Reload .bashrc to apply changes
source ~/.bashrc

echo "Python virtual environment has been created and configured to activate in every terminal session."

# Install packages from general_dependencies.txt
pip3 install -r general_dependencies.txt

echo "General packages have been successfully installed."