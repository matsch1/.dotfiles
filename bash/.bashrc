export SHELL="bash"

# Exit if not running interactively
[[ $- != *i* ]] && return

# ====================
# Environment Variables
# ====================
source ~/.dotfiles/shell/envs.sh

# ====================
# Aliases
# ====================
source ~/.dotfiles/shell/aliases.sh

# ====================
# Functions
# ====================
# source ~/.dotfiles/shell/functions.sh

# ====================
# Tools
# ====================
source ~/.dotfiles/shell/tools.sh

# ====================
# Projects
# ====================
# source ~/.dotfiles/shell/projects.sh

# ====================
# Prompt Configuration
# ====================
PS1='[\u@\h \W]\$ '

# ====================
# Keybindings
# ====================
set -o vi

# ====================
# Fuzzy Finder Configuration
# ====================
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash

# ====================
# Oh My Posh Configuration
# ====================
# git clone https://github.com/JanDeDobbeleer/oh-my-posh.git
# move directory to ~/.config
if command -v oh-my-posh >/dev/null 2>&1; then
  eval "$(oh-my-posh --init --shell bash --config ~/.cache/oh-my-posh/themes/slimfat.omp.json)"
fi

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
