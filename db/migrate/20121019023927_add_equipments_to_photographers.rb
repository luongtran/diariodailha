class AddEquipmentsToPhotographers < ActiveRecord::Migration
  def change
    add_column :photographers, :equipments, :string
  end
end
