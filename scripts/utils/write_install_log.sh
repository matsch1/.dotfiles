#!/bin/bash

# Function to log installation results
write_log() {
  package=$1
  log_file="$HOME/setup-log.txt"
  if command -v "$package" &>/dev/null; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $package Installed" >>"$log_file"
  else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $package FAILED TO INSTALL!!!" >>"$log_file"
  fi
}
