require 'rubygems'
gem 'rspec'
require 'spec'
require 'net/http'
require 'open-uri'
require 'twitter'
require 'mechanize'

require File.join(File.dirname(__FILE__), '..', 'lib', 'spy')


class DummyLogger 
  
  attr_accessor :lines
  
  def initialize
    reset!
  end
  
  def <<(msg)
    @lines << msg
  end
  
  def info(msg)
     @lines << msg
  end

  def reset!
    @lines = []
  end
  
end
