#!/usr/bin/env ruby -w
# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'minitest/unit'
require 'minitest/autorun'

class BlackboxTest < MiniTest::Unit::TestCase
  def test_port_445_can_be_connected_to
    # as telnet needs to be terminated and nmap shows "filtered" I rely on curl
    assert_match(/Operation timed out/, `curl --max-time 3 http://192.168.99.99:445 2>&1`)
  end
  def test_share_can_be_mounted
    `mkdir -p /Volumes/vagrant`
    `mount_smbfs //vagrant:vagrant@192.168.99.99/vagrant /Volumes/vagrant`
    `echo yeah > /Volumes/vagrant/test.txt`
    assert_match(/yeah/, `cat /Volumes/vagrant/test.txt`)
    `rm /Volumes/vagrant/test.txt`
    `umount /Volumes/vagrant`
  end
end
