class GameController < ApplicationController
  def index
    @game = Game.new(word: "powershop", lives_remaining: 7)
    @game.save
    
    clue_arr = @game.word.chars.map { |char| char = "_" }
    @clue = clue_arr.join(" ")
  end
end
