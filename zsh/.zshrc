
ZSH_THEME=""


# now load zsh-syntax-highlighting plugin

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
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
        zsh-syntax-highlighting
        zsh-autosuggestions
        git
        fzf
        kubectl
        kube-ps1
)

source ~/.oh-my-zsh/oh-my-zsh.sh

# GitHub Dark prompt with ANSI fallbacks for terminals without true color.
function {
  local accent=blue branch=magenta error=red muted=white suggestion=8
  if [[ $COLORTERM == (truecolor|24bit) ]]; then
    accent='#58a6ff' branch='#d2a8ff' error='#ff7b72' muted='#8b949e' suggestion='#8b9eb2'
  elif [[ $TERM == *256color* ]]; then
    accent=75 branch=183 error=210 muted=246 suggestion=110
  fi

  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$suggestion"
  ZSH_THEME_GIT_PROMPT_PREFIX="%F{$branch}git:"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
  ZSH_THEME_GIT_PROMPT_CLEAN=""
  ZSH_THEME_GIT_PROMPT_DIRTY=" %F{$error}*"

  PROMPT="\$(kube_ps1) %(!.%F{$error}.%F{$muted})%n@%m%f %B%F{$accent}%~%f%b "
  PROMPT+="\$(git_prompt_info)%(!.%F{$error}#.%F{$accent}>)%f "
  PROMPT2="%F{$accent}%_>%f "
  RPROMPT="%(?..%F{$error}exit %?%f)"
}

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
source ~/.dotfiles/shell/projects.sh

# ====================
# Keybindings
# ====================
# Vim keybindings for shell
set -o vi
# Keybinding for zsh-autosuggestions
bindkey '^[[Z' autosuggest-accept
#Keyybinding for path suggestions
bindkey '^I' expand-or-complete



# # fnm
# FNM_PATH="/home/maschaefer/.local/share/fnm"
# if [ -d "$FNM_PATH" ]; then
#   export PATH="/home/maschaefer/.local/share/fnm:$PATH"
#   eval "`fnm env`"
# fi


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
