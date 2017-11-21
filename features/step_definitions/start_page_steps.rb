When(/^I go to the start page$/) do
  visit root_path
end

Then(/^I see the welcome message$/) do
  expect(page).to have_content("Welcome to Hangman")
end

Then(/^I be asked if I am ready to start$/) do
  expect(page).to have_content("Ready to play?")
end

Then(/^I see a start game button$/) do
  expect(page).to have_link("Start", href: new_game_path)
end
