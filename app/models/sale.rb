class Sale < ActiveRecord::Base
  belongs_to :user
  has_many :sale_items
  attr_accessible :date, :user_id
end
