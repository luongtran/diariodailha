class AddPeaksOfActivityToPhotographers < ActiveRecord::Migration
  def change
    add_column :photographers, :peaks_of_activity, :string
  end
end
