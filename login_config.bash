#!/bin/bash

# Define the scripts to be added to the login process
SCRIPTS_TO_ADD=(
    "$HOME/virtualization/git-setup/git_config_launcher.bash"
)

# Define the profile.d directory
PROFILE_D_DIR="/etc/profile.d"

# Function to create a new script in profile.d
create_profile_d_script() {
    for script in "${SCRIPTS_TO_ADD[@]}"; do
        SCRIPT_NAME=$(basename "$script")
        PROFILE_D_SCRIPT="$PROFILE_D_DIR/$SCRIPT_NAME"
        
        if [ ! -f "$PROFILE_D_SCRIPT" ]; then
            echo "Creating $PROFILE_D_SCRIPT"
            echo "source $script" > "$PROFILE_D_SCRIPT"
        else
            echo "$PROFILE_D_SCRIPT already exists"
        fi
    done
}

# Execute the function
create_profile_d_script