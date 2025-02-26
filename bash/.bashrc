#
# ~/.bashrc
#

# Exit if not running interactively
[[ $- != *i* ]] && return

# ====================
# Environment Variables
# ====================
export XDG_CONFIG_HOME=~/.config
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=0
export ANDROID_HOME=/home/matsch/android-sdk
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/bin
[ -f "~/Files/Documents/.env" ] && source ~/Files/Documents/.env

# ====================
# Aliases
# ====================
alias ls='ls --color=auto'
alias ll='ls -lah'
alias ..='cd ..'
alias ~='cd ~'
alias grep='grep --color=auto'
alias find='find . -type f'
alias gitgraph='git log --oneline --graph --decorate --color'

# === funtctions ===
# find string in local directory
findstr() {
  grep -r "$1" .
}

# make full systemupgrade
sysupgrade() {
  if [ -f /etc/debian_version ]; then
    # Debian-based system
    sudo apt update && sudo apt upgrade && sudo apt dist-upgrade
  elif [ -f /etc/arch-release ]; then
    # Arch-based system
    sudo pacman -Syu
  else
    echo "Unsupported system."
  fi
}

# search for installed package
findpkgi() {
  package_name="$1"

  if [ -f /etc/debian_version ]; then
    # Debian-based system
    dpkg -l | grep -i "$package_name"
    if dpkg -l | grep -i "$package_name"; then
      dpkg-query -L "$package_name" | head -n 1
    else
      echo "Package '$package_name' is not found."
    fi
  elif [ -f /etc/arch-release ]; then
    # Arch-based system
    pacman -Qs "$package_name"
    if pacman -Qs "$package_name" >/dev/null; then
      pacman -Ql "$package_name" | head -n 1
    else
      echo "Package '$package_name' is not found."
    fi
  else
    echo "Unsupported system."
  fi
}

# find package in repository
findpkg() {
  package_name="$1"

  if [ -f /etc/debian_version ]; then
    # Debian-based system
    apt-cache search "$package_name"
  elif [ -f /etc/arch-release ]; then
    # Arch-based system
    pacman -Ss "$package_name" | grep -i "$package_name"
  else
    echo "Unsupported system."
  fi
}

# === tools ===
# sudo pacman -S eza
[ command -v exa ] &>/dev/null && alias ls='eza'

# sudo pacman -S bat
[ command -v bat ] &>/dev/null && alias cat='bat'

# curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
[ command -v zoxide ] &>/dev/null && (
  eval "$(zoxide init bash)"
  alias cd='z'
)

# === projects ===
[ -d ~/src/goalpacer/ ] && alias devgoalpacer='~/.dotfiles/scripts/start_tmux.sh ~/src/goalpacer/'
[ -d ~/src/shellmaster/ ] && alias devshellmaster='~/.dotfiles/scripts/start_tmux.sh ~/src/shellmaster/'

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
# git clone  https://github.com/JanDeDobbeleer/oh-my-posh.git
# move directory to ~/.config
eval "$(oh-my-posh --init --shell bash --config ~/.config/oh-my-posh/themes/slimfat.omp.json)"
