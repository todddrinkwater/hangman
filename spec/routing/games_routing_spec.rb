require "rails_helper"

RSpec.describe "routes for games", :type => :routing do
  describe "/games route" do
    it "routes /games to the games controller" do
      expect(get("/games")).to route_to("games#index")
    end

    context "when starting a new game" do
      it "routes /games/new to the games new controller" do
        expect(get("/games/new")).to route_to("games#new")
      end
    end

    context "when creating the parameters for a new game" do
      it "routes /games/create to the create action" do
        expect(post("/games")).to route_to("games#create")
      end
    end

    #NOTE: Requires better description.
    context "when viewing a current game" do
      let(:game) { Game.create(word: "power", max_lives: 5) }
      
      it "routes /games/:id to the show action" do
        expect(get("/games/:id")).to route_to(:controller => "games", :action => "show", :id => ":id") #NOTE: Fails
      end
    end

    # context "when a player attempts to delete a game" do
    #   it "does not route to a delete action" do
    #     expect(delete("/games/:id")).not_to be_routable
    #   end
    end
  end
end