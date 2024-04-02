# frozen_string_literal: true

# Copyright 2024. Puppet, Inc., a Perforce company.

require 'spec_helper'
require 'net/http'

describe 'localhost' do
  let(:uri) { URI::HTTP.build(host: `hostname -f`.chomp) }

  it 'has a docroot directory' do
    expect(File.directory?('/var/www')).to be_truthy
  end

  it 'has an index.html file' do
    expect(File.file?('/var/www/html/index.html')).to be_truthy
  end

  it 'has a CSS directory' do
    expect(File.directory?('/var/www/html/css')).to be_truthy
  end

  it 'has an images directory' do
    expect(File.directory?('/var/www/html/img')).to be_truthy
  end

  it 'has a Javascript directory' do
    expect(File.directory?('/var/www/html/js')).to be_truthy
  end

  it 'is reachable on port 80' do
    expect(Net::HTTP.get_response(uri)).to be_a(Net::HTTPSuccess)
  end
end