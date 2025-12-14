#!/bin/bash

BACKUPREPO="/home/matsch/src/matschbackup/"

# Check if main.go exists
if [[ ! -d "$BACKUPREPO" ]]; then
  echo "❌ Error: local matschbackup repository not found."
  exit 1
fi
cd "$BACKUPREPO"

# Check if go is installed
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
if ! command -v go >/dev/null 2>&1; then
  echo "❌ Error: Go is not installed or not in your PATH."
  exit 1
fi

# Building and running backup
go build -o backup "$BACKUPREPO/main.go"
if [ -d /home/matsch/vpsbak/ ]; then
  ./backup --remote fritznas:/fritz.nas/NAS/Matthias/backups/homie --path /var/lib/rancher/k3s/storage/ --path /home/matsch/k3s_apps --path /home/matsch/.ssh --path /home/matsch/vpsbak/ --zip --debug --max-days=1
  rm -rf /home/matsch/vpsbak/
else
  ./backup --remote fritznas:/fritz.nas/NAS/Matthias/backups/homie --path /var/lib/rancher/k3s/storage/ --path /home/matsch/k3s_apps --path /home/matsch/.ssh --zip --debug --max-days=1
fi
