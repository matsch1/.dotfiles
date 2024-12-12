#!/bin/bash

mount_hdd() {
  DEVICE="$1"
  LABEL="$2"
  FSTYPE="$3"
  MOUNT_POINT="/mnt/$LABEL"

  echo "Processing device: $DEVICE (label: $LABEL)"

  # Check if it's already mounted
  if findmnt -n "$DEVICE" >/dev/null 2>&1; then
    echo "Device is already mounted."
  else
    echo "Mounting device: $DEVICE to $MOUNT_POINT"

    # Create the mount point if it doesn't exist
    [ ! -d "$MOUNT_POINT" ] && sudo mkdir -p "$MOUNT_POINT"

    # Mount the device
    if sudo mount -t "$FSTYPE" "$DEVICE" "$MOUNT_POINT"; then
      echo "Device mounted successfully at $MOUNT_POINT"
    else
      echo "Failed to mount the device."
    fi
  fi
}

echo "Detecting external drives for mounting..."

# Get all external devices with a label (adjust filter as needed)
lsblk -o NAME,FSTYPE,LABEL,TYPE,MOUNTPOINT -pn | grep -w part | grep -E "sdb|sdc" | sed 's/└─//' | while read -r LINE; do
  echo "$LINE"
  DEVICE=$(echo "$LINE" | awk '{print $1}')
  FSTYPE=$(echo "$LINE" | awk '{print $2}')
  LABEL=$(echo "$LINE" | awk '{print $3}')

  # Only process devices with labels
  [ -n "$LABEL" ] && mount_hdd "$DEVICE" "$LABEL" "$FSTYPE"
done
