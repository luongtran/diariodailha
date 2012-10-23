class Album < ActiveRecord::Base
  belongs_to :photographer
  has_many :photos

  attr_accessible :beach, :date, :name, :peak
end
