require 'spec_helper'

describe ImagesController do

  it "should route GET/images" do
    { :get => "/images" }.should route_to(
      :controller => "images",
      :action => "index"
    )
  end

  it "should route GET /images/new" do
    { :get => "/images/new" }.should route_to(
      :controller => "images",
      :action => "new"
    )
  end

  it "should route GET /images/1" do
    { :get => "/images/1" }.should route_to(
      :controller => "images",
      :action => "show",
      :id => "1"
    )
  end

  it "should route GET /images/1/resize_form" do
    { :get => "/images/1/resize_form" }.should route_to(
      :controller => "images",
      :action => "resize_form",
      :id => "1"
    )
  end

  it "should route GET /images/1/resize_image" do
    { :get => "/images/1/resize_image" }.should route_to(
      :controller => "images",
      :action => "resize_image",
      :id => "1"
    )
  end
end
