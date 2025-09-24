#!/bin/bash

# Function to determine OS
function get_os {
  if [ -n "$TERMUX_VERSION" ]; then
    os="termux"
    echo "Running on Termux"
  else
    os=$(grep '^ID_LIKE=' /etc/os-release | cut -d= -f2 | tr -d '"')
    if [ -z "$os" ]; then
      os=$(grep '^ID=' /etc/os-release | cut -d= -f2 | tr -d '"')
    fi
  fi
  echo "$os"
}

get_os
