class ImagesController < ApplicationController

  def index
    @images = Image.all
    respond_to do |format|
      format.html # index.html.erb
      format.json # index.json.jbuilder
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
     format.json # show.json.jbuilder
    end
  end
 
  def create
    @image = Image.new(params[:image_file])
    respond_to do |format|
     if @image.save
        format.html { redirect_to @image, :notice => 'Image was successfully uploaded.' }
        format.json { render :show, :status => :created, :location => @image }
     else
        format.html { render :action => "new", :notice => 'Image should be attached'}
        format.json { render :json => @image.errors, :status => :unprocessable_entity }
     end
    end
  end

  def resize_form
    @image = Image.find(params[:id])
    respond_to do |format|
      format.html  # resize_form.html.erb
    end
  end

  def do_resize
    @image = Image.find(params[:id])
    @image.resize(params[:width], params[:height])
    respond_to do |format|
       format.html  { redirect_to :action => 'resize_image', :id => @image.id }
       format.json  { render :resize_image, :status => :created }
    end
  end

  def resize_image
    @image = Image.find(params[:id])
    respond_to do |format|
      format.html  # resize_image.html.erb
      format.json  # resize_image.json.jbuilder
    end
  end  

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url }
      format.json { render :index }
    end  
  end
end
