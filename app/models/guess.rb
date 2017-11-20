class Guess < ApplicationRecord
  belongs_to :game
  validates :guess, uniqueness: { scope: :game_id }
  validates_presence_of :guess
  validates :guess, length: { is: 1 }
  validates :guess, format: { with:  /\A[A-Z]+\z/, message: "can only be a letter."}
end