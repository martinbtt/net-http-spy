require 'spec_helper'

# Bare bones spec to make sure the core functionality is working
describe "Net:HTTP Spying on" do
  before(:all) do
    Net::HTTP.http_logger = DummyLogger.new()
  end

  describe "a get request with default options" do

    before(:all) do
      # stub_request(:any, "https://search.twitter.com/search.json?q=httparty").to_return(:body =>   "\{\"results\"\: 1\}", :status => 200) unless LIVE
      stub_request(:any, "https://search.twitter.com/search.json?q=httparty").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Twitter Ruby Gem 2.5.0'}).
        to_return(:status => 200, :body => "\{\"completed_in\": 0.297,\"max_id\": 219272571949023230,\"max_id_str\": \"219272571949023232\",\"page\": 1,\"query\": \"httparty\",\"refresh_url\": \"?since_id=219272571949023232&q=httparty&result_type=mixed\",\"results\":  \[\{\"created_at\": \"Sun, 01 Jul 2012 03:33:49 +0000\",\"from_user\": \"rubygems\",\"from_user_id\": 14881835,\"from_user_id_str\": \"14881835\",\"from_user_name\": \"RubyGems\",\"geo\": null,\"id\": 219272571949023230,\"id_str\": \"219272571949023232\",\"iso_language_code\": \"en\",\"metadata\":  \{\"result_type\": \"recent\"\}\}\],\"results_per_page\": 15,\"since_id\": 0,\"since_id_str\": \"0\"\}", :headers => {}) unless LIVE
      Net::HTTP.http_logger_options = :default
      Twitter.search("httparty")
    end

    it "should give the connection" do
      Net::HTTP.http_logger.lines.should include("CONNECT: [\"search.twitter.com\", 443]")
    end

    it "should give GET uri and query string" do
      Net::HTTP.http_logger.lines.should include("GET /search.json?q=httparty")
    end

    it "should give the BODY response code" do
      Net::HTTP.http_logger.lines.should include("BODY: Net::HTTPOK")
    end

    it "should give the TIME the request took" do
      Net::HTTP.http_logger.lines.should be_any { |m| m =~ /TIME: \d+ms/ }
    end
  end


  describe "a get request with body option set to true" do
    before(:each) do
      stub_request(:any, "https://search.twitter.com/search.json?q=httparty").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Twitter Ruby Gem 2.5.0'}).
        to_return(:status => 200, :body => "\{\"completed_in\": 0.297,\"max_id\": 219272571949023230,\"max_id_str\": \"219272571949023232\",\"page\": 1,\"query\": \"httparty\",\"refresh_url\": \"?since_id=219272571949023232&q=httparty&result_type=mixed\",\"results\":  \[\{\"created_at\": \"Sun, 01 Jul 2012 03:33:49 +0000\",\"from_user\": \"rubygems\",\"from_user_id\": 14881835,\"from_user_id_str\": \"14881835\",\"from_user_name\": \"RubyGems\",\"geo\": null,\"id\": 219272571949023230,\"id_str\": \"219272571949023232\",\"iso_language_code\": \"en\",\"metadata\":  \{\"result_type\": \"recent\"\}\}\],\"results_per_page\": 15,\"since_id\": 0,\"since_id_str\": \"0\"\}", :headers => {}) unless LIVE
      Net::HTTP.http_logger_options = {:body => true}
    end

    it "should give the body output" do
      Twitter.search('httparty')
      Net::HTTP.http_logger.lines.grep(/BODY: \{\"completed_in\":/).should_not be_empty
    end
  end


  describe "a get request with trace option set to true" do
    before(:each) do
      Net::HTTP.http_logger_options = {:trace => true}
      stub_request(:any, "https://search.twitter.com/search.json?q=httparty").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Twitter Ruby Gem 2.5.0'}).
        to_return(:status => 200, :body => "\{\"completed_in\": 0.297,\"max_id\": 219272571949023230,\"max_id_str\": \"219272571949023232\",\"page\": 1,\"query\": \"httparty\",\"refresh_url\": \"?since_id=219272571949023232&q=httparty&result_type=mixed\",\"results\":  \[\{\"created_at\": \"Sun, 01 Jul 2012 03:33:49 +0000\",\"from_user\": \"rubygems\",\"from_user_id\": 14881835,\"from_user_id_str\": \"14881835\",\"from_user_name\": \"RubyGems\",\"geo\": null,\"id\": 219272571949023230,\"id_str\": \"219272571949023232\",\"iso_language_code\": \"en\",\"metadata\":  \{\"result_type\": \"recent\"\}\}\],\"results_per_page\": 15,\"since_id\": 0,\"since_id_str\": \"0\"\}", :headers => {}) unless LIVE
    end

    it "should give the trace output" do
      Twitter.search('httparty')
      Net::HTTP.http_logger.lines.grep(/TRACE: /).should_not be_empty
    end
  end

  describe "a post request with default options" do
    before(:all) do
      Net::HTTP.http_logger_options = {:verbose => false}
      stub_request(:any, "http://search.twitter.com/search").
        with(:body => "?q=hello",:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "\{\"completed_in\": 0.297,\"max_id\": 219272571949023230,\"max_id_str\": \"219272571949023232\",\"page\": 1,\"query\": \"httparty\",\"refresh_url\": \"?since_id=219272571949023232&q=httparty&result_type=mixed\",\"results\":  \[\{\"created_at\": \"Sun, 01 Jul 2012 03:33:49 +0000\",\"from_user\": \"rubygems\",\"from_user_id\": 14881835,\"from_user_id_str\": \"14881835\",\"from_user_name\": \"RubyGems\",\"geo\": null,\"id\": 219272571949023230,\"id_str\": \"219272571949023232\",\"iso_language_code\": \"en\",\"metadata\":  \{\"result_type\": \"recent\"\}\}\],\"results_per_page\": 15,\"since_id\": 0,\"since_id_str\": \"0\"\}", :headers => {}) unless LIVE
      @connection = Net::HTTP.new('search.twitter.com')
      @connection.post('/search','?q=hello')
    end

    it "should give the post url" do
      Net::HTTP.http_logger.lines.should include("POST /search")
    end


    if LIVE # only works if real live request
      it "should give the post params" do
        Net::HTTP.http_logger.lines.should include("PARAMS {\"?q\"=>[\"hello\"]} ")
      end
    end

    it "should give the BODY response code" do
      Net::HTTP.http_logger.lines.should include("BODY: Net::HTTPOK")
    end
  end

  after(:all) do
    Net::HTTP.http_logger.reset!
  end
end
