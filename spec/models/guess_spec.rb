require 'rails_helper'

RSpec.describe Guess, type: :model do
  subject(:game) { Game.create(word: "powershop", max_lives: 7) }
  
  context "When making a guess" do
    it "only accepts one character as input" do
      game.guesses.create(guess: "aa")
      expect(game).to_not be_valid
    end
    
    it "does not accept empty input" do
      game.guesses.create(guess: "")
      expect(game).to_not be_valid
    end
    
    it "does not accept integers as input" do
      game.guesses.create(guess: "7")
      expect(game).to_not be_valid
    end
    
    it "does not accept guesses that have already been made" do
      game.guesses.create(guess: "a")
      game.guesses.create(guess: "a")
      expect(game).to_not be_valid
    end
  end
end
