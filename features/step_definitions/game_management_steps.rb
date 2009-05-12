Given /^the following games exist:$/ do |table|
  table.hashes.each do |attributes|
    game = Game.new :joined_rolls => attributes['rolls'].gsub(/\s+/, '')
    game.save 
    puts game.inspect
  end
end

Then /^I should see the following:$/ do |table|
  table.hashes.each do |attributes|
    response.should contain(attributes['rolls'].gsub(/\s+/, ''))
  end
end