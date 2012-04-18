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

  def show
    @image = Image.find(params[:id])
    respond_to do |format|
     format.html # show.html.erb
    end
  end
 
  def create
    @image = Image.new(params[:image_file])
    respond_to do |format|
     if @image.save
        format.html { redirect_to @image, :notice => 'Image was successfully uploaded.' }
     else
        format.html { render :action => "new", :notice => 'Image should be attached'}
     end
    end
  end

  def resize_form
    @image = Image.find(params[:id])
    respond_to do |format|
      format.html  # resize_form.html.erb
    end
  end

  def resize_image
    @image = Image.find(params[:id])
    respond_to do |format|
      format.html  # resize_image.html.erb
    end
  end

  def do_resize
    @image = Image.find(params[:id])
    respond_to do |format|
      if @image.update_attributes(params[:image])
        @image.resize
        format.html  { redirect_to :action => 'resize_image', :id => @image.id, :notice => "#{@image.width}*#{@image.height}" }
      else
        format.html { render :action => "resize_form" }
      end
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
