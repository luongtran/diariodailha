class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.datetime :date
      t.integer :user_id
      t.integer :photo_list_id
      t.integer :value

      t.timestamps
    end
  end
end
