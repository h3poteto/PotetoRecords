require "spec_helper"

describe MenurecordsController do
  describe "routing" do

    it "routes to #index" do
      get("/menurecords").should route_to("menurecords#index")
    end

    it "routes to #new" do
      get("/menurecords/new").should route_to("menurecords#new")
    end

    it "routes to #show" do
      get("/menurecords/1").should route_to("menurecords#show", :id => "1")
    end

    it "routes to #edit" do
      get("/menurecords/1/edit").should route_to("menurecords#edit", :id => "1")
    end

    it "routes to #create" do
      post("/menurecords").should route_to("menurecords#create")
    end

    it "routes to #update" do
      put("/menurecords/1").should route_to("menurecords#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/menurecords/1").should route_to("menurecords#destroy", :id => "1")
    end

  end
end
