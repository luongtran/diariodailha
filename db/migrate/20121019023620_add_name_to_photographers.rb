class AddNameToPhotographers < ActiveRecord::Migration
  def change
    add_column :photographers, :name, :string
  end
end
