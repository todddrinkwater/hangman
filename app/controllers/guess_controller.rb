class GuessController < ApplicationController
  def create
    @guess = Guess.create(guess_params)
    
    redirect_to game_path(params[:game_id])
  end
  
  private
  
  def guess_params
    params.require(:guess).permit(:guess, :game_id)
  end
end
