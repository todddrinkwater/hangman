require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "GET index" do
    context "when the game is first opened" do
      it "renders index template" do
        get :index

        expect(response).to render_template("index")
      end

      it "has a status code of 200" do
        get :index

        expect(response.status).to eq(200)
      end
    end
  end

  describe "GET new" do
    context "when player sets up a new game" do
      it "assigns @game" do
        game = Game.create
        get :new

        expect(assigns(:game)).to be_a_new(Game)
      end
    end
  end

  describe "#create" do
    context "when a player creates a new game" do
      context "with valid params" do
        before do
          post :create, :params => { :game => { :word => "powershop", :max_lives => 7 } }
        end

        it "redirects to the show path" do
          post :create, :params => { :game => { :word => "powershop", :max_lives => 7 } }
          id = Game.order(:id => :desc).first.id

          expect(response).to redirect_to(game_path(id))
        end

        it "returns a 302 status code" do
          post :create, :params => { :game => { :word => "powershop", :max_lives => 7 } }
          expect(response.status).to eq(302)
        end

        it "creates a game" do
          expect {
            post :create, :params => { :game => { :word => "powershop", :max_lives => 7 } }
           }.to change { Game.count }
        end
      end

      context "with invalid params" do
        before do
          post :create, :params => { :game => { :word => "p0wershop", :max_lives => 7 } }
        end

        it "redirects to the new path" do
          expect(response).to render_template('new')
        end
      end
    end
  end

  describe "#show" do
    context "player has created a new game" do
      before do
        game = Game.create(word: "powershop", max_lives: 7)
        get :show, :params => { :id => game.id }
      end

      it "renders the show template" do
        expect(response).to render_template('show')
      end

      it "returns a 200 status code" do
        expect(response.status).to eq(200)
      end
    end
  end
end
