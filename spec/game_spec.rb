require File.join( File.dirname(__FILE__), *%w[ . spec_helper ] )

describe Game do

  it "should have an #id method" do
    @game = Game.new
    @game.should respond_to(:id)
  end
  
  it "should have a #hits method" do
    @game = Game.new
    @game.should respond_to(:hits)
  end
  
  it "should have 0 hits" do
    @game = Game.new
    @game.should have(0).hits
  end
  
  it "should be able to accept an array of hits while initializing" do
    @game = Game.new :hits => [ 1, 2, 3, 4 ]
    @game.hits.should == [ 1, 2, 3, 4 ]
  end
  
  it "should be able to accept a comma-separated string of hits" do
    @game = Game.new :hits => '1,2,3,4'
    @game.hits.should == [ 1, 2, 3, 4 ]
  end
  
  it "should keep track of hits as integers regardless of what's passed in" do
    @game = Game.new :hits => '1,ew3, 10f,ksjdf'
    @game.hits.should == [ 1, 0, 10, 0 ]
  end

  it "should have a score based on the hits" do
    @game = Game.new :hits => '1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1'
    @game.score.should == 20
  end
  
end