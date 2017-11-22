class Guess < ApplicationRecord
  belongs_to :game
  validates :value, uniqueness: { scope: :game_id }
  validates_presence_of :value
  validates :value, length: { is: 1 }
  validates :value, format: { with:  /\A[a-zA-Z]+\z/, message: "can only be a letter."}
  before_save :make_uppercase!
end

def make_uppercase!
  self.value.upcase!
end