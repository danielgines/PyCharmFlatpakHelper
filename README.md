# PyCharmFlatpakHelper

This Bash script helps you create a convenient 'pycharm' alias to run PyCharm (Community or Professional Edition) installed via Flatpak on your Linux system.

## Features

- Checks if Flatpak is installed and prompts the user to install it if necessary.
- Automatically detects the PyCharm Flatpak application ID.
- Adds a 'pycharm' alias to the user's active shell configuration file (e.g., `.bashrc` or `.zshrc`).

## Note
This script assumes that PyCharm is already installed via Flatpak.

## How to Use

### Method 1: Running the script from GitHub

1. Execute the script using one of the following commands:

```sh
curl -L https://raw.githubusercontent.com/danielgines/PyCharmFlatpakHelper/main/configure_pycharm.sh | bash
```

or

```sh
wget -O- https://raw.githubusercontent.com/danielgines/PyCharmFlatpakHelper/main/configure_pycharm.sh | bash
```

### Method 2: Running the script locally

1. Save the script to a file, e.g., `configure_pycharm.sh`.
2. Make the script executable by running `chmod +x configure_pycharm.sh`.
3. Execute the script by running `./configure_pycharm.sh`.
4. Restart your shell or run `source ~/.bashrc` (or `source ~/.zshrc` if you're using Zsh) to apply the changes.

You can now use the 'pycharm' command to open PyCharm.
