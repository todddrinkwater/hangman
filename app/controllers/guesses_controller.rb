class GuessesController < ApplicationController
  def index
    @game = Game.find(params[:game_id])
    redirect_to game_path(@game)
  end

  def create
    @game = Game.find(params[:game_id])
    @guess = @game.guesses.new(guess_params)
    @guess.guess.upcase!

    if @guess.save
      redirect_to game_path(@game)
    else
      flash[:notice] = @guess.errors.full_messages
      render 'games/show'
    end
  end

  private

  def guess_params
    params.require(:guess).permit(:guess, :game_id)
  end
end