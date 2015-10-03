# -*- mode: ruby -*-
# vi: set ft=ruby :

# README
# - builds a ubuntu 14.04 LTS box with samba installed and configured
# - can be used to develop on the host (laptop) and build+deploy on the guest (vagrant)
# - Port Offset = 0
#   unfortunately the CIFS/SMB Clients (i.e. "net use") don't support port configurations, 
#   only the standard ports can be used
#   (!) This might cause problems, e.g. collisions and broken shares. Handle with care
# USAGE
# - vagrant up
# - OS/X (tested & verified)
#   mkdir /Volumes/vagrant
#   mount_smbfs //vagrant:vagrant@192.168.99.99/vagrant /Volumes/vagrant
# - Windows (not tested)
#   net use z: \\192.168.99.99\vagrant /user:vagrant vagrant
# - Linux (not tested)
#   sudo mount -t smbfs -o username=vagrant,password=vagrant //192.168.99.99/vagrant /mnt/vagrant

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"
 
  # Create private network
  config.vm.network :private_network, ip: '192.168.99.99' # connect with samba client to this (vagrant) samba server IP

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  
  config.vm.synced_folder '.', '/home/vagrant/vagrant-perftest'
  config.vm.synced_folder 'grunt-project', '/home/vagrant/grunt-project-vboxfs'
  config.vm.synced_folder 'grunt-project', '/home/vagrant/grunt-project-nfs',       type: 'nfs',  nfs_udp: false, nfs_version: 3
  config.vm.synced_folder 'grunt-project', '/home/vagrant/grunt-project-nfs-tuned', type: 'nfs',  mount_options: ['rw', 'vers=3', 'tcp', 'fsc' ,'actimeo=1']
  
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider "virtualbox" do |vb|
    # don't use a GUI
    vb.gui = false
    # 2 GB RAM, 2 CPUs, capped at 75%
    vb.memory = 2048
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "75"]
    # enable APIC
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  # Provisioning scripts
  config.vm.provision :shell, :path => 'vagrant-provisioning/commons.apt-get.update+upgrade.sh'
  config.vm.provision :shell, :path => 'vagrant-provisioning/commons.config.set-timezone.sh'
  config.vm.provision :shell, :path => 'vagrant-provisioning/service.samba.install.sh'
  config.vm.provision :shell, :path => 'vagrant-provisioning/service.nodejs-and-grunt.install.sh'
end
