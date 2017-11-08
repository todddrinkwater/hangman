class GameController < ApplicationController
  def index
  end
  
  def create
    @game = Game.new(word: "powershop", lives_remaining: 7)
    @game.save

    redirect_to game_path(@game)
  end
  #TODO: Have button in index that will post to create, then redirect to show.
  
  def show
    @guess = Guess.new
    @game = Game.find(params[:id])

    clue_arr = @game.word.chars.map { |char| char = "_" }
    @clue = clue_arr.join(" ")
  end
end
