Given /^I have rolled ([\d, ]+)$/ do |rolls|
  @game = Bowling::Game.new
  rolls.split(",").each do |pins|
    @game.hit(pins.to_i)
  end
end

When /^the game is over$/ do
end

Then /^the score should be (\d+)$/ do |score|
  @game.score.should == score.to_i
end