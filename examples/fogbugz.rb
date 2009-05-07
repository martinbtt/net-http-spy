# Just showing an example of something other than Twitter.
require 'rubygems'
require 'fogbugz-api' # sudo gem install austinmoody-fogbugz-api
require File.expand_path(File.join(File.dirname(__FILE__),'..','lib','spy'))

config = {:username    => "yourusername",
          :password    => "yourpass", 
          :domain      => "yourdomain.fogbugz.com"
          }

Net::HTTP.http_logger_options = {:body => true, :trace => false}

@fogbugz = FogBugz.new(config[:domain],true) # create instance
@fogbugz.logon(config[:username],config[:password]) # logs into FogBugz and sets *token*
