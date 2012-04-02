class Image < ActiveRecord::Base
   after_save :save_to_disk
   after_destroy :delete_file

   def image_file=(file)
     @temp_file = file
     name = @temp_file.original_filename
     self.title = name.gsub(/[.]/,'-')
   end

   def save_to_disk
     if @temp_file
        data = @temp_file.read
        directory = 'public/upload/'
        path = File.join(directory,self.title)
        File.open(path,"wb") { |f| f.write(data) }
     end
   end

   def delete_file
     File.delete("#{Rails.root}/public/upload/#{self.title}")
   end
end
