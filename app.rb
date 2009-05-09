require 'rubygems'
require 'sinatra'

# CREATE

get '/bowling_games/new' do
  "get: form for a new game"
end

post '/bowling_games' do
  "post: create a new game"
end

# READ

get '/bowling_games' do
  "get: read ALL games"
end

get '/bowling_games/:id' do
  "get: read game '#{params[:id]}'"
end

# UPDATE

get '/bowling_games/:id/edit' do
  "get: form for editing game '#{params[:id]}'"
end

put '/bowling_games' do
  "put: update a game"
end

# DELETE

delete '/bowling_games' do
  "delete: delete a game"
end