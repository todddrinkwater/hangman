When(/^I visit the game page$/) do
  visit new_game_path
end

Then(/^I should be shown the clue$/) do
  expect(page).to have_content("_ _ _ _")
end

# Then(/^I should be asked if I am ready to start$/) do
#   expect(page).to have_content("Ready to play?")
# end

# Then(/^I should see a start game button$/) do
#   expect(page).to have_link("Start Game", href: new_game_path)
# end