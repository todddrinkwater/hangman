require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "GET index" do
    it "renders index template" do
      get :index

      expect(response).to render_template("index")
    end

    it "has a status code of 200" do
      get :index

      expect(response.status).to eq(200)
    end
  end

  describe "GET new" do
    it "assigns @game" do
      game = Game.create
      get :new

      expect(assigns(:game)).to be_a_new(Game)
    end
  end

  describe "#create" do
    context "when a user creates a new game" do
      context "with valid params" do
        before do
          post :create, :params => { :game => { :word => "powershop", :max_lives => 7 } }
        end

        it "redirects to the show path" do
          id = Game.order(:id => :desc).first.id

          expect(response).to redirect_to(game_path(id))
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
    context "user has created a new game" do
      before do
        get :show, :params => { :id => Game.first }
      end

      it "renders the show template" do
        expect(response).to render_template('show')
      end
    end
  end
end
