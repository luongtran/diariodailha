class ContentsPhoto < ActiveRecord::Base
  belongs_to :content
  attr_accessible :image, :legend, :content_id

  mount_uploader :image, NewsPhotoUploader
end
