class PhotoList < ActiveRecord::Base
  belongs_to :sale
  belongs_to :photo
  # attr_accessible :title, :body
end
