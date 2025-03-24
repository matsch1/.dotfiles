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

# user
user=${1:-$USER}

# noconfirm
noconfirm=${2:-false}

# List of packages to install
if [[ $# -gt 2 ]]; then
  packages=("${@:3}") # Use arguments starting from position 2
else
  packages=("stow" "bash" "git" "tmux" "fzf" "eza" "bat" "zoxide" "neovim" "conky" "alacritty" "oh-my-posh")
fi

# Function to install a package
install_package() {
  package=$1

  # Check OS
  os=$(grep '^ID_LIKE=' /etc/os-release | cut -d= -f2 | tr -d '"')
  # Set installation command
  if [[ $os == "debian" ]]; then
    echo "Debian based system"
    installCmd="sudo apt-get install -y"
  elif [[ $os == "arch" ]]; then
    echo "Arch based system"
    installCmd="sudo pacman -S --noconfirm"
  else
    echo "Unsupported OS: $os"
    return 1
  fi

  # Install the package
  echo "Installing $package"
  if [[ $package == "bash" ]]; then
    echo "bash already installed"
  elif [[ $package == "neovim" ]]; then
    if [[ $os == "debian" ]]; then
      for package in ninja-build gettext cmake unzip curl build-essential; do
        $installCmd "$package"
      done
    elif [[ $os == "arch" ]]; then
      for package in base-devel cmake unzip ninja curl; do
        $installCmd "$package"
      done
    fi
    git clone https://github.com/neovim/neovim
    cd neovim
    git checkout stable
    make CMAKE_BUILD_TYPE=RelWithDebInfo

    sudo make install
    cd ..
    rm -rf neovim
  elif [[ $package == "zoxide" ]]; then
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
  elif [[ $package == "oh-my-posh" ]]; then
    curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /usr/local/bin
    git clone https://github.com/ryanoasis/nerd-fonts.git ./nerd-fonts
    ./nerd-fonts/install.sh FiraCode
    rm -rf ./nerd-fonts
  elif [[ $package == "tmux" ]]; then
    $installCmd "$package"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux send-keys "C-s-r"
    tmux send-keys "C-s-I"
  else
    $installCmd "$package"
  fi

  write_log "$package"
}

# Function to write installation log
write_log() {
  package=$1
  log_file="$HOME/setup-log.txt"

  if type -p "$package" >/dev/null; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $package Installed" >>"$log_file"
  else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $package FAILED TO INSTALL!!!" >>"$log_file"
  fi
}

# ############### INSTALLATION ####################
if [[ $noconfirm == false ]]; then
  read -p "Install for user $user? (y/n): " choice
else
  choice=y
fi
if [[ "$choice" != "y" && "$choice" != "Y" ]]; then
  echo "Exit by user"
  exit 1
fi

for package in "${packages[@]}"; do
  if [[ $noconfirm == false ]]; then
    read -p "Install $package? (y/n): " choice
  else
    choice=y
  fi
  if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    install_package "$package"
    (stow -d .. -t /home/$user $package && echo "$package stowed succesfully") || echo "No dotfiles for $package"
  else
    echo "Installation skipped."
  fi
done
