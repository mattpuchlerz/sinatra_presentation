require File.join( File.dirname(__FILE__), *%w[ . spec_helper ] )

describe Game do
  
  context "when initializing" do
    
    before(:each) do
      @game = Game.new
    end
    
    it "should have an empty ID" do
      @game.id.should == nil
    end
    
    it "should have 0 hits" do
      @game.should have(0).hits
    end
    
  end
  
  context "setting attributes" do
    
    it "should be able to set an array of hits" do
      @game = Game.new
      @game.hits = [ 1, 2, 3, 4 ]
      @game.hits.should == [ 1, 2, 3, 4 ]
    end
    
    it "should be able to set an array of hits while initializing" do
      @game = Game.new :hits => [ 1, 2, 3, 4 ]
      @game.hits.should == [ 1, 2, 3, 4 ]
    end
    
    it "should be able to set a comma-separated spaced-out list of hits" do
      @game = Game.new
      @game.hits = '1, 2, 3, 4'
      @game.hits.should == [ 1, 2, 3, 4 ]
    end
    
    it "should be able to set a comma-separated spaced-out list of hits while initializing" do
      @game = Game.new :hits => '1, 2, 3, 4'
      @game.hits.should == [ 1, 2, 3, 4 ]
    end
    
    it "should only keep track of hits as integers regardless of what's passed in" do
      @game = Game.new :hits => '1,ew3, 10f,ksjdf'
      @game.hits.should == [ 1, 0, 10, 0 ]
    end
    
  end
  
  context "getting the score" do

    it "should have a score based on the hits" do
      @game = Game.new :hits => '1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1'
      @game.score.should == 20
    end
    
  end
  
end