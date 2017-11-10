class GuessesController < ApplicationController
  def show
  end

  def create
    game = Game.find(params[:game_id])
    @guess = game.guesses.new(guess_params)

    if @guess.save
      redirect_to game_path(game)
    else
      flash[:notice] = @guess.errors.full_messages
      redirect_to game_path(game)
    end
  end

  private

  def guess_params
    params.require(:guess).permit(:guess, :game_id)
  end
end