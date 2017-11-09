class GuessesController < ApplicationController
  def show
  end
  
  def create
    game = Game.find(params[:game_id])
    @guess = game.guess.create!(guess_params)
    
    redirect_to game_path(game)
  end
  
  private

  def guess_params
    params.require(:guess).permit(:guess, :game_id)
  end
end
