require 'rails_helper'

RSpec.describe GuessesController, type: :controller do
  let(:game) { Game.create!(word: "powershop", max_lives: 7) }
  
  describe "GET index" do
    let(:params) { { :game_id => game.id } }

    it "redirects to the show template" do
      get :index, :params => params

      expect(response).to redirect_to(game_path(game.id))
    end
  end

  describe "POST create" do
    let(:value) { "P" }
    let(:params) do
      {
        :game_id => game.id,
        :guess => { :value => value }
      }
    end
    
    let(:create_guess) { post :create, :params => params }

    context "when player makes a valid guess" do
      it "redirects to the game#show template" do
        create_guess

        expect(response).to redirect_to(game_path(params[:game_id]))
      end

      it "creates a new guess" do
        expect { create_guess }.to change { game.guesses.count }
      end
    end

    context "when player makes a invalid guess" do
      let(:value) { "&" }

      it "redirects to the game#show template" do
        create_guess
        
        expect(response).to render_template('games/show')
      end
    end
  end
end