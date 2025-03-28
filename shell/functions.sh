# ====================
# Functions
# ====================

# find string in local directory
findstr() {
  grep -r "$1" .
}

# make full systemupgrade
sysupgrade() {
  if [ -f /etc/debian_version ]; then
    # Debian-based system
    sudo apt update && sudo apt upgrade && sudo apt dist-upgrade
  elif [ -f /etc/arch-release ]; then
    # Arch-based system
    sudo pacman -Syu
  else
    echo "Unsupported system."
  fi
}

# search for installed package
findpkgi() {
  package_name="$1"

  if [ -f /etc/debian_version ]; then
    # Debian-based system
    dpkg -l | grep -i "$package_name"
    if dpkg -l | grep -i "$package_name"; then
      dpkg-query -L "$package_name" | head -n 1
    else
      echo "Package '$package_name' is not found."
    fi
  elif [ -f /etc/arch-release ]; then
    # Arch-based system
    pacman -Qs "$package_name"
    if pacman -Qs "$package_name" >/dev/null; then
      pacman -Ql "$package_name" | head -n 1
    else
      echo "Package '$package_name' is not found."
    fi
  else
    echo "Unsupported system."
  fi
}

# find package in repository
findpkg() {
  package_name="$1"

  if [ -f /etc/debian_version ]; then
    # Debian-based system
    apt-cache search "$package_name"
  elif [ -f /etc/arch-release ]; then
    # Arch-based system
    pacman -Ss "$package_name" | grep -i "$package_name"
  else
    echo "Unsupported system."
  fi
}
