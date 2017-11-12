class Game < ApplicationRecord
  has_many :guesses, dependent: :destroy
  validates_presence_of :word, :max_lives
  validates :max_lives, numericality: { only_integer: true }
  validates :word, format: { with:  /\A[a-zA-Z]+\z/, message: "can only consist of letters."}

  def lives_remaining
    target_characters = word.chars.uniq
    incorrect_guesses = guesses.pluck(:guess) - target_characters

    max_lives - incorrect_guesses.length
  end
  
  def letters_remaining
    letters_remaining = word.chars - guesses.pluck(:guess)
    letters_remaining.length
  end
  
  def won?
    letters_remaining < 1
  end
  
  def lost?
    lives_remaining < 1
  end

  # private
  #
  # def is_cool
  #   unless coolness.present?
  #     errors[:base] << "Game is not cool."
  #   end
  # end

end
