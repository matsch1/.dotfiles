#!/bin/bash

mount_hdd() {
  LABEL="$1"
  MOUNT_POINT="$2"

  DEVICE=$(lsblk -o NAME,LABEL -pn | grep -w "$LABEL" | awk '{print $1}' | sed 's/└─//')

  if [ -n "$DEVICE" ]; then
    echo "Device with label '$LABEL' found: $DEVICE"

    # Check if it's already mounted
    if findmnt -n "$DEVICE" >/dev/null 2>&1; then
      echo "Device is already mounted."
    else
      echo "Mounting device: $DEVICE to $MOUNT_POINT"

      # Create the mount point if it doesn't exist
      [ ! -d "$MOUNT_POINT" ] && sudo mkdir -p "$MOUNT_POINT"

      # Mount the device
      if sudo mount -t ntfs-3g "$DEVICE" "$MOUNT_POINT"; then
        echo "Device mounted successfully at $MOUNT_POINT"
      else
        echo "Failed to mount the device."
      fi
    fi
  else
    echo "Device with label '$LABEL' not found"
  fi
}

LABEL1="Sicherung_1"
MOUNT_POINT1="/mnt/$LABEL1"

LABEL2="Sicherung_2"
MOUNT_POINT2="/mnt/$LABEL2"

mount_hdd "$LABEL1" "$MOUNT_POINT1"
mount_hdd "$LABEL2" "$MOUNT_POINT2"
