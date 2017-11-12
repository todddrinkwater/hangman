class Guess < ApplicationRecord
  belongs_to :game
  validates_uniqueness_of :guess, scope: :game_id
  validates_presence_of :guess
  validates :guess, length: { is: 1 }
end