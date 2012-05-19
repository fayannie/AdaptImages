require 'rubygems'
require 'RMagick'

class Image < ActiveRecord::Base

   has_many :resize_images, 
            :class_name => "Image", 
            :dependent => :destroy  

   belongs_to :parent,
	      :class_name => "Image",
              :foreign_key => "image_id"


   after_save :save_to_disk
   after_destroy :delete_file

   validate :image_is_present

   def image_file=(file)
     @temp_file = file
     if file.respond_to? :original_filename
       self.title = file.original_filename
     end
   end

   def parent=(parent) 
     super 
     self.title = parent.title + "_resized"
   end

   def save_to_disk
     if @temp_file
        data = @temp_file.read
        directory = 'public/upload/'
        path = File.join(directory,self.id.to_s)
        File.open(path,"wb") { |f| f.write(data) }
     end
   end

   def image_is_present
      if new_record? and @temp_file.nil?
          errors.add(:image, "You need to attach an image file.")
      end
   end
   
   def resize(width, height)  
     @id = self.id.to_s
     original_image = Magick::Image.read('public/upload/'<<@id).first
     new_image = original_image.resize(width.to_i, height.to_i)
     StringIO.open(new_image.to_blob) do |io|
       resize_images.create!(:image_file => io, :parent => self)
     end
   end

   def delete_file
     File.delete("#{Rails.root}/public/upload/#{self.id}")
   end
end
