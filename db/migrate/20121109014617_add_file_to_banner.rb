class AddFileToBanner < ActiveRecord::Migration
  def change
    add_column :banners, :file, :string
  end
end
