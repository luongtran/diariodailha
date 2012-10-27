class AddCurriculumToWorkWithU < ActiveRecord::Migration
  def change
    add_column :work_with_us, :curriculum, :string
  end
end
