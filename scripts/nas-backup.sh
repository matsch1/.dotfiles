# =========================== functions ====================================
backup_path() {
  path2bak=$1
  localpath="/home/$USER/$path2bak"
  remotepath="fritznas:/fritz.nas/NAS/Matthias/backup/$path2bak"
  rclone sync "$localpath" "$remotepath"
  echo "Backup done sucessfully: $remotepath"
}

# =========================== backup ====================================
echo "Start backup"
declare -a paths=(
  "Desktop/"
  "Documents/"
)
for Path2Mount in "${paths[@]}"; do
  backup_path "$Path2Mount"
done
echo "Backup done"
