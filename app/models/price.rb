class Price < ActiveRecord::Base
  attr_accessible :type, :value
  validates_uniqueness_of :type
end
