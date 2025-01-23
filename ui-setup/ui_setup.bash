#!/bin/bash

# URL of the image
IMAGE_URL="https://rkuederle.app/udmrt/vm/mars.jpg"
# Path to save the downloaded image
IMAGE_PATH="$HOME/Pictures/background.jpg"

# Download the image
wget -O "$IMAGE_PATH" "$IMAGE_URL"

# Set the downloaded image as the desktop background
gsettings set org.gnome.desktop.background picture-uri "file://$IMAGE_PATH"