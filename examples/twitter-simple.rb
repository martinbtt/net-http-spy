# Simplist example. All you need to do is include the spy lib for it to start doing the right thing
require 'rubygems'
require 'twitter'
require File.expand_path(File.join(File.dirname(__FILE__),'..','lib','net-http-spy'))

Twitter::Search.new('httparty').each { |r| r }
