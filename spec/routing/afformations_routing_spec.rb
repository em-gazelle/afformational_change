require "rails_helper"

RSpec.describe AfformationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/afformations").to route_to("afformations#index")
    end

    it "routes to #new" do
      expect(:get => "/afformations/new").to route_to("afformations#new")
    end

    it "routes to #show" do
      expect(:get => "/afformations/1").to route_to("afformations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/afformations/1/edit").to route_to("afformations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/afformations").to route_to("afformations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/afformations/1").to route_to("afformations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/afformations/1").to route_to("afformations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/afformations/1").to route_to("afformations#destroy", :id => "1")
    end

  end
end
