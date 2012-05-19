class RemoveWidthColumnToImage < ActiveRecord::Migration
  def up
   remove_column :images, :image_id
  end

  def down
  end
end
