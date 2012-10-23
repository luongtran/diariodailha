class Photo < ActiveRecord::Base
  attr_accessible :name

  belongs_to :album
end
