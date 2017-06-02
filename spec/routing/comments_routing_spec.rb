require "rails_helper"

RSpec.describe "Routing to comments", :type => :routing do

  it "routes GET /comments/new to comments#new" do
    expect(:get => "/comments/new").to route_to("comments#new")
  end

  it "routes POST /comments to comments#create" do
    expect(:post => "/comments").to route_to("comments#create")
  end

  it "routes PUT /comments/1 to comments#update " do
    expect(:put => "/comments/1").to route_to("comments#update", :id=>"1")
  end

  it "routes DELETE /comments/1 to comments#destroy" do
    expect(:delete => "/comments/1").to route_to("comments#destroy", :id =>"1")
  end

end
