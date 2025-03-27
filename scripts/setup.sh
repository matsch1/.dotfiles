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

# Function to stow package configuration
stow_package() {
  user=$1
  package=$2
  if command -v stow >/dev/null 2>&1; then
    if [[ -d "../$package" ]]; then
      stow -d .. -t /home/$user "$package" && echo "$package stowed successfully"
    else
      echo "No dotfiles for $package!"
    fi
  else
    echo "Requires stow. Please install!"
  fi
}

# Function to install a package normally
install_package() {
  package=$1
  echo "Installing $package..."
  $installCmd "$package" && write_log "$package"
}

# Function to log installation results
write_log() {
  package=$1
  log_file="$HOME/setup-log.txt"
  if command -v "$package" &>/dev/null; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $package Installed" >>"$log_file"
  else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $package FAILED TO INSTALL!!!" >>"$log_file"
  fi
}

# Define a mapping of packages to special installation functions
declare -A special_installers=(
  ["neovim"]="install_neovim"
  ["zoxide"]="install_zoxide"
  ["oh-my-posh"]="install_oh_my_posh"
  ["tmux"]="install_tmux"
  ["go"]="install_go"
  ["zsh"]="install_zsh"
  ["lazygit"]="install_lazygit"
)

# Special installation functions
install_go() {
  wget https://go.dev/dl/go1.24.1.linux-amd64.tar.gz
  sudo tar -C /usr/local -xzf go1.24.1.linux-amd64.tar.gz
  rm go1.24.1.linux-amd64.tar.gz
}

install_lazygit() {
  if command -v go >/dev/null 2>&1; then
    go install github.com/jesseduffield/lazygit@latest
  else
    install_go
  fi
}

install_zsh() {
  install_package "zsh"
  chsh -s $(which zsh)
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

  write_log "neovim"
}

install_neovim() {
  dependencies=("ninja-build" "gettext" "cmake" "unzip" "curl" "build-essential")
  [[ $os == "arch" ]] && dependencies=("base-devel" "cmake" "unzip" "ninja" "curl")

  for pkg in "${dependencies[@]}"; do
    install_package "$pkg"
  done

  git clone https://github.com/neovim/neovim
  cd neovim || exit
  git checkout stable
  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
  cd ..
  rm -rf neovim
  write_log "neovim"
}

install_zoxide() {
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
  sudo mv ~/.local/bin/zoxide /usr/local/bin/zoxide
  write_log "zoxide"
}

install_oh_my_posh() {
  curl -s https://ohmyposh.dev/install.sh | bash -s
  git clone https://github.com/ryanoasis/nerd-fonts.git ./nerd-fonts
  ./nerd-fonts/install.sh FiraCode
  rm -rf ./nerd-fonts
  write_log "oh-my-posh"
}

install_tmux() {
  install_package "tmux"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  tmux send-keys "C-s-r"
  tmux send-keys "C-s-I"
  write_log "tmux"
}

setup() {
  # Detect user and confirmation mode
  user=${1:-$USER}
  noconfirm=${2:-false}

  # List of default packages
  if [[ $# -gt 2 ]]; then
    packages=("${@:3}")
  else
    packages=("stow" "bash" "git" "zellij" "tmux" "fzf" "eza" "bat" "zoxide" "neovim" "conky" "alacritty" "oh-my-posh")
  fi

  # Determine OS
  os=$(grep '^ID_LIKE=' /etc/os-release | cut -d= -f2 | tr -d '"')

  # Set package manager command
  if [[ $os == "debian" ]]; then
    echo "Debian based system detected"
    installCmd="sudo apt-get install -y"
  elif [[ $os == "arch" ]]; then
    echo "Arch based system detected"
    installCmd="sudo pacman -S --noconfirm"
  else
    echo "Unsupported OS: $os"
    exit 1
  fi
  # Confirmation prompt
  if [[ $noconfirm == false ]]; then
    read -p "Install for user $user? (y/n): " choice
  else
    choice=y
  fi
  [[ "$choice" != "y" && "$choice" != "Y" ]] && echo "Exit by user" && exit 1

  # Install packages from packages list
  for package in "${packages[@]}"; do
    if [[ $noconfirm == false ]]; then
      read -p "Install $package? (y/n): " choice
    else
      choice=y
    fi

    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
      if [[ -n "${special_installers[$package]}" ]]; then
        ${special_installers[$package]}
      else
        install_package "$package"
      fi

      # Stow dotfiles if available
      stow_package $user $package
    else
      echo "Skipping $package..."
    fi
  done

}
########################################################################
# Detect user and confirmation mode
user=${1:-$USER}
noconfirm=${2:-false}

# List of default packages
if [[ $# -gt 2 ]]; then
  packages=("${@:3}")
else
  packages=("stow" "bash" "git" "zellij" "tmux" "fzf" "eza" "bat" "zoxide" "neovim" "conky" "alacritty" "oh-my-posh")
fi

setup $user $noconfirm ${packages[@]}
