#!/bin/bash

# Function to stow package configuration
stow_package() {
  user=$1
  package=$2
  if command -v stow >/dev/null 2>&1; then
    if [[ -d "/home/$user/.dotfiles/$package" ]]; then
      stow -d "/home/$user/.dotfiles" -t "/home/$user" "$package" && echo "$package stowed successfully"
    else
      echo "No dotfiles for $package!"
    fi
  else
    echo "Requires stow. Please install!"
  fi
}
