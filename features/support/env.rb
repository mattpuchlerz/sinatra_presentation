ENV['RACK_ENV'] = 'test'

require File.join( File.dirname(__FILE__), *%w[ .. .. app ] )

require 'spec/expectations'

require 'webrat'
require File.join( File.dirname(__FILE__), *%w[ . paths ] )



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