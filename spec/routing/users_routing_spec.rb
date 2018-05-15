require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/users").to route_to("users#index")
    end

    it "routes to #new" do
      expect(:get => "/users/new").to route_to("users#new")
    end

    it "routes to #show" do
      id_param = Faker::Number.between(1, 1000000).to_s

      expect(:get => "/users/" + id_param).to route_to("users#show", :id => id_param)
    end

    it "routes to #edit" do
      id_param = Faker::Number.between(1, 1000000).to_s

      expect(:get => "/users/" + id_param + "/edit").to route_to("users#edit", :id => id_param)
    end

    it "routes to #create" do
      expect(:post => "/users").to route_to("users#create")
    end

    it "routes to #update via PUT" do
      id_param = Faker::Number.between(1, 1000000).to_s

      expect(:put => "/users/" + id_param).to route_to("users#update", :id => id_param)
    end

    it "routes to #update via PATCH" do
      id_param = Faker::Number.between(1, 1000000).to_s

      expect(:patch => "/users/" + id_param).to route_to("users#update", :id => id_param)
    end

    it "routes to #destroy" do
      id_param = Faker::Number.between(1, 1000000).to_s

      expect(:delete => "/users/" + id_param).to route_to("users#destroy", :id => id_param)
    end
  end
end
