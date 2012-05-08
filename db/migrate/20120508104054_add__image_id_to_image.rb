class AddImageIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :image_id, :integer
  end
end
