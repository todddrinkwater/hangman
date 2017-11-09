require 'rails_helper'

RSpec.describe Game, type: :model do
  subject(:game) { described_class.new(word: "powershop", max_lives: 7, guesses: []) }
  
  context "When starting a new game" do
    it "is valid with valid attributes" do
      expect(game).to be_valid
    end
    it "is not valid without a word" do
      game.word = nil
      expect(game).to_not be_valid
    end
    it "is not valid without lives remaining" do
      game.max_lives = nil
      expect(game).to_not be_valid
    end
    it "is not valid without lives remaining" do
      game.guesses = nil
      expect(game).to_not be_valid
    end
  end
end
