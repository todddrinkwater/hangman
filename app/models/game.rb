class Game < ApplicationRecord
  #request validation
  validates_presence_of :word, :lives_remaining
end
