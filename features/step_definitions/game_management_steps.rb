def hits_string_to_array(hits_string)
  hits_string.split(',').map { |hit| hit.to_i }
end

###

Given /^the following games exist:$/ do |table|
  table.hashes.each do |attributes|
    game = Game.new :hits => hits_string_to_array(attributes['hits'])
    game.save
  end
end

Then /^I should see the following:$/ do |table|
  table.hashes.each do |attributes|
    response.should contain( hits_string_to_array(attributes['hits']).join(', ') )
  end
end