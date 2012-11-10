class ContactType < ActiveRecord::Base
  attr_accessible :name
  has_many :contacts

  validates_presence_of :name
end
