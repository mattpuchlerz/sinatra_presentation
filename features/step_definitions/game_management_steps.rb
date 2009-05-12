Given /^the following games exist:$/ do |table|
  # pending
  # Factory(:game)
  game = Game.new :joined_rolls => '2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3'
  game.save
end

Then /^I should see the following:$/ do |table|
  # pending
  response.should contain('2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3')
end