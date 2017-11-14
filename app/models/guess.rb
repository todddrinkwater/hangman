class Guess < ApplicationRecord
  belongs_to :game
  validates_uniqueness_of :guess, scope: :game_id
  validates_presence_of :guess
  validates :guess, length: { is: 1 }
  validates :guess, format: { with:  /\A[a-zA-Z]+\z/, message: "can only be a letter"}

  private

  def make_uppercase!
    self.guess.upcase!
  end
end