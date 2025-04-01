# ====================
# Projects
# ====================

############ Shellmaster ###############
if [ -d "$HOME/src/shellmaster/" ]; then
  # alias devshellmaster='~/.dotfiles/scripts/start_tmux.sh ~/src/shellmaster/'
fi

############ Golpacker ###############
if [ -d "$HOME/src/goalpacer/" ]; then
  # alias devgoalpacer='~/.dotfiles/scripts/start_tmux.sh ~/src/goalpacer/'
fi

############ Customer stuff (unversioned) ###############
if [ -d "$HOME/src/cust/" ]; then
  echo "Set up cust"
  source "$HOME/src/cust/settings.sh"
else
  echo "No cust settings"
fi
