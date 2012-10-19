class AddCepToPhotographers < ActiveRecord::Migration
  def change
    add_column :photographers, :cep, :string
  end
end
