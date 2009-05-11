module Bowling
  class Game
    attr_reader :rolls
    
    def initialize
      @rolls = []
    end
    
    def hit(pins)
      @rolls << pins
    end
    
    def score
      return 0 if rolls.empty?
      
      frame = 0
      (1..10).inject(0) do |score, i|
        score += rolls[frame] + rolls[frame + 1]
        score += rolls[frame + 2] if marked_frame?(frame)
        frame += strike_on_frame?(frame) ? 1 : 2
        score
      end
    end
    
    private
    
    def marked_frame?(frame)
      strike_on_frame?(frame) || spare_on_frame?(frame)
    end
    
    def spare_on_frame?(frame)
      rolls[frame] + rolls[frame + 1] == 10
    end
    
    def strike_on_frame?(frame)
      rolls[frame] == 10
    end
  end
end