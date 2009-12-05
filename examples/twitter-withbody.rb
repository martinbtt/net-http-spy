# Display the full response/request body. Usually just the response code is shown.
require 'rubygems'
require 'twitter'
require File.expand_path(File.join(File.dirname(__FILE__),'..','lib','net-http-spy'))

Net::HTTP.http_logger_options = {:body => true}
Twitter::Search.new('httparty').each { |r| r }
