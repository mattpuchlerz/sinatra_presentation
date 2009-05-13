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
# Set up database and models
# 

DataMapper.setup :default, "sqlite3://#{ ROOT }/db/#{ Sinatra::Application.environment }.sqlite3"

Dir.glob("models/*.rb").each { |file| load file }

(Sinatra::Application.environment == :test) ? DataMapper.auto_migrate! : DataMapper.auto_upgrade!



# 
# Routes
# 

get '/' do
  redirect '/games'
end

get '/games' do
  @games = Game.all :order => [:id.desc]
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