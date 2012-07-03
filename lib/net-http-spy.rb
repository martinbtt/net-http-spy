require 'net/https'
require 'logger'
require 'cgi'

# HTTP SPY
module Net
  class HTTP
    alias :old_initialize :initialize
    alias :old_request :request

    class << self
      attr_accessor :http_logger
      attr_accessor :http_logger_options
    end

    def initialize(*args, &block)
      self.class.http_logger_options ||= {}
      defaults =  {:body => false, :trace => false, :verbose => false, :limit => -1}
      self.class.http_logger_options = (self.class.http_logger_options == :default) ? defaults : self.class.http_logger_options
      @logger_options = defaults.merge(self.class.http_logger_options)
      @params_limit = @logger_options[:params_limit] || @logger_options[:limit]
      @body_limit   = @logger_options[:body_limit]   || @logger_options[:limit]
      
      self.class.http_logger.info "CONNECT: #{args.inspect}" if !@logger_options[:verbose]

      old_initialize(*args, &block)
      @debug_output   = self.class.http_logger if @logger_options[:verbose]
    end


    def request(*args, &block)
      unless started? || @logger_options[:verbose]
        req = args[0].method
        self.class.http_logger.info "#{req} #{args[0].path}"
      end

      result = old_request(*args, &block)
      unless started? || @logger_options[:verbose]

        self.class.http_logger.info "PARAMS #{CGI.parse(args[0].body).inspect[0..@params_limit]} " if args[0].body && req != 'CONNECT'
        self.class.http_logger.info "TRACE: #{caller.reverse}" if @logger_options[:trace]
        self.class.http_logger.info "BODY: #{(@logger_options[:body] ? result.body : result.class.name)[0..@body_limit]}"
      end
      result
    end


  end

end

Net::HTTP.http_logger = Logger.new(STDOUT)
