class Album < ActiveRecord::Base
  belongs_to :photographer
  has_many :photos

  attr_accessible :beach, :date, :name, :peak

  accepts_nested_attributes_for :photos, :allow_destroy => true

  validates_presence_of :beach, :date, :name, :peak
end
