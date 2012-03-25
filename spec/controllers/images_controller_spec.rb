require 'spec_helper'

describe ImagesController do

  describe "GET new" do
    it "assigns a new image as @image" do
      get :new
      assigns[:image].should_not be_nil
    end

    it "renders the new templage" do
      get :new
      response.should render_template("new")
    end
  end 

  describe "POST create" do
     it "should save a new image" do
       expect {
         post :create #put some params here
       }.to change(Image, :count).by(1)
     end
  end
end
