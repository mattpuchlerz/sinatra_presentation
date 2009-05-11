$:<< File.join( File.dirname(__FILE__), 'lib' )

require 'rubygems'
require 'datamapper'
require 'sinatra'
require 'sinatra/rest'
require 'bowling'



# 
# Set up database and models
# 

DataMapper.setup(
  :default, 
  "sqlite3://#{ File.expand_path(File.dirname(__FILE__)) }/db/#{ Sinatra::Application.environment }.sqlite3"
)

def load_or_require(file)
  (Sinatra::Application.environment == :development) ? load(file) : require(file)
end

Dir.glob("lib/models/**/*.rb").sort.each { |file| load_or_require file }

DataMapper.auto_upgrade!



# 
# Routes
# 

get '/' do
  redirect '/games'
end

rest Game, :renderer => :erb