# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="awesomepanda"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "awesomepanda")

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
        zsh-syntax-highlighting
        zsh-autosuggestions
        git
        fzf
)

source ~/.oh-my-zsh/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ====================
# Environment Variables
# ====================
export XDG_CONFIG_HOME=~/.config
export EDITOR=nvim
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=0
export ANDROID_HOME=/home/matsch/android-sdk
export CHROME_EXECUTABLE=/usr/bin/chromium
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
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias grep='grep --color=auto'
alias find='find . -type f'
alias gitgraph='git log --oneline --graph --decorate --color'
alias lg='lazygit'
alias ld='lazydocker'

# # === functions ===
# # find string in local directory
# findstr() {
#   grep -r "$1" .
# }
#
# # make full systemupgrade
# sysupgrade() {
#   if [ -f /etc/debian_version ]; then
#     # Debian-based system
#     sudo apt update && sudo apt upgrade && sudo apt dist-upgrade
#   elif [ -f /etc/arch-release ]; then
#     # Arch-based system
#     sudo pacman -Syu
#   else
#     echo "Unsupported system."
#   fi
# }
#
# # search for installed package
# # findpkgi() {
# #   package_name="$1"
# #
# #   if [ -f /etc/debian_version ]; then
# #     # Debian-based system
# #     dpkg -l | grep -i "$package_name"
# #     if dpkg -l | grep -i "$package_name"; then
# #       dpkg-query -L "$package_name" | head -n 1
# #     else
# #       echo "Package '$package_name' is not found."
# #     fi
# #   elif [ -f /etc/arch-release ]; then
# #     # Arch-based system
# #     pacman -Qs "$package_name"
# #     if pacman -Qs "$package_name" >/dev/null; then
# #       pacman -Ql "$package_name" | head -n 1
# #     else
# #       echo "Package '$package_name' is not found."
# #     fi
# #   else
# #     echo "Unsupported system."
# #   fi
# # }
#
# # find package in repository
# # findpkg() {
# #   package_name="$1"
# #
# #   if [ -f /etc/debian_version ]; then
# #     # Debian-based system
# #     apt-cache search "$package_name"
# #   elif [ -f /etc/arch-release ]; then
# #     # Arch-based system
# #     pacman -Ss "$package_name" | grep -i "$package_name"
# #   else
# #     echo "Unsupported system."
# #   fi
# # }
#
# === tools ===
# sudo pacman -S eza
if command -v exa >/dev/null 2>&1; then
  alias ls='eza'
fi

# sudo pacman -S bat
if command -v bat >/dev/null 2>&1; then
  alias cat='bat'
fi

# curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init $SHELL)"
  alias cd='z'
  _ZO_DOCTOR=0
fi

# # === projects ===
# # [ -d ~/src/goalpacer/ ] && alias devgoalpacer='~/.dotfiles/scripts/start_tmux.sh ~/src/goalpacer/'
# # [ -d ~/src/shellmaster/ ] && alias devshellmaster='~/.dotfiles/scripts/start_tmux.sh ~/src/shellmaster/'

# ====================
# Zellij autostart
# ====================
[[ -z $ZELLIJ ]] && zellij

# ====================
# Keybindings
# ====================
# Vim keybindings for shell
set -o vi

