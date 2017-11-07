When(/^I visit the game page$/) do
  visit game_index_path
end

Then(/^I should be shown the clue$/) do
  expect(page).to have_content("_ _ _ _ _ _ _ _ _")
end

Then(/^I should see the number of lives I have left$/) do
  expect(page).to have_content("Lives remaining: 7")
end