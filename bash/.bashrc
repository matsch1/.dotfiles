#
# ~/.bashrc
#

# Exit if not running interactively
[[ $- != *i* ]] && return

# ====================
# Environment Variables
# ====================
export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0
export ANDROID_HOME=$HOME/android-sdk
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

# ====================
# Aliases
# ====================
alias ls='ls --color=auto'
alias ll='ls -lah'
alias ..='cd ..'
alias grep='grep --color=auto'

# ====================
# Prompt Configuration
# ====================
PS1='[\u@\h \W]\$ '

# ====================
# Keybindings
# ====================
# Vim keybindings for bash
set -o vi

# ====================
# Fuzzy Finder Configuration
# ====================
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash

# ====================
# Oh My Posh Configuration
# ====================
eval "$(oh-my-posh --init --shell bash --config ~/.config/oh-my-posh/themes/slimfat.omp.json)"
