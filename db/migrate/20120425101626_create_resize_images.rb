class CreateResizeImages < ActiveRecord::Migration
  def change
    create_table :resize_images do |t|

      t.timestamps
    end
  end
end
