require 'rails_helper'

RSpec.describe Guess, type: :model do
  subject(:game) { Game.create(word: word, max_lives: max_lives) }

  let(:word) { "powershop" }
  let(:max_lives) { 7 }

  context "validations" do
    subject(:make_guess) { game.guesses.create(guess: guess) }

    context "when given valid parameters" do
      let(:guess) { "p" }

      it "is valid" do
        expect(make_guess).to be_valid
      end
    end

    context "when given invalid parameters" do
      context "when given a number" do
        let(:guess) { 7 }

        it "is invalid" do
          expect(make_guess).to_not be_valid
        end
      end

      context "when given more than one letter" do
        let(:guess) { "aa" }

        it "is invalid" do
          expect(make_guess).to_not be_valid
        end
      end

      context "when the guess contains zero characters" do
        let(:guess) { "" }

        it "is invalid" do
          expect(make_guess).to_not be_valid
        end
      end

      context "when the guess has already been made" do
        let(:guess) { "a" }

        before do
          make_guess
        end

        it "is invalid" do
          expect(game.guesses.new(guess: "a")).to_not be_valid
        end
      end
    end
  end
end
