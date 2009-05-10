$:<< File.join( File.dirname(__FILE__), 'lib' )

require 'rubygems'
require 'sinatra'
require 'datamapper'
require 'bowling'



# 
# Set up database and models
# 

DataMapper.setup(
  :default, 
  "sqlite3://#{ File.expand_path(File.dirname(__FILE__)) }/db/#{ Sinatra::Application.environment }.sqlite3"
)

load 'bowling/game_model.rb'

Bowling::GameModel.auto_upgrade!



# 
# Routes
# 

get '/' do
  redirect '/games'
end

get '/games' do
  @games = Bowling::GameModel.all( :order => [:id.desc] )
  erb :games_index
end

get '/games/new' do
  @game = Bowling::GameModel.new
  erb :games_new
end

get '/games/:id' do
  @game = Bowling::GameModel.get(params[:id])
  erb :games_show
end

get '/games/:id/edit' do
  @game = Bowling::GameModel.get(params[:id])
  erb :games_edit
end

post '/games' do
  @game = Bowling::GameModel.new(params)
  
  if @game.save
    redirect '/games'
  else
    erb :games_new
  end
end

put '/games' do
  @game = Bowling::GameModel.get(params[:id])
  params.delete '_method'
  
  if @game.update_attributes(params)
    redirect '/games'
  else
    erb :games_edit
  end
end

delete '/games' do
  @game = Bowling::GameModel.get(params[:id])
  
  if @game.destroy
    redirect '/games'
  else
    erb :games_index
  end
end