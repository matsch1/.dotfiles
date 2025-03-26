#!/bin/bash

# This script installs specified packages on a Debian- or Arch-based Linux system.
# It detects the user's operating system, determines the appropriate package manager,
# and installs the given packages. If no packages are specified as arguments, a default
# set of packages is installed. The script also logs installation results and
# stows dotfiles for installed packages.

# Usage:
#   ./install_packages.sh [USER] [NOCONFIRM] [PACKAGE1] [PACKAGE2] ...
#
#   - USER (optional): The username for whom the packages will be installed. Defaults to the current user.
#   - NOCONFIRM (optional): Skip confirmation. Defaults is "Ask for confirmation".
#   - PACKAGE1, PACKAGE2, ... (optional): List of packages to install. If not provided, a default list is used.
#

########################################################################

# Detect user and confirmation mode
user=${1:-$USER}
noconfirm=${2:-false}
profile=${3:-"workstation"}

echo " =============================== "
echo "Setup machine for user $user"
echo "Profile: $profile"

declare -A profiles
profiles["workstation"]="stow bash git zellij fzf eza bat zoxide fd-find neovim alacritty oh-my-posh docker rclone displaylink thunderbird keepassxc obsidian portfolio-performance"
profiles["server"]="stow git zellij fzf eza bat fd-find zoxide neovim wget"

# Get the package list for the profile
mapfile -t packages <<<"${profiles[$profile]:-${profiles["workstation"]}}"
echo "Packages: ${packages[@]}"

sudo ./setup.sh $user $noconfirm $packages
