# Copyright 2024. Puppet, Inc., a Perforce company. 
#
# @summary A short summary of the purpose of this class
#
# Moves the following files into docroot:
# 
# files/
#   index.html
#   css/
#     main.css
#     normalize.css
#   img/
#     favicon.ico
#
# @example
#   include teched_hello_world::website
class teched_hello_world::website {
  include apache

  file { '/var/www/':
    ensure => directory,
    before => [File['index.html'], File['css-directory'], File['img-directory'], File['js-directory']],
  }

  file { 'index.html':
    ensure => file,
    path   => '/var/www/html/index.html',
    source => 'puppet:///modules/teched_hello_world/index.html',
  }

  file { 'css-directory':
    ensure  => directory,
    path    => '/var/www/html/css/',
    source  => 'puppet:///modules/teched_hello_world/css',
    recurse => true,
  }

  file { 'img-directory':
    ensure  => directory,
    path    => '/var/www/html/img/',
    source  => 'puppet:///modules/teched_hello_world/img',
    recurse => true,
  }

  file { 'js-directory':
    ensure  => directory,
    path    => '/var/www/html/js/',
    source  => 'puppet:///modules/teched_hello_world/js',
    recurse => true,
  }

  apache::vhost { 'hello_world':
    port    => 80,
    docroot => '/var/www/html',
  }
}
