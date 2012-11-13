class CreateMarquees < ActiveRecord::Migration
  def change
    create_table :marquees do |t|
      t.string :text

      t.timestamps
    end
  end
end
