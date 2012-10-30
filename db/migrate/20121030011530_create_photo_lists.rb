class CreatePhotoLists < ActiveRecord::Migration
  def change
    create_table :photo_lists do |t|
      t.belongs_to :sale
      t.belongs_to :photo

      t.timestamps
    end
    add_index :photo_lists, :sale_id
    add_index :photo_lists, :photo_id
  end
end
