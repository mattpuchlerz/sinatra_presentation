$LOAD_PATH << File.join( File.dirname(__FILE__), 'lib' )

require 'rubygems'
require 'datamapper'
require 'sinatra'
require 'sinatra/rest'
require 'overrides'
require 'bowling'

def load_or_require(file)
  (Sinatra::Application.environment == :development) ? load(file) : require(file)
end



# 
# Set up database and models
# 

DataMapper.setup(
  :default, 
  "sqlite3://#{ File.expand_path(File.dirname(__FILE__)) }/db/#{ Sinatra::Application.environment }.sqlite3"
)

Dir.glob("lib/models/**/*.rb").sort.each { |file| load_or_require file }

DataMapper.auto_upgrade!



# 
# Routes
# 

rest Game, :renderer => :erb

get '/' do
  redirect url_for_games_index
end

