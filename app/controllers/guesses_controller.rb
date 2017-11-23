class GuessesController < ApplicationController
  def index
    @game = Game.find(params[:game_id])
    
    redirect_to game_path(@game)
  end

  def create
    @game = Game.find(params[:game_id])
    @guess = @game.guesses.new(guess_params)

    if @guess.save
      redirect_to game_path(@game)
    else
      flash[:notice] = @guess.errors.full_messages
      render 'games/show'
    end
  end

  private

  def guess_params
    params.require(:guess).permit(:value, :game_id)
  end
end

#TODO: Find out why I need an index action here
#TODO: Remove unneeded ivars