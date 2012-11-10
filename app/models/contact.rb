class Contact < ActiveRecord::Base
  attr_accessible :email, :message, :name, :phone, :contact_type_id
  belongs_to :contact_type

  validates_presence_of :email, :message, :name, :phone, :contact_type
end
