$:<< File.join( File.dirname(__FILE__), 'lib' )

require 'rubygems'
require 'sinatra'
require 'datamapper'



# 
# Set up database and models
# 

DataMapper.setup(
  :default, 
  "sqlite3://#{ File.expand_path(File.dirname(__FILE__)) }/db/#{ Sinatra::Application.environment }.sqlite3"
)

require 'bowling'

Bowling::GameModel.auto_upgrade!



# 
# Routes
# 

get '/' do
  redirect '/games'
end

get '/games' do
  "get: read ALL games"
end

get '/games/new' do
  "get: form for a new game"
end

get '/games/:id' do
  "get: read game '#{params[:id]}'"
end

get '/games/:id/edit' do
  "get: form for editing game '#{params[:id]}'"
end

post '/games' do
  "post: create a new game"
end

put '/games' do
  "put: update a game"
end

delete '/games' do
  "delete: delete a game"
end