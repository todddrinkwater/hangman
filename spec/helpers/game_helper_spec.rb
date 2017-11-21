require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GameHelper. For example:
#
# describe GameHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe GameHelper, type: :helper do
  describe "#show_clue" do
    it "creates a string of the clue to display" do
      clue = ["P", "O", nil, nil, nil, nil, nil, "O", "P"]

      expect(show_clue(clue)).to eq "P O _ _ _ _ _ O P"
    end
  end
end
