require 'rubygems'
require 'spec/expectations'
require 'webrat'
require File.join( File.dirname(__FILE__), '.', 'paths' )
require 'sinatra'



# 
# Sinatra configuration
# 

set :environment, :test

require File.join( File.dirname(__FILE__), '..', '..', 'app' )


# 
# Webrat configuration
# 

module Webrat
  class Session
    # I don't think 400+ codes are successful
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