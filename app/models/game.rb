class Game < ApplicationRecord
  has_many :guesses, dependent: :destroy
  validates_presence_of :word, :max_lives
  validates :max_lives, numericality: { only_integer: true }
  validates :word, format: { with:  /\A[a-zA-Z]+\z/, message: "can only consist of letters." }
  before_save :make_uppercase!

  def lives_remaining
    max_lives - incorrect_guesses.length
  end

  def letters_remaining
    letters_remaining = word.chars - guesses.pluck(:value)

    letters_remaining.length
  end

  def incorrect_guesses
    characters_to_guess = word.chars.uniq

    incorrect_guesses = guesses_made - characters_to_guess
  end

  def won?
    letters_remaining <= 0 && !lost?
  end

  def lost?
    lives_remaining <= 0
  end

  def guesses_made
    guesses.pluck(:value)
  end

  def clue
    word.chars.map { |letter| guesses_made.include?(letter) ? letter : nil }
  end

  private

  def make_uppercase!
    self.word.upcase!
  end

  # private
  #
  # def is_cool
  #   unless coolness.present?
  #     errors[:base] << "Game is not cool."
  #   end
  # end
end
