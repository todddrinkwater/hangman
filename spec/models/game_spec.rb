require 'rails_helper'

RSpec.describe Game, type: :model do
  subject(:game) { described_class.new(word: "powershop", max_lives: 7) }
  
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
end
