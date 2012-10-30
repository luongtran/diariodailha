class Photo < ActiveRecord::Base
  attr_accessible :album_id, :name, :image

  belongs_to :album
  has_many :sales, :through => :photo_lists

  mount_uploader :image, PhotoUploader
end
