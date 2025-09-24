#!/bin/bash

BACKUPREPO="/home/$USER/src/matschbackup/"

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
./backup --remote fritznas:/fritz.nas/NAS/Matthias/backups --path /home/"$USER"/src --path /home/"$USER"/.config --path /home/"$USER"/Files --path /home/"$USER"/matschdrive --path /home/"$USER"/obsidian --path /home/"$USER"/.ssh --zip --debug
