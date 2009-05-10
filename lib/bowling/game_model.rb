module Bowling
  class GameModel < Game
  
    include DataMapper::Resource
  
    property :id,           Serial
    property :joined_rolls, String
  
  end
end