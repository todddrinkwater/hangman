class GamesController < ApplicationController
  def index
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.save
    
    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def show
    # @guess = Guess.new
    @game = Game.find(params[:id])

    # clue_arr = @game.word.chars.map { |char| char = "_" }
    # @clue = clue_arr.join(" ")
  end

  private

  def game_params
    params.require(:game).permit(:word, :lives_remaining)
  end
end

#Find all guesses with the same game_id as param.
#Display all guesses made
