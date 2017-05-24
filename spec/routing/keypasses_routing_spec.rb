require "rails_helper"

RSpec.describe KeypassesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/keypasses").to route_to("keypasses#index")
    end

    it "routes to #new" do
      expect(:get => "/keypasses/new").to route_to("keypasses#new")
    end

    # it "routes to #show" do
    #   expect(:get => "/keypasses/1").to route_to("keypasses#show", :id => "1")
    # end

    it "routes to #edit" do
      expect(:get => "/keypasses/1/edit").to route_to("keypasses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/keypasses").to route_to("keypasses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/keypasses/1").to route_to("keypasses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/keypasses/1").to route_to("keypasses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/keypasses/1").to route_to("keypasses#destroy", :id => "1")
    end

  end
end
