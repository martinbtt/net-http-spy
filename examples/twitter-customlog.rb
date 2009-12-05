# By default the logger outputs to STDOUT, it's easy to change this to a file if you like
# Great to capture and then use for testing with tools like FakeWeb when combined with :body => true 
require 'rubygems'
require 'twitter'
require File.expand_path(File.join(File.dirname(__FILE__),'..','lib','net-http-spy'))

Net::HTTP.http_logger = Logger.new('twitter.log')
Twitter::Search.new('httparty').each { |r| r }
