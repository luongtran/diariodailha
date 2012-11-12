class AddPriceToSaleItem < ActiveRecord::Migration
  def change
    add_column :sale_items, :price, :float
  end
end
