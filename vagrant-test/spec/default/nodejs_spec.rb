# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'spec_helper'

describe command("bash -c 'node -v'") do
  it { should return_stdout "v0.10.25" }
end
describe command("bash -c 'npm -v'") do
  it { should return_stdout "1.3.10" }
end
