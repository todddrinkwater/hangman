class Game < ApplicationRecord
  has_many :guesses, dependent: :destroy
  validates_presence_of :word, :max_lives
  
  # def max_lives
  #   word = game.word.chars #get correct letters to guess
  #   unless word.include?(@guess.guess) # check if word includes guess
  #     game.max_lives -= 1 # -1 live if guess incorrect
  #     game.save # save to DB
  #   end
  # end
  
end
