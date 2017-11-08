class Game < ApplicationRecord
  has_many :guess
  validates_presence_of :word, :lives_remaining
end
