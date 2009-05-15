require 'rubygems'
require 'spec/expectations'
require 'webrat'
require File.join( File.dirname(__FILE__), *%w[ . paths ] )
require 'sinatra'



# 
# Sinatra configuration
# 

set :environment, :test

require File.join( File.dirname(__FILE__), *%w[ .. .. app ] )



# 
# Webrat configuration
# 

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