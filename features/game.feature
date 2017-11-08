Feature: Game
As the games product owner
I want users to be able to see a clue (masked version of word to guess)
So that they know what letters they have guessed and how many letters are in the word
I want users to be able to be able to see how many lives they have left
So that the user knows how many wrong guesses they can have before they lose the game
I want users to have a labelled input box
So they can make a guess and know where to do it.


Scenario: User starts a new game
When I visit the game page
Then I should be shown the clue
Then I should see the number of lives I have left