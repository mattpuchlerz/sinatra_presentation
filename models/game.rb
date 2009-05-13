class Game

  include DataMapper::Resource
  
  property :id,          Serial
  property :joined_hits, String, :length => 100, :accessor => :private
  
  def hits
    @joined_hits.to_s.split(',').map { |hit| hit.to_i }
  end
  
  def hits=(hits)
    attribute_set :joined_hits, hits.join(',').to_s
  end
  
  # def score
  #   game = Bowling::Game.new
  #   joined_rolls.split(",").each { |pins| game.hit(pins.to_i) }
  #   game.score
  # end

end