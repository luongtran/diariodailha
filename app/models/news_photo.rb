class NewsPhoto < ActiveRecord::Base
  belongs_to :message
  attr_accessible :image, :legend, :message_id

  mount_uploader :image, NewsPhotoUploader
end
