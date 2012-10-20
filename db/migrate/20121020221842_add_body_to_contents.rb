class AddBodyToContents < ActiveRecord::Migration
  def change
    add_column :contents, :body, :text
  end
end
