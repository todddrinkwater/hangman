class Game < ApplicationRecord
  has_many :guesses, dependent: :destroy
  validates_presence_of :word, :max_lives

  def lives_remaining
    target_characters = word.chars.uniq
    incorrect_guesses = guesses.pluck(:guess) - target_characters

    max_lives - incorrect_guesses.length
  end

  # private
  #
  # def is_cool
  #   unless coolness.present?
  #     errors[:base] << "Game is not cool."
  #   end
  # end

end
