module Bowling
  class GameModel
  
    include DataMapper::Resource
  
    property :id,           Serial
    property :joined_rolls, String
    
    def rolls
      joined_rolls
    end
    
    def score
      game = Bowling::Game.new
      joined_rolls.split(",").each { |pins| game.hit(pins.to_i) }
      game.score
    end
  
  end
end