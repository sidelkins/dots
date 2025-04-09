#!/bin/bash

# Script to remove old kernel images and headers on Debian-based systems
# Keep the currently running kernel and the latest installed kernel

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root" >&2
  exit 1
fi

# Get the currently running kernel version
CURRENT_KERNEL=$(uname -r)

# Get the latest installed kernel version (excluding the currently running one)
LATEST_KERNEL=$(dpkg --list | grep 'linux-image' | awk '{print $2}' | grep -v "$CURRENT_KERNEL" | sort -V | tail -n 1)

# List all installed kernel images (excluding the currently running and the latest one)
OLD_KERNELS=$(dpkg --list | grep 'linux-image' | awk '{print $2}' | grep -v -e "$CURRENT_KERNEL" -e "$LATEST_KERNEL")

# Check if there are any old kernels to remove
if [ -z "$OLD_KERNELS" ]; then
  echo "No old kernel images to remove."
  exit 0
fi

# Remove old kernel images and headers
echo "The following old kernel images will be removed:"
echo "$OLD_KERNELS"
echo ""

read -p "Do you want to continue? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  for KERNEL in $OLD_KERNELS; do
    apt-get purge -y "$KERNEL"
  done

  # Also remove any leftover kernel headers
  apt-get purge -y $(dpkg --list | grep 'linux-headers' | awk '{print $2}' | grep -v -e "$CURRENT_KERNEL" -e "$LATEST_KERNEL")

  # Clean up any leftover packages
  apt-get autoremove -y
  apt-get autoclean -y

  echo "Old kernel images and headers have been removed."
else
  echo "Operation cancelled."
fi
