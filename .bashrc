#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases
alias ls='ls --color=auto'
alias ll='ls -lah'
alias ..='cd ..'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '

# source fuzzy finder settings
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source /usr/share/fzf/key-bindings.bash

# oh-my-posh
eval "$(oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/powerline.omp.json)"

# environment variables
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
