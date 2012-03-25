require 'spec_helper'

describe ImagesController do
  it "should route GET /images/new" do
    { :get => "/images/new" }.should route_to(
      :controller => "images",
      :action => "new"
    )
  end

  it "should route POST /images/show" do
    { :post => "/images/show" }.should route_to(
      :controller => "images",
      :action => "show"
    )
  end
end
