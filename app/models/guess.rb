class Guess < ApplicationRecord
  belongs_to :game
  validates_uniqueness_of :guess, scope: :game_id
end
