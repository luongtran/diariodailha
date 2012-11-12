class AddTypeToSaleItem < ActiveRecord::Migration
  def change
    add_column :sale_items, :type, :string
  end
end
