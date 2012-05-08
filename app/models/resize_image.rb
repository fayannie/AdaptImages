class ResizeImage < ActiveRecord::Base
  belongs_to :image
  after_destroy :delete_file

  def delete_file
     File.delete("#{Rails.root}/public/upload/resize/#{self.id}")
  end
end
