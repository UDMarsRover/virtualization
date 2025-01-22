#!/bin/bash

# Check if git name is set
git_name=$(git config --global user.name)
# Check if git email is set
git_email=$(git config --global user.email)

# If either git name or email is not set, run the Python script
if [ -z "$git_name" ] || [ -z "$git_email" ]; then
    echo "Git name or email is not set. Running Python script..."
    python3 git.py
else
    echo "Git name and email are already set."
fi