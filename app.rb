require 'rubygems'
require 'sinatra'

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