class Price < ActiveRecord::Base
  attr_accessible :price_type, :value
  validates_uniqueness_of :price_type
end
