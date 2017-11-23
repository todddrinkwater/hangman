#TODO: Test that a link/button hits this page.
#TODO: Test that UI input can create a new game instead of doing it by manually creating game.

Given(/^the player is on the game page$/) do
  @game = Game.create!(word: "powershop", max_lives: 7)
  visit game_path(@game)
end

Then(/^I am shown the clue$/) do
  expect(page).to have_content("Word: _ _ _ _ _ _ _ _ _")
end

Then(/^I see the number of lives I have left$/) do
  expect(page).to have_content("Lives: 7")
end

Then(/^I see the incorrect guesses display as empty$/) do
  expect(page).to have_content("Incorrect guesses:")
end

When(/^I submit a correct guess$/) do
    fill_in 'guess[value]', with: @game.word.chars.first
    click_on 'Make guess'
end

Then(/^the clue displays the correctly guessed letters$/) do
  expect(page).to have_content("Word: P _ _ _ _ _ _ _ P")
end

Then(/^I see the number of lives remaining is unchanged$/) do
  expect(page).to have_content("Lives: 7")
end

When(/^I submit an incorrect guess$/) do
    fill_in 'guess[value]', with: 'x'
    click_on 'Make guess'
end

Then(/^I see a single life is deducted$/) do
  expect(page).to have_content("Lives: 6")
end

Then(/^I see the guess added to the incorrect guesses list$/) do
  expect(page).to have_content("Incorrect guesses: X")
end

When(/^I submit a duplicate guess$/) do
  fill_in 'guess[value]', with: 'x'
  click_on 'Make guess'
  fill_in 'guess[value]', with: 'x'
  click_on 'Make guess'
end

#TODO: Rename to be more specific to what I am testing here.
Then(/^I see an appropriate error message$/) do
  expect(page).to have_content("Value has already been taken")
end

When(/^I submit the winning guess$/) do
  correct_letters = @game.word.chars.uniq
  correct_letters.each do |guess|
    fill_in 'guess[value]', with: guess
    click_on 'Make guess'
  end
end

Then(/^I see a game won message$/) do
  expect(page).to have_content("YOU WIN! Play again?")
end

Then(/^I should see a link for playing a new game$/) do
  expect(page).to have_link('New Game', href: new_game_path)
end

When(/^I submit the losing guess$/) do
  correct_letters = %w[q t y u i a d]
  correct_letters.each do |guess|
    fill_in 'guess[value]', with: guess
    click_on 'Make guess'
  end
end

Then(/^I see a game lost message$/) do
  expect(page).to have_content("GAME OVER Your word was... POWERSHOP Play again?")
end
