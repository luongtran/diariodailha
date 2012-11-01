class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.datetime :date
      t.belongs_to :sale
      t.belongs_to :photo

      t.timestamps
    end
    add_index :sale_items, :sale_id
    add_index :sale_items, :photo_id
  end
end
