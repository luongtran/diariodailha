class Sale < ActiveRecord::Base
  belongs_to :user
  has_many :sale_itens
  attr_accessible :date, :user_id
end
