class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.float :value
      t.string :price_type

      t.timestamps
    end
  end
end
