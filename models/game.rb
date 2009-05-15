class Game

  include DataMapper::Resource
  
  property :id, Serial
  property :hits, Object
  
  def hits
    @hits.to_a
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