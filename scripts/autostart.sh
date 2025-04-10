#!/bin/bash

# =========================== functions ====================================
mount_googledrive_directory() {
  path2mount=$1
  localpath="/home/$USER/$path2mount"
  remotepath="googledrive:$path2mount"
  [ ! -d "$localpath" ] && mkdir -p "$localpath"
  rclone mount "$remotepath" "$localpath" --daemon --vfs-cache-mode=writes
  echo "$remotepath mounted succesfully"

}
# =========================== autostart ====================================
echo ==================================================
# check for rclone
if command -v bat >/dev/null 2>&1; then
  if rclone config file | xargs cat | grep -q "\[googledrive\]"; then
    echo "Google Drive config exists."
  else
    echo "rclone must be configured for googledrive"
    exit 1
  fi
else
  echo "rclone not installed"
  exit 1
fi

# mount googledrive
echo mount googledrive
declare -a paths=(
  "_Ablage"
  "Files/Documents/Finanzen/Finanzplanung"
  "Files/Documents/Finanzen/PortfolioPerformance"
  "Files/Documents/KeePass"
  "Files/Gitarre"
  "Files/Sport"
)
for Path2Mount in "${paths[@]}"; do
  mount_googledrive_directory "$Path2Mount"
done

echo ==================================================
# Start synchting for getting actual obsidan files
echo start obsidian sync
if command -v syncthing >/dev/null 2>&1; then
  echo "syncthing command found"
else
  echo "syncthing not installed"
  exit 1
fi
syncthing -no-browser >/dev/null 2>&1 &
disown

echo ==================================================
# start conky
echo start conky
if command -v conky >/dev/null 2>&1; then
  echo "conky command found"
else
  echo "conky not installed"
  exit 1
fi
pkill conky
conky >/dev/null 2>&1 &

echo ==================================================
echo NAS backup
./nas-backup.sh

exit 0
