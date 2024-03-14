#!/usr/bin/env bash

# Copyright 2024. Puppet, Inc., a Perforce company. 

# Make sure we're running as root
if [ $(id -u) -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Show the Puppet Agent version
echo "Puppet Agent: $(puppet agent --version)"

# Install Puppet modules
puppet module install puppetlabs-apache

# Copy this directory to the Puppet module path
mkdir -p /etc/puppetlabs/code/environments/production/modules/teched_hello_world/
cp -r ./* /etc/puppetlabs/code/environments/production/modules/teched_hello_world/

# Kick off the website
puppet apply --modulepath=/etc/puppetlabs/code/environments/production/modules -e 'include teched_hello_world::website'