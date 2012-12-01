class CreateNewsPhotos < ActiveRecord::Migration
  def change
    create_table :news_photos do |t|
      t.string :image
      t.string :legend
      t.belongs_to :message

      t.timestamps
    end
    add_index :news_photos, :message_id
  end
end
