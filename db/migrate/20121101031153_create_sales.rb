class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.datetime :date
      t.belongs_to :user

      t.timestamps
    end
    add_index :sales, :user_id
  end
end
