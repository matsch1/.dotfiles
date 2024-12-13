#
# ~/.bashrc
#

# Exit if not running interactively
[[ $- != *i* ]] && return

# ====================
# Environment Variables
# ====================
export XDG_CONFIG_HOME=~/.config
export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0
export ANDROID_HOME=$HOME/android-sdk
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/usr/local/go/bin

# ====================
# Aliases
# ====================
alias ls='ls --color=auto'
alias ll='ls -lah'
alias bat='batcat'
alias ..='cd ..'
alias grep='grep --color=auto'

# ====================
# Prompt Configuration
# ====================
PS1='[\u@\h \W]\$ '

# ====================
# TMUX autostart
# ====================
[[ -z $TMUX ]] && tmux

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

# ====================
# Oh My Posh Configuration
# ====================
eval "$(oh-my-posh --init --shell bash --config ~/.config/oh-my-posh/themes/slimfat.omp.json)"
