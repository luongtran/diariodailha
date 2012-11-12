class AddQuantityToSaleItems < ActiveRecord::Migration
  def change
    add_column :sale_items, :quantity, :integer
  end
end
