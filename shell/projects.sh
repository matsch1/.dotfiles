# ====================
# Projects
# ====================

# [ -d ~/src/goalpacer/ ] && alias devgoalpacer='~/.dotfiles/scripts/start_tmux.sh ~/src/goalpacer/'
# [ -d ~/src/shellmaster/ ] && alias devshellmaster='~/.dotfiles/scripts/start_tmux.sh ~/src/shellmaster/'

if [ -d "$HOME/src/cust/" ]; then
  echo "Set up cust"
  source "$HOME/src/cust/settings.sh"
else
  echo "No cust settings"
fi
