require "spec_helper"

describe LessonTemplatesController do
  describe "routing" do

    it "routes to #index" do
      get("/lesson_templates").should route_to("lesson_templates#index")
    end

    it "routes to #new" do
      get("/lesson_templates/new").should route_to("lesson_templates#new")
    end

    it "routes to #show" do
      get("/lesson_templates/1").should route_to("lesson_templates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lesson_templates/1/edit").should route_to("lesson_templates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lesson_templates").should route_to("lesson_templates#create")
    end

    it "routes to #update" do
      put("/lesson_templates/1").should route_to("lesson_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lesson_templates/1").should route_to("lesson_templates#destroy", :id => "1")
    end

  end
end
