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

DataMapper.auto_upgrade!



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