class GuessesController < ApplicationController
  
  # def new
  #   set up vars that view needs
  #   @guess = Game.guesses.build
  #   would have to set this up in new, edit, create
  # end
  
  def create
    game = Game.find(params[:game_id])
    new_guess = game.guesses.new(guess_params)
    new_guess.guess.upcase!

    if new_guess.save
      redirect_to game_path(game)
    else
      flash[:notice] = new_guess.errors.full_messages
      redirect_to game_path(game) #TODO: make this render 'new' view on fail, not redirect.
    end
  end

  private

  def guess_params
    params.require(:guess).permit(:guess, :game_id)
  end
end