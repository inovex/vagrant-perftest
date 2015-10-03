# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'spec_helper'

describe package('samba') do
  it { should be_installed }
end

describe port(445) do
  it { should be_listening }
end

describe command("testparm -s --section-name=vagrant 2>&1 | grep path") do
  it { should return_stdout /\/home\/vagrant/ }
end
