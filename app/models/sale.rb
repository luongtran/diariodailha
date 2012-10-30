class Sale < ActiveRecord::Base
  attr_accessible :date, :photo_list_id, :user_id, :value
  belongs_to :user
  has_many :photos, :through => :photo_lists
end
