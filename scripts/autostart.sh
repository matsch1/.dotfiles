#!/bin/bash

# =========================== functions ====================================
mount_googledrive_directory() {
  DIR=$1
  localpath="/home/matsch/$DIR"
  remotepath="Googledrive:$DIR"
  if [ ! -d "$localpath" ]; then
    mkdir -p "$localpath"
  fi
  rclone mount "$remotepath" "$localpath" --daemon --vfs-cache-mode=writes
}

# =========================== autostart ====================================
# mount googledrive
echo mount googledrive
rclone mount "Googledrive:" "/home/matsch/Googledrive/" --daemon --vfs-cache-mode=writes
Path2Mount="Files/Documents/Finanzen/Finanzplanung"
mount_googledrive_directory "$Path2Mount"
Path2Mount="Files/Documents/Finanzen/PortfolioPerformance"
mount_googledrive_directory "$Path2Mount"
Path2Mount="Files/Documents/KeePass"
mount_googledrive_directory "$Path2Mount"

# start conky
echo start conky
pkill conky
conky
