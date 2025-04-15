#!/bin/bash

echo ==================================================
# start conky
echo "Start conky"
if command -v conky >/dev/null 2>&1; then
  echo "conky installation found"
else
  echo "conky not installed"
  exit 1
fi
if [[ $(pgrep --count conky) -gt 1 ]]; then
  echo "Killing Conky..."
  pkill conky
else
  echo "Starting Conky..."
  conky >/dev/null 2>&1 &
fi
