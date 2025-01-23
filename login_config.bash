#!/bin/bash

# Define the scripts to be added to the login process
SCRIPTS_TO_ADD=(
    "$HOME/virtualization/git-setup/git_config_launcher.bash"
)

# Define the profile file to modify
PROFILE_FILE="$HOME/.bash_profile"

# Function to add scripts to the profile file
add_scripts_to_profile() {
    for script in "${SCRIPTS_TO_ADD[@]}"; do
        if ! grep -Fxq "source $script" "$PROFILE_FILE"; then
            echo "Adding source $script to $PROFILE_FILE"
            echo "source $script" >> "$PROFILE_FILE"
        else
            echo "source $script is already in $PROFILE_FILE"
        fi
    done
}

# Execute the function
add_scripts_to_profile