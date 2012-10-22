class Album < ActiveRecord::Base
  belongs_to :photographer
  
  attr_accessible :beach, :date, :name, :peak
end
