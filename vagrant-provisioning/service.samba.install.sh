#!/usr/bin/env bash

set -x
echo service.samba.install.sh

apt-get install -y -qq samba

# copy smb.conf.template to smb.conf
mv /etc/samba/smb.conf /etc/samba/smb.conf.bak
cp /home/vagrant/vagrant-perftest/vagrant-provisioning/service.samba.smb.conf.template /etc/samba/smb.conf
testparm
service samba restart
service samba reload
bash -c 'echo -ne "vagrant\nvagrant\n" | smbpasswd -a -s vagrant'
