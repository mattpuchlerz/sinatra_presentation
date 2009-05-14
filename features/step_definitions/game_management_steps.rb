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

Then /^I should see the following games:$/ do |table|
  table.hashes.each do |attributes|
    Then %Q{I should see "#{ hits_string_to_array(attributes['hits']).join(',') }"}
    Then %Q{I should see "#{ attributes['score'] }"}
  end
end