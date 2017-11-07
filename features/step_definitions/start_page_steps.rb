When(/^I go to the start page$/) do
  visit root_path
end

Then(/^I should see the welcome message$/) do
  expect(page).to have_content("Welcome to Hangman")
end

Then(/^I should be asked if I am ready to start$/) do
  expect(page).to have_content("Welcome to Hangman")
end