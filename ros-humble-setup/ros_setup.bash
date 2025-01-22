#!/bin/bash

# Update your system
sudo apt update && sudo apt upgrade -y

# Add the ROS 2 GPG key
sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# Add the ROS 2 repository
sudo sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'

# Update your system again
sudo apt update

# Install ROS 2 Humble
sudo apt install ros-humble-desktop -y

# Source the ROS 2 setup script
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Install dependencies for building packages
sudo apt install python3-rosdep python3-colcon-common-extensions -y

# Initialize rosdep
sudo rosdep init
rosdep update

echo "ROS 2 Humble installation complete."