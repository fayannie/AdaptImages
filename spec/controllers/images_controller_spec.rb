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

  describe "GET resize_form" do
     it "assigns the requested image as @image" do
     Image.should_receive(:find).with("1").and_return(@image)
     get :resize_form, :id => 1
     assigns[:image].should == @image
     end
  end

  describe "GET resize_image" do
     it "assigns the requested image as @image" do
     Image.should_receive(:find).with("1").and_return(@image)
     get :resize_image, :id => 1
     assigns[:image].should == @image
     end
  end

  describe "POST create" do

    describe "with valid params" do
     it "should save a new image" do
         Image.should_receive(:new).and_return(@image)
         @image.should_receive(:save).and_return(true)
         post :create, :image => {:image_file => 'params'}
         response.should be_redirect
         assigns[:image].should == @image
     end
    end

    describe "with invalid params" do
     it "unsaved a new image" do
         Image.should_receive(:new).and_return(@image)
         @image.should_receive(:save).and_return(false)
         post :create, :image => {}
         response.should render_template('new')
     end
    end

  end

  describe "PUT do_resize" do

    describe "with valid params" do
     it "should resize the requested image with corresponding attributes" do
         Image.should_receive(:find).with("1").and_return(@image)
         @image.should_receive(:update_attributes).and_return(true)
         @image.should_receive(:resize)
         put :do_resize, :id => 1
         response.should be_redirect
         assigns[:image].should == @image
     end
    end

    describe "with invalid params" do
     it "shouldn't resize the requested image" do
         Image.should_receive(:find).with("1").and_return(@image)
         @image.should_receive(:update_attributes).and_return(false)
         put :do_resize, :id => 1
         response.should render_template('resize_form')
     end
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
