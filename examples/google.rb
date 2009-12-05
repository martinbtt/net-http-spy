# Just showing an example of something other than Twitter. 
# Garb lets you access the Google Analytics API
require 'rubygems'
require 'garb'
require File.expand_path(File.join(File.dirname(__FILE__),'..','lib','net-http-spy'))

Net::HTTP.http_logger_options = {:body => false, :trace => false, :verbose => false}
Garb::Session.login('yourgoogleusername', 'yourpassword')
