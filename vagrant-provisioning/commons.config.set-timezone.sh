#!/usr/bin/env bash

set -x 
echo commons.config.set-timezone.sh

echo "Europe/Berlin" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata
