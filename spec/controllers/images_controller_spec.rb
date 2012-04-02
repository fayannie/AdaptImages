require 'spec_helper'

describe ImagesController do

  before(:each) do
    @image = mock_model(Image)
  end

  describe "GET index" do
     it "assigns all images to @images" do
      get:index
      assigns[:images].should == Image.all
     end
  end

  describe "GET new" do
     it "assigns a new image as @image" do
      Image.should_receive(:new).and_return(@image)
      get :new
      assigns[:image].should == @image
     end
  end 

  describe "GET show" do
     it "assigns the requested image as @image" do
     Image.should_receive(:find).with("1").and_return(@image)
     get :show, :id => 1
     assigns[:image].should == @image
     end
  end

  describe "POST create" do
     it "should save a new image" do
         Image.should_receive(:new).and_return(@image)
         @image.should_receive(:save).and_return(true)
         post :create, :image => {:image_file => 'params'}
         response.should be_redirect
         assigns[:image].should == @image
     end
  end

  describe "DELETE destroy" do
     it "destroys the requestied image" do
         Image.should_receive(:find).with("1").and_return(@image)
         @image.should_receive(:destroy)
         delete :destroy, :id => 1
     end
  end
end
