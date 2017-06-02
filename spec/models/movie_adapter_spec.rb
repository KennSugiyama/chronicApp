require 'rails_helper'

describe Movie_Adapter do
  # let(:game) { Game.new }

  describe "#search" do
    context "When a movie title is given" do
      it "should return a JSON file.omdbapi's entry on the movie." do
        movie_title = "goonies"
        movie=Movie_Adapter.new
        expect(response).to be_success
      end
    end
  end
end