class AddCoverToNewsPhotos < ActiveRecord::Migration
  def change
    add_column :news_photos, :cover, :boolean
  end
end
