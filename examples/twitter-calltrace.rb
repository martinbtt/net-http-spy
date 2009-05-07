# See where the external API calls take place within the gem you are using with the :trace option 
require 'rubygems'
require 'twitter'
require File.expand_path(File.join(File.dirname(__FILE__),'..','lib','spy'))

Net::HTTP.http_logger_options = {:trace => true}
Twitter::Search.new('httparty').each { |r| r }
