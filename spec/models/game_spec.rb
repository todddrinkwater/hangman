require 'rails_helper'

RSpec.describe Game, type: :model do
  subject(:game) { described_class.create(word: "powershop", max_lives: 7) }
  
  context "When starting a new game" do
    it "is valid with valid attributes" do
      expect(game).to be_valid
    end
    it "is not valid without a word" do
      game.word = nil
      
      expect(game).to_not be_valid
    end
    it "is not valid without max lives" do
      game.max_lives = nil
      
      expect(game).to_not be_valid
    end
    it "only allows integers as input for max lives" do
      game.max_lives = "g"
      
      expect(game).to_not be_valid
    end
    it "only allows letters as input for the guess word" do
      game.word = "p0wershop"
      
      expect(game).to_not be_valid
    end
  end
  
  context "When the game is active" do
    it "displays the max number of lives available upon start" do
      expect(game.lives_remaining).to eq 7
    end
    
    it "deducts 1 life per incorrect guess" do
      game.guesses.create(guess: "x")
      
      expect(game.lives_remaining).to eq 6
    end
    
    it "calculates number of letters left to guess" do
      game.guesses.create(guess: "p")
      game.guesses.create(guess: "o")
      
      expect(game.letters_remaining).to eq 5
    end
    
    it "should not be won when all letters have not been guessed" do
      expect(game).to_not be_won
    end
    
    it "be won once all letters have been guessed" do
      guesses = ["p", "o", "w", "e", "r", "s", "h"]
      guesses.each do |g|
        game.guesses.create(guess: g)
      end
      
      expect(game).to be_won
    end
    
    it "should not be lost if lives are still remaining" do
      expect(game).to_not be_lost
    end
    
    it "is lost when no lives are remaining" do
      guesses = ["q", "t", "y", "u", "i", "a", "d", "f", "g"]
      guesses.each do |g|
        game.guesses.create(guess: g)
      end
      
      expect(game).to be_lost
    end
  end
end
