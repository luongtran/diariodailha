class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.string :description
      t.string :title
      t.string :subtitle

      t.timestamps
    end
  end
end
