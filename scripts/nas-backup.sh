#!/bin/bash

MAX_NUMBER_BACKUPS=7
REMOTE="fritznas:/fritz.nas/NAS/Matthias/backups"

# =========================== functions ====================================
backup_path() {
  path2bak=$1
  pathremote="$2/$path2bak"
  echo " "
  echo "Backing up: $path2bak"
  rclone copy "$path2bak" "$pathremote" --progress --transfers=16 --checkers=16 --fast-list
  echo "Backup done sucessfully: $pathremote"
  echo " "
}

# =========================== backup ====================================
echo "========= Start backup ========= "
do_backup=false # is set to true is preconditions are fullfilled

declare -a paths=(
  "/home/$USER/Desktop/"
  "/home/$USER/Downloads/"
  "/home/$USER/Pictures/"
)
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
remotepath="$REMOTE/bak_$timestamp/"
number_of_backups=$(rclone lsf "$REMOTE" --dirs-only | wc -l)

# check number of existing backups
if [ "$number_of_backups" -gt "$MAX_NUMBER_BACKUPS" ]; then
  # Get the oldest folder (alphabetical order, assuming timestamped names)
  oldest=$(rclone lsf "$REMOTE" --dirs-only |
    sort | head -n 1)

  # Delete it
  rclone purge "$REMOTE/$oldest"
fi

# check date of last backup
newest=$(rclone lsf "fritznas:/fritz.nas/NAS/Matthias/backups" --dirs-only | sort | tail -n 1)
if [ -z "$newest" ]; then
  echo "No old backup found"
  do_backup=true
fi
timestamp_str=$(echo "$newest" | sed 's#/$##' | sed 's/^bak_//')
formatted_ts=$(echo "$timestamp_str" | sed 's/_/ /' | sed 's/\([0-9]\{2\}\)-\([0-9]\{2\}\)-\([0-9]\{2\}\)$/\1:\2:\3/')
backup_time=$(date -d "$formatted_ts" +%s)
current_time=$(date +%s)
age=$((current_time - backup_time))

if [[ $do_backup = false ]]; then
  # Check if older than 2 days
  if ((age > 2 * 24 * 60 * 60)); then
    do_backup=true
  else
    echo "✅ Last backup is recent."
  fi
fi

# Backup
if [[ $do_backup == true ]]; then
  for backuppath in "${paths[@]}"; do
    backup_path "$backuppath" "$remotepath"
  done
fi

echo "========= Backup done ========= "
