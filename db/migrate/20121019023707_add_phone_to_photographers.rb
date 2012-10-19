class AddPhoneToPhotographers < ActiveRecord::Migration
  def change
    add_column :photographers, :phone, :string
  end
end
