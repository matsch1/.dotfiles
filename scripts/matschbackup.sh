#!/bin/bash

BACKUPREPO="/home/$USER/src/matschbackup/"

# Check if main.go exists
if [[ ! -d "$BACKUPREPO" ]]; then
  echo "❌ Error: local matschbackup repository not found."
  exit 1
fi
cd "$BACKUPREPO"

# Check if go is installed
if ! command -v go >/dev/null 2>&1; then
  echo "❌ Error: Go is not installed or not in your PATH."
  exit 1
fi

# Building and running backup
go build -o backup "$BACKUPREPO/main.go"
./backup -v -c
