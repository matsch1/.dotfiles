#!/bin/bash

# Set package manager command
get_install_command() {
  os=$1
  if [[ $os == "debian" ]]; then
    echo "Debian based system detected" >&2
    installCmd="sudo apt-get install -y"
  elif [[ $os == "arch" ]]; then
    echo "Arch based system detected" >&2
    installCmd="sudo pacman -S --noconfirm"
  elif [[ $os == "termux" ]]; then
    echo "Termux based system detected" >&2
    installCmd="pkg install -y"
  else
    echo "Unsupported OS: $os" >&2
    exit 1
  fi
  echo "installCmd = $installCmd" >&2
  echo "$installCmd"
}

get_install_command "$1"
