ROOT = File.expand_path File.dirname(__FILE__) unless defined?(ROOT)
$LOAD_PATH << File.join(ROOT, 'lib')

require 'rubygems'
require 'sinatra'
require 'sinatra/rest'
require 'datamapper'

Dir.glob("lib/**/*.rb").sort.each { |file| require file }

def load_or_require(file)
  (Sinatra::Application.environment == :development) ? load(file) : require(file)
end



# 
# Set up database and models
# 

DataMapper.setup(
  :default, 
  "sqlite3://#{ ROOT }/db/#{ Sinatra::Application.environment }.sqlite3"
)

Dir.glob("models/**/*.rb").sort.each { |file| load_or_require file }

DataMapper.auto_upgrade!



# 
# Routes
# 

rest Game, :renderer => :erb

get '/' do
  redirect url_for_games_index
end

