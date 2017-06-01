require "rails_helper"

RSpec.describe "Routing to movies", :type => :routing do
  it "routes GET /movies to movies#index" do
    expect(:get => "/movies").to route_to("movies#index")
  end

  it "routes GET /movies/1 to movies#show" do
    expect(:get =>"/movies/1").to route_to("movies#show", :id =>"1")
  end

  it "routes GET /search to movies#search" do
    expect(:get => "/search"). to route_to("movies#search")
  end
  # it "routes GET /games/new to games#new" do
  #   expect(:get => "/games/new").to route_to("games#new")
  # end

  # it "routes GET /games/1 to games#show" do
  #   expect(:get => "/games/1").to route_to("games#show", :id => "1")
  # end

  # it "routes POST /games to games#create" do
  #   expect(:post => "/games").to route_to("games#create")
  # end

  # it "routes DELETE /games/1 to games#destroy" do
  #   expect(:delete => "/games/1").to route_to("games#destroy", :id => "1")
  # end
end
