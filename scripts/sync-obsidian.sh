#!/bin/bash

# echo trigger obsidian sync
# SYNC_URL="http://127.0.0.1:8384/rest/db/scan?folder=$SYNCTHING_OBSIDIAN_FOLDER_ID"
# curl -X POST -H "X-API-Key: $SYNCTHING_API_KEY" $SYNC_URL -w "HTTP status: %{http_code}\n"
echo "Trigger Obsidian sync"
SYNC_URL="http://127.0.0.1:8384/rest/db/scan?folder=$SYNCTHING_OBSIDIAN_FOLDER_ID"

# Trigger the sync
response=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H "X-API-Key: $SYNCTHING_API_KEY" $SYNC_URL)

if [ "$response" -eq 200 ]; then
  echo "Sync triggered successfully. Monitoring sync status..."
else
  echo "Failed to trigger sync. HTTP status: $response"
  exit 1
fi

# Monitor sync status
SYNC_COMPLETE=0
while [ "$SYNC_COMPLETE" -eq 0 ]; do
  # Check folder sync status
  status_response=$(curl -s -H "X-API-Key: $SYNCTHING_API_KEY" "http://127.0.0.1:8384/rest/db/status?folder=$SYNCTHING_OBSIDIAN_FOLDER_ID")

  needFiles=$(echo "$status_response" | jq '.needFiles')
  state=$(echo "$status_response" | jq -r '.state')

  countRetries=0
  if [ "$needFiles" -eq 0 ] && [ "$state" == "idle" ]; then
    SYNC_COMPLETE=1
    echo "Obsidian synchronization complete!"
    exit 0
  else
    echo "Sync in progress. State: $state, Files remaining: $needFiles"
    if [ "$countRetries" -gt 4 ]; then
      echo "Obsidian sync failed!"
      exit 1
    fi
    countRetries=$((countRetries + 1))
    sleep 1
  fi
done
