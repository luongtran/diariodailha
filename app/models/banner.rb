class Banner < ActiveRecord::Base
  attr_accessible :name, :position, :file, :link

  mount_uploader :file, BannerUploader
end
