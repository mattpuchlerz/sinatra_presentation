class Game

  include DataMapper::Resource
  
  property :id,          Serial
  property :joined_hits, String, :length => 100, :accessor => :private
  
  def hits
    @joined_hits.to_s.split(',').map { |hit| hit.to_i }
  end
  
  def hits=(hits)    
    hits = hits.split(',') if hits.is_a? String
    attribute_set :joined_hits, hits.join(',').to_s
  end
  
  def score
    game = Bowling::Game.new
    hits.each { |hit| game.hit(hit) }
    game.score
  end

end