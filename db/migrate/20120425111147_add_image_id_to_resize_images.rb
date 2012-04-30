class AddImageIdToResizeImages < ActiveRecord::Migration
  def change
    add_column :resize_images, :image_id, :integer

  end
end
