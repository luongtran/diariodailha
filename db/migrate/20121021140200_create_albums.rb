class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :beach
      t.string :peak
      t.datetime :date
      t.belongs_to :photographer

      t.timestamps
    end
    add_index :albums, :photographer_id
  end
end
