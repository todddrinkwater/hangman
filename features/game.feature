Feature: Game
  As the games product owner
  I want the player to be able to see a clue (masked version of word to guess)
  So that they know what letters they have guessed and how many letters are in the word
  I want the player to be able to be able to see how many lives they have left
  So that the player knows how many wrong guesses they can have before they lose the game
  I want the player to have a labelled input box
  So they can make a guess and know where to do it.
  I want the player to be informed when they have made a duplicate guess.
  I want the player to be informed when they have won.
  I want the player to be informed when they have lost and be shown the guess word.

Background:
  Given the player is on the game page
  #TODO: Rename to have more active voice. Have it better describe an action taken.

#TODO: Scenario needs to better describe following lines after it.
Scenario: Player starts a new game
  Then I am shown the clue
  Then I see the number of lives I have left
  Then I see the incorrect guesses display as empty

Scenario: Player makes a correct guess
  When I submit a correct guess
  Then the clue displays the correctly guessed letters
  Then I see the number of lives remaining is unchanged

Scenario: Player makes an incorrect guess
  #TODO: Remove duplication.
  Given I make an incorrect guess
  When I submit an incorrect guess
  Then I see a single life is deducted
  Then I see the guess added to the incorrect guesses list

Scenario: Player guesses a letter that has already been guessed
  When I submit a duplicate guess
  Then I see an appropriate error message

Scenario: Player makes guess that wins a game
  When I submit the winning guess
  Then I see a game won message
  Then I should see a link for playing a new game

Scenario: Player makes guess that loses a game
  When I submit the losing guess
  Then I see a game lost message