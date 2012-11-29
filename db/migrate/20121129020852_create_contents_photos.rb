class CreateContentsPhotos < ActiveRecord::Migration
  def change
    create_table :contents_photos do |t|
      t.string :image
      t.string :legend
      t.belongs_to :content

      t.timestamps
    end
    add_index :contents_photos, :content_id
  end
end
