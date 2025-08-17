#!/bin/bash

# =========================== autostart ====================================
echo ==================================================
echo =============== Startup =========================

echo ==================================================
# Start synchting for getting actual obsidan files
echo "Start obsidian sync"
if command -v syncthing >/dev/null 2>&1; then
  echo "syncthing command found"
else
  echo "syncthing not installed"
  exit 1
fi
syncthing --no-browser >/dev/null 2>&1 &
disown

echo ==================================================
echo "Mount googledrive directories"
# check for rclone
if command -v rclone >/dev/null 2>&1; then
  if cat $(rclone config file | sed -n '2p') | grep -q "\[googledrive\]"; then
    echo "Google Drive config exists."
  else
    echo "rclone must be configured for googledrive"
    exit 1
  fi
else
  echo "rclone not installed"
  exit 1
fi

localpath="/home/$USER/googledrive"
remotepath="googledrive:"
[ ! -d "$localpath" ] && mkdir -p "$localpath"
rclone mount "$remotepath" "$localpath" --daemon --vfs-cache-mode=writes
echo "$remotepath mounted succesfully"

echo ==================================================
echo "NAS backup"
/home/"$USER"/.dotfiles/scripts/matschbackup.sh

exit 0
