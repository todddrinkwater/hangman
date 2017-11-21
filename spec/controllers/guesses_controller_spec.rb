require 'rails_helper'

RSpec.describe GuessesController, type: :controller do
  describe "GET index" do
    let(:game) { Game.create!(word: "powershop", max_lives: 7) }
    let(:params) { { :game_id => game.id } }

    context "when player refreshes the page" do
      it "redirects to the show template" do
        get :index, :params => params

        expect(response).to redirect_to(game_path(game.id))
      end
    end
  end

  describe "POST #create" do
    let(:game) { Game.create!(word: "powershop", max_lives: 7) }
    let(:guess) { "P" }
    let(:params) {
        { :game_id => game.id,
          :guess => { :guess => guess }
        }
    }

    context "when player makes a valid guess" do
      it "redirects to the game#show template" do
        post :create, :params => params

        expect(response).to redirect_to(game_path(params[:game_id]))
      end

      it "creates a new guess" do
        expect {
          post :create, :params => params
        }.to change { game.guesses.count }
      end
    end

    context "when player makes a invalid guess" do
      let(:guess) { "&" }

      it "redirects to the game#show template" do
        post :create, :params => params
        expect(response).to render_template('games/show')
      end
    end
  end
end