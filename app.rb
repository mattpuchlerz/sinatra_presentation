$:<< File.join( File.dirname(__FILE__), 'lib' )

require 'rubygems'
require 'datamapper'
require 'sinatra'
require 'sinatra/rest'
require 'bowling'



# 
# Set up database and models
# 

DataMapper.setup(
  :default, 
  "sqlite3://#{ File.expand_path(File.dirname(__FILE__)) }/db/#{ Sinatra::Application.environment }_rest.sqlite3"
)

load 'game.rb'

DataMapper.auto_upgrade!



# 
# Routes
# 

get '/' do
  redirect '/games'
end

rest Game, :renderer => :erb