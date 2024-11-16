# Managing my private dotfiles for usage on different machines

Privately I use a linux machine and I want to synch my settings to my Windows WSL system.

# Symbolic Links using STOW
Steps to follow:
1. Install STOW
2. Clone this repository into home directory
3. Steps for every dotfile:
  1. Move dotfile to repository path using the name conevtion <package_name>/<dotfile>. See exisiting dotfiles.
  2. Use ``stow <package_name>`` to create links or ``stow -D <package_name>`` to delete links
  3. Check if links exist using ll in source directory from the original dotfile.
