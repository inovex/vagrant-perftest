#!/usr/bin/env bash

set -x
echo commons.apt-get.update+upgrade.sh

echo "set grub-pc/install_devices /dev/sda" | debconf-communicate
apt-get update -y -qq
apt-get upgrade -y -qq
