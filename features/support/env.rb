ENV['RACK_ENV'] = 'test'

# Sinatra app
require File.join( File.dirname(__FILE__), *%w[ .. .. app ] )

# RSpec matchers
require 'spec/expectations'



# 
# Webrat configuration
# 

require 'webrat'
require File.join( File.dirname(__FILE__), *%w[ . paths ] )

module Webrat
  class Session
    # Overriding to make 400+ response codes unsuccessful
    def success_code?
      (200..399).include?(response_code)
    end
  end
end

Webrat.configure do |config|
  config.mode = :sinatra
end



# 
# Cucumber configuration
# 

World do
  session = Webrat::SinatraSession.new
  session.extend(Webrat::Matchers)
  session.extend(Webrat::HaveTagMatcher)
  session
end

Before do
  DataMapper.auto_migrate!
end