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
  redirect '/bowling_games'
end

get '/bowling_games' do
  "get: read ALL games"
end

get '/bowling_games/new' do
  "get: form for a new game"
end

get '/bowling_games/:id' do
  "get: read game '#{params[:id]}'"
end

get '/bowling_games/:id/edit' do
  "get: form for editing game '#{params[:id]}'"
end

post '/bowling_games' do
  "post: create a new game"
end

put '/bowling_games' do
  "put: update a game"
end

delete '/bowling_games' do
  "delete: delete a game"
end