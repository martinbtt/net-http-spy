## About

Ever wondered what HTTP requests the Ruby gem you are using to connect to a third party
API is making? Use HTTP Spy to see what is going on behind the scenes.

## Installation

sudo gem install martinbtt-net-http-spy

## Example Usage

    require 'rubygems'
    require 'twitter'
    gem 'net-http-spy'
    require 'net-http-spy'
    
    Twitter::Search.new('httparty').each { |r| r }
    # Outputs...
    -- : CONNECT: ["search.twitter.com", 80]
    -- : GET /search.json?q=httparty
    -- : BODY: Net::HTTPOK


See the examples folder for more. 

## Further Options

Show the call trace to the originating line of code in the third party gem
    
    Net::HTTP.http_logger_options = {:trace => true}

Output the body of the request 

    Net::HTTP.http_logger_options = {:body => true}

Show the full raw HTTP output
   
    Net::HTTP.http_logger_options = {:verbose => true}

Change the logger. By default HTTP spy logs to STDOUT 

    Net::HTTP.http_logger = Logger.new('twitter.log')

## Bonus Points

Use it to grab sample data for FakeWeb = testing goodness.

## Notes

This is a pretty early release. I'm sure there is plenty that can be done to improve compatibility
as several libraries call Net::HTTP in a slightly different way. 
Feel free to fork and send in pull requests/patches.

## Find Me 

Martin Sadler (martin -- at -- beyondthetype.com)

* Blog:      http://www.beyondthetype.com
* Follow:    http://twitter.com/martinbtt
* Code:      http://github.com/martinbtt
* Recommend: http://www.workingwithrails.com/person/5152-martin-sadler