require 'rubygems'
require 'RMagick'

class Image < ActiveRecord::Base
   after_save :save_to_disk
   validate :image_is_present
   after_destroy :delete_file

   def image_file=(file)
     @temp_file = file
     self.title = file.original_filename
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
     if self.width
       width = self.width
     else
       width = 100
     end
     if self.height
       height = self.height
     else
       height = 100
     end
     @id = self.id.to_s
     original_image = Magick::Image.read('public/upload/'<<@id).first
     resize_image = original_image.resize(width, height)
     resize_image.write('public/upload/resize/'<<@id)
   end

   def delete_file
     File.delete("#{Rails.root}/public/upload/#{self.id}")
     File.delete("#{Rails.root}/public/upload/resize/#{self.id}")
   end
end
