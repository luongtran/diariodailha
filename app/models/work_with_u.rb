class WorkWithU < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :curriculum

  mount_uploader :curriculum, CurriculumUploader
end
