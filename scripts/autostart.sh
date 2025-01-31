#!/bin/bash

# =========================== functions ====================================
mount_googledrive_directory() {
  path2mount=$1
  localpath="/home/matsch/$path2mount"
  remotepath="Googledrive:$path2mount"
  [ ! -d "$localpath" ] && mkdir -p "$localpath"
  rclone mount "$remotepath" "$localpath" --daemon --vfs-cache-mode=writes
  echo "$remotepath mounted succesfully"

}
# =========================== autostart ====================================
echo ==================================================
# mount googledrive
echo mount googledrive
declare -a paths=(
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
syncthing -no-browser >/dev/null 2>&1 &
disown

echo ==================================================
# start conky
echo start conky
pkill conky
conky >/dev/null 2>&1 &

exit 0
