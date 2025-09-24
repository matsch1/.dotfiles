# ====================
# Tools
# ====================

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
  eval "$(zoxide init "$SHELL")"
  alias cd='z'
  _ZO_DOCTOR=0
fi

# zellij
if command -v zellij >/dev/null 2>&1; then
  [[ -z $ZELLIJ ]] && zellij
fi
