#!/usr/bin/env bash

# Exit immediately if something fails
set -e

# Function to check if Flatpak is installed
check_flatpak_installation() {
    if ! command -v flatpak &> /dev/null; then
        echo "Flatpak is not installed. Please install it and try again."
        exit 1
    fi
}

# Call the function to check if Flatpak is installed
check_flatpak_installation

# Function to find the PyCharm Flatpak application ID
find_pycharm_app_id() {
    if flatpak list | grep -q 'com.jetbrains.PyCharm-Community'; then
        echo "com.jetbrains.PyCharm-Community"
    elif flatpak list | grep -q 'com.jetbrains.PyCharm-Professional'; then
        echo "com.jetbrains.PyCharm-Professional"
    else
        echo ""
    fi
}

# Function to add the pycharm alias to the user's active shell configuration file
add_alias_to_shell_config() {
    local shell_config_file="$1"
    local pycharm_command="$2"
    echo "Adding alias for PyCharm to $shell_config_file"
    echo "
# Alias to run PyCharm installed via Flatpak
alias pycharm='$pycharm_command'" >> "$shell_config_file"
}

# Determine the user's active shell
active_shell=$(basename "$SHELL")

# Set the shell configuration file based on the active shell
shell_config_file=""
if [ "$active_shell" == "bash" ]; then
    shell_config_file="$HOME/.bashrc"
elif [ "$active_shell" == "zsh" ]; then
    shell_config_file="$HOME/.zshrc"
else
    echo "Unsupported shell: $active_shell"
    exit 1
fi

# Find PyCharm Flatpak application ID
pycharm_app_id=$(find_pycharm_app_id)

if [ -z "$pycharm_app_id" ]; then
    echo "PyCharm is not installed via Flatpak. Installing PyCharm Community Edition..."
    flatpak install -y flathub com.jetbrains.PyCharm-Community
    pycharm_app_id="com.jetbrains.PyCharm-Community"
fi

# Add the pycharm alias to the shell configuration file
add_alias_to_shell_config "$shell_config_file" "flatpak run $pycharm_app_id"

echo "Configuration complete. Please restart your shell or run 'source $shell_config_file' to apply the changes."
echo "You can now use the 'pycharm' command to open PyCharm."
