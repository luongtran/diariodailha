class AddContrastToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :contrast, :boolean
  end
end
