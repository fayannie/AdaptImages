class ImagesController < ApplicationController

 def index
   @images = Image.all
   respond_to do |format|
      format.html # index.html.erb
   end  
 end

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
     else
        format.html { render :action => "new" }
     end
    end
 end

 def show
   @image = Image.find(params[:id])
   respond_to do |format|
     format.html # show.html.erb
   end
 end

 def destroy
    @image = Image.find(params[:id])
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url }
    end  
 end
end
