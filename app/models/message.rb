class Message < ActiveRecord::Base
  attr_accessible :body, :title, :contrast
  has_many :news_photos, :dependent => :destroy
end
