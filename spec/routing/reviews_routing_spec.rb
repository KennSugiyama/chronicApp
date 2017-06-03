require "rails_helper"

RSpec.describe "Routing to reviews", :type => :routing do

  it "routes GET /reviews/new to reviews#new" do
    expect(:get => "/reviews/new").to route_to("reviews#new")
  end

  it "routes POST /reviews to reviews#create" do
    expect(:post => "/reviews").to route_to("reviews#create")
  end

  it "routes PUT /reviews/1 to reviews#update " do
    expect(:put => "/reviews/1").to route_to("reviews#update", :id=>"1")
  end

  it "routes DELETE /reviews/1 to reviews#destroy" do
    expect(:delete => "/reviews/1").to route_to("reviews#destroy", :id =>"1")
  end

end
