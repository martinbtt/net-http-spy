# require 'net/https'
# require 'logger'
# require 'cgi'
# 
# # HTTP SPY
# module Net
#   class HTTP
#     alias :old_initialize :initialize
#     alias :old_post :post
#     #     alias :old_get :get
#     alias :old_request :request
# 
#     class << self
#       attr_accessor :http_logger
#       attr_accessor :http_logger_options
#     end
# 
#     def initialize(*args, &block)
#       @logger_options = self.class.http_logger_options ||= {:hide_body => true}
#       
#       
#       self.class.http_logger.info "CONNECT: #{args.inspect}" if !@logger_options[:verbose]
#         
#       old_initialize(*args, &block)
#       @debug_output   = self.class.http_logger if @logger_options[:verbose]
#       
#     end
# 
# 
#     # def get(*args, &block)
#     #          self.class.http_logger.info "GET: #{args}"# if self.class.http_logger_only.include?(:get)
#     #          result = old_get(*args, &block)
#     #          self.class.http_logger.info "BODY: #{result.body}" #if self.class.http_logger_only.include?(:body)
#     #          result
#     #        end
#     #
#     #        def post(*args, &block)
#     #           self.class.http_logger.info "POST: #{args}" #if self.class.http_logger_only.include?(:post)
#     #           result = old_post(*args, &block)
#     #           self.class.http_logger.info "BODY: #{result.body}" #if self.class.http_logger_only.include?(:body)
#     #           result
#     #         end
# 
# 
#     def request(*args, &block)
#       unless started? || @logger_options[:verbose]
#         req = args[0].class::METHOD
#         self.class.http_logger.info "#{req} #{args[0].path}"
#         self.class.http_logger.info "PARAMS #{CGI.parse(args[0].body).inspect} " if args[0].body && req != 'CONNECT'
#         self.class.http_logger.info "TRACE: #{caller.reverse}" if @logger_options[:calltrace]  
#       end
#       
#       result = old_request(*args, &block)
#       
#       unless started? || @logger_options[:verbose]
#         self.class.http_logger.info "BODY: #{  @logger_options[:hide_body] ? result.class.name : result.body}"
#       end
#       result
#     end
# 
# 
#   end
# 
# end
# 
# # Usage
# # Great for testing
# Net::HTTP.http_logger = Logger.new(STDOUT)
