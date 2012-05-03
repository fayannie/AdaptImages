require 'rubygems'
require 'RMagick'

class Image < ActiveRecord::Base

   has_many :resize_images, :dependent => :destroy
   
   after_save :save_to_disk
   after_destroy :delete_file

   validate :image_is_present
   validates :width, :height, :numericality => true
   validates_numericality_of :width, :height, :only_integer => true

   def image_file=(file)
     @temp_file = file
     self.title = file.original_filename
     self.width = 100
     self.height = 100
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
   
   def resize  
     width = self.width
     height = self.height
     @id = self.id.to_s
     original_image = Magick::Image.read('public/upload/'<<@id).first
     resize_image = original_image.resize(width, height)
     @resize_image = resize_images.create
     @resize_image.image_size = width.to_s + '*' + height.to_s
     @resize_id = @resize_image.id.to_s
     resize_image.write('public/upload/resize/'<<@resize_id) 
   end

   def delete_file
     File.delete("#{Rails.root}/public/upload/#{self.id}")
   end
end
