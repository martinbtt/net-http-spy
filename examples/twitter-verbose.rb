# Net::HTTP has it's own logging/debug functionality. Turn on :verbose to show the full raw HTTP communication
require 'rubygems'
require 'twitter'
require File.expand_path(File.join(File.dirname(__FILE__),'..','lib','spy'))

Net::HTTP.http_logger_options = {:verbose => true}
Twitter::Search.new('httparty').each { |r| r }
