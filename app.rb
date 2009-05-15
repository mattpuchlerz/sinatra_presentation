# Note the application's root for convenience
ROOT = File.expand_path File.dirname(__FILE__) unless defined?(ROOT)

require 'rubygems'
require 'sinatra'
require 'datamapper'

# Dave Giunta's Bowling::Game library
$LOAD_PATH << File.join( ROOT, *%w[ vendor bowling lib ] )
require 'bowling'



# 
# Routes
# 

get '/' do
  'Hello World!'
end