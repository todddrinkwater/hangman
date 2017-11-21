class Guess < ApplicationRecord
  belongs_to :game
  validates :value, uniqueness: { scope: :game_id }
  validates_presence_of :value
  validates :value, length: { is: 1 }
  validates :value, format: { with:  /\A[A-Z]+\z/, message: "can only be a letter."}
end