require 'rails_helper'
#TODO: Try to switch create's to new's and get it to pass.

RSpec.describe Game, type: :model do
  subject(:game) { described_class.create(word: "powershop", max_lives: 7) }

  context "validations" do
    subject(:game) { described_class.new(word: word, max_lives: max_lives) }

    let(:word) { "powershop" }
    let(:max_lives) { 7 }

    it "is valid" do
      expect(game).to be_valid
    end

    context "invalid parameters" do
      context "without a word" do
        let(:word) { nil }

        it "is invalid" do
          expect(game).to_not be_valid
        end
      end

      context "when the word contains non-alphabetical characters" do
        let(:word) { "p0wershop" }

        it "is invalid" do
          expect(game).to_not be_valid
        end
      end

      context "when word contains no characters" do
        let(:word) { "" }

        it "is invalid" do
          expect(game).to_not be_valid
        end
      end

      context "when max lives is not provided" do
        let(:max_lives) { nil }

        it "is invalid" do
          expect(game).to_not be_valid
        end
      end

      context "when max lives contains non_numeric characters" do
        let(:max_lives) { "a" }

        it "is invalid" do
          expect(game).to_not be_valid
        end
      end
    end
  end

  describe "#lives_remaining" do
    let(:make_guess) { game.guesses.create!(guess: guess) }

    before do
      make_guess
    end

    context "when player makes a correct guess" do
      let(:guess) { "P" }

      it "does not deduct a life" do
        expect(game.lives_remaining).to eq 7
      end
    end

    context "when player makes an incorrect guess" do
      let(:guess) { "X" }

      it "deducts one life" do
        expect(game.lives_remaining).to eq 6
      end
    end

    context "when player makes a duplicate guess" do
      let(:guess) { "X" }

      before do
        2.times { make_guess }
      end

      it "does not deduct a life" do
        expect(game.lives_remaining).to eq 6
      end
    end
  end

  describe "#letters_remaining" do
    let(:make_guess) { game.guesses.create!(guess: guess) }

    before do
      make_guess
    end

    context "when player makes a correct guess" do
      let(:guess) { "P" }

      it "deducts the correct amount of letters" do
        expect(game.letters_remaining).to eq 7
      end
    end

    context "when a player makes in incorrect guess" do
      let(:guess) { "X" }

      it "does not change the number of letters remaining" do
        expect{ :make_guess }.not_to change { game.letters_remaining }
      end
    end

    context "when a player makes a duplicate guess" do
      let(:guess) { "W" }
      let(:guess) { "W" }

      it "deducts the correct amount of letters" do
        expect(game.letters_remaining).to eq 8
      end
    end
  end

  describe "#incorrect_guesses" do
    let(:make_guess) { game.guesses.create!(guess: guess) }

    before do
      make_guess
    end

    context "when making an incorrect guess" do
      let(:guess) { "X" }

      it "returns the guess in the list of incorrect guesses" do
        expect(game.incorrect_guesses).to eq ["X"]
      end
    end

    context "when making a correct guess" do
      let(:guess) { "P" }

      it "does not add the guess to the list of incorrect guesses" do
        expect(game.incorrect_guesses).to eq []
      end
    end

    context "when making a duplicate incorrect guess" do
      let(:guess) { "X" }
      let(:guess) { "X" }

      it "only the original guess is added to the incorrect guesses list" do
        expect(game.incorrect_guesses).to eq ["X"]
      end
    end
  end

  describe "#won?" do
    let(:make_guess) { game.guesses }

    context "when the user makes a winning guess" do
      guesses = ["P", "O", "W", "E", "R", "S", "H"]

      it "identifies that the game has been won" do
        guesses.each { |g| make_guess.create(guess: g) }
        expect(game).to be_won
      end
    end

    context "when all letters have not yet been guessed" do
      guesses = ["P", "O", "W", "E", "R", "S"]

      it "identifies that the game has been won" do
        guesses.each { |g| make_guess.create(guess: g) }
        expect(game).to_not be_won
      end
    end
  end

  describe "#lost?" do
    let(:make_guess) { game.guesses }

    context "when player has more than 1 life remaining" do
      it "is not lost" do
        expect(game).to_not be_lost
      end
    end

    context "when player has no lives remaining" do
      guesses = %w[M N B V C X Z]

      it "is lost" do
        guesses.each { |g| make_guess.create(guess: g) }
        expect(game).to be_lost
      end
    end
  end
end
