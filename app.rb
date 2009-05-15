ROOT = File.expand_path File.dirname(__FILE__) unless defined?(ROOT)

require 'rubygems'
require 'sinatra'
require 'datamapper'

Dir.glob("vendor/*/lib/").each { |path| $LOAD_PATH << File.join(ROOT, path) }
Dir.glob("vendor/*/lib/*.rb").each { |file| require file }



# 
# Configuration
# 

set :root, ROOT



# 
# Models
# 

class Game

  include DataMapper::Resource
  
  property :id, Serial
  property :hits, Object
  
  def hits
    attribute_get(:hits).to_a
  end
  
  def hits=(hits)    
    hits = hits.split(',') if hits.is_a? String
    hits.map! { |hit| hit.to_i }
    attribute_set :hits, hits
  end
  
  def score
    game = Bowling::Game.new
    hits.each { |hit| game.hit(hit) }
    game.score
  end

end



# 
# Set up database
# 

DataMapper.setup :default, "sqlite3://#{ ROOT }/db/#{ Sinatra::Application.environment }.sqlite3"
DataMapper.auto_upgrade!



# 
# Routes
# 

get '/' do
  redirect '/games'
end

get '/games' do
  @games = Game.all
  erb :'games/index'
end

get '/games/new' do
  @game = Game.new
  erb :'games/new'
end

post '/games' do
  @game = Game.new params
  
  if @game.save 
    redirect "/games/#{ @game.id }"
  else
    erb :'games/new'
  end
end

get '/games/:id' do
  @game = Game.get params[:id]
  erb :'games/show'
end

get '/games/:id/edit' do
  @game = Game.get params[:id]
  erb :'games/edit'
end

put '/games/:id' do
  @game = Game.get params[:id]
  params.delete('_method')
  
  if @game.update_attributes(params) 
    redirect "/games/#{ @game.id }"
  else
    erb :'games/edit'
  end
end

delete '/games/:id' do
  @game = Game.get params[:id]
  @game.destroy
  
  redirect "/games"
end