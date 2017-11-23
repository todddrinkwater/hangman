class Guess < ApplicationRecord
  belongs_to :game

  validates :value,
    uniqueness: { scope: :game_id },
    length: { is: 1 },
    format: { with:  /\A[a-zA-Z]+\z/, message: "can only be a letter."},
    presence: true

  before_save :make_uppercase!

  private

  def make_uppercase!
    self.value.upcase!
  end
end

