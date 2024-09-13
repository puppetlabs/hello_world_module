#!/usr/bin/env bash

# Copyright 2024. Puppet, Inc., a Perforce company. 

# You need to have bundler installed for this to work
if [gem list -i bundler]; then
  echo "Bundler is not installed. Please install it using 'gem install bundler'"
  exit
fi

# Ensure we install all the development gems
bundle config set development true

# Install all required gems
bundle install

# Install all the required fixtures from .fixtures.yml
bundle exec rake spec_prep