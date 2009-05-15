require 'rubygems'
require 'sinatra'
require 'datamapper'

# Dave Giunta's Bowling::Game library
$LOAD_PATH << File.join( ROOT, *%w[ vendor bowling lib ] )
require 'bowling'



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

use_in_file_templates!

get     '/' do
  redirect '/games'
end

get     '/games' do
  @games = Game.all
  erb :index
end

get     '/games/new' do
  @game = Game.new
  erb :new
end

post    '/games' do
  @game = Game.new params
  
  if @game.save 
    redirect "/games/#{ @game.id }"
  else
    erb :new
  end
end

get     '/games/:id' do
  @game = Game.get params[:id]
  erb :show
end

get     '/games/:id/edit' do
  @game = Game.get params[:id]
  erb :edit
end

put     '/games/:id' do
  @game = Game.get params[:id]
  params.delete('_method')
  
  if @game.update_attributes(params) 
    redirect "/games/#{ @game.id }"
  else
    erb :edit
  end
end

delete  '/games/:id' do
  @game = Game.get params[:id]
  @game.destroy
  
  redirect "/games"
end

__END__



@@layout

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

  <head>
  	<title>Bowling!</title>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>	
  </head>

  <body>

    <%= yield %>

  </body>

</html>



@@index

<h1>Games</h1>

<ul>
  <li><a href="/games/new">New Game</a></li>
</ul>

<table border="1">
  
  <thead>
    <tr>
      <th>ID</th>
      <th>Hits</th>
      <th>Score</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  
  <tbody>
    
    <% @games.each do |game| %>
    <tr>
      <td><%= game.id %></td>
      <td><%= game.hits.join(',') %></td>
      <td><%= game.score %></td>
      <td><a href="/games/<%= game.id %>">Show</a></td>
      <td><a href="/games/<%= game.id %>/edit">Edit</a></td>
      <td>
        <form action="/games/<%= game.id %>" method="post">
          <div>
            <input type="hidden" name="_method" value="delete" />
            <input type="submit" value="Delete" />
          </div>
        </form>
      </td>
    </tr>
    <% end %>

  </tbody>
  
</table>



@@new

<h1>New Game</h1>

<ul>
  <li><a href="/games">Back to Games</a></li>
</ul>

<form action="/games" method="post">
  
  <dl>
    <dt><label for="hits">Hits</label></dt>
    <dd><input id="hits" type="text" name="hits" value="<%= @game.hits %>" size="35" /></dd>
  </dl>

  <p>
    <input type="submit" value="Save" />
  </p>
  
</form>



@@show

<h1>Game</h1>

<ul>
  <li><a href="/games">Back to Games</a></li>
  <li><a href="/games/<%= @game.id %>/edit">Edit Game</a></li>
</ul>

<dl>
  <dt>Hits</dt>
  <dd><%= @game.hits.join(',') %></dd>
</dl>

<dl>
  <dt>Score</dt>
  <dd><%= @game.score %></dd>
</dl>



@@edit

<h1>Edit Game</h1>

<ul>
  <li><a href="/games">Back to Games</a></li>
  <li><a href="/games/<%= @game.id %>">Show Game</a></li>
</ul>

<form action="/games/<%= @game.id %>" method="post">
  
  <dl>
    <dt><label for="hits">Hits</label></dt>
    <dd><input id="hits" type="text" name="hits" value="<%= @game.hits.join(',') %>" size="35" /></dd>
  </dl>

  <p>
    <input type="hidden" name="_method" value="put" />
    <input type="submit" value="Save" />
  </p>
  
</form>
