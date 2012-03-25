class ImagesController < ApplicationController

  def new
    @image = Image.new
    respond_to do |format|
      format.html # new.html.erb
    end
 end
 
 def create
    @image = Image.new(params[:image_file])
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, :notice => 'Image was successfully uploaded.' }
      end
    end
 end

 def show
 end
end
