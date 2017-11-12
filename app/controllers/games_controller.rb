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
    @game = Game.find(params[:id])
    @game.word.upcase!
  end

  private

  def game_params
    params.require(:game).permit(:word, :max_lives)
  end
end
