class AddOriginalImageIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :original_image_id, :integer
  end
end
