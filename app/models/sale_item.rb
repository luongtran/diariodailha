class SaleItem < ActiveRecord::Base
  belongs_to :sale
  belongs_to :photo
  attr_accessible :date, :sale_id, :photo_id, :quantity, :type
end
