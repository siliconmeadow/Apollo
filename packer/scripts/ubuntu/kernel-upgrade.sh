#!/usr/bin/env bash
set -eux
set -o pipefail

unset UCF_FORCE_CONFFOLD
export UCF_FORCE_CONFFNEW=YES
sudo ucf --purge /boot/grub/menu.lst

sudo apt-get -y update
sudo apt-get clean all
sudo DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confnew" install -fy linux-generic-lts-vivid linux-image-generic-lts-vivid linux-image-extra-3.19.0-22-generic

sudo update-grub2

sudo DEBIAN_FRONTEND=noninteractive dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge

sudo reboot
sleep 60
