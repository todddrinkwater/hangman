When(/^I go to the start page$/) do
  visit root_path
end

Then(/^I should see the welcome message$/) do
  expect(page).to have_content("Welcome to Hangman")
end

Then(/^I should be asked if I am ready to start$/) do
  expect(page).to have_content("Ready to play?")
end

Then(/^I should see a start game button$/) do
  expect(page).to have_link("Start Game", href: game_index_path)
end
