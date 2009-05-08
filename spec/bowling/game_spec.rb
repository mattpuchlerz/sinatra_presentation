require File.join(File.dirname(__FILE__), "../spec_helper")

module Bowling
  describe Game do
    before(:each) do
      @game = Game.new
    end
    
    context "when first created" do
      it "should have 0 rolls" do
        @game.should have(0).rolls
      end
      
      it "should have a score of 0" do
        @game.score.should == 0
      end
    end
    
    context "when hitting pins" do
      it "should add the pins to the rolls" do
        @game.hit(1)
        @game.should have(1).rolls
      end
    end
    
    context "scoring a game" do
      it "should score 0 when all 20 rolls are 1s" do
        20.times { @game.hit(1) }
        @game.score.should == 20
      end
      
      it "should score 12 for a game of 5, 5, 1 and all 0s" do
        @game.hit(5)
        @game.hit(5)
        @game.hit(1)
        17.times { @game.hit(0) }
        @game.score.should == 12
      end
      
      it "should score 14 for a game of 10, 1, 1 and all 0s" do
        @game.hit(10)
        @game.hit(1)
        @game.hit(1)
        16.times { @game.hit(0) }
        @game.score.should == 14
      end
    end
  end
end