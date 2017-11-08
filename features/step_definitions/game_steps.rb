When(/^I visit the game page$/) do
  visit game_index_path
end

#TODO: Use present tense/active voice when writing assertions
Then(/^I should be shown the clue$/) do
  #NOTE: How can I do this better?
  expect(page).to have_content("_ _ _ _ _ _ _ _ _")
end

Then(/^I should see the number of lives I have left$/) do
  expect(page).to have_content("Lives remaining: 7")
end