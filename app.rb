ROOT = File.expand_path File.dirname(__FILE__) unless defined?(ROOT)

require 'rubygems'
require 'sinatra'
require 'sinatra/rest'
require 'datamapper'

Dir.glob("vendor/*/lib/").each { |path| $LOAD_PATH << File.join(ROOT, path) }
Dir.glob("vendor/*/lib/*.rb").each { |file| require file }



# 
# Set up database and models
# 

DataMapper.setup :default, "sqlite3://#{ ROOT }/db/#{ Sinatra::Application.environment }.sqlite3"

Dir.glob("models/*.rb").each { |file| load file }

DataMapper.auto_upgrade!



# 
# Routes
# 

rest Game, :renderer => :erb

get '/' do
  redirect url_for_games_index
end

