#!/usr/bin/env bash

# Check if I am root or sudoed.
if [ "$EUID" -ne 0 ]; then
  echo "sudo required." 1>&2
  exit
fi

# Install theme
sudo cp -r ./ubuntu-budgie-logo-4k/ /usr/share/plymouth/themes/
update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/ubuntu-budgie-logo-4k/ubuntu-budgie-logo-4k.plymouth 150
update-alternatives --config default.plymouth
update-initramfs -u
