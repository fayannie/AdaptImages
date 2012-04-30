class AddImageSizeToResizeImage < ActiveRecord::Migration
  def change
    add_column :resize_images, :image_size, :string

  end
end
