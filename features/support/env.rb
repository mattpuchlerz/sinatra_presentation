require 'rubygems'
require 'spec/expectations'
require 'webrat'
require File.join( File.dirname(__FILE__), '.', 'paths' )
require File.join( File.dirname(__FILE__), '..', '..', 'app' )

Webrat.configure do |config|
  config.mode = :sinatra
end

World do
  session = Webrat::SinatraSession.new
  session.extend(Webrat::Matchers)
  session.extend(Webrat::HaveTagMatcher)
  session
end