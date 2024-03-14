#!/usr/bin/env bash

# Copyright 2024. Puppet, Inc., a Perforce company. 

# Ensure we install all the development gems
bundle config set development true

# Install all required gems
bundle install

# Install all the required fixtures from .fixtures.yml
bundle exec rake spec_prep