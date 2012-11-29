class Content < ActiveRecord::Base
  attr_accessible :body, :description, :name, :subtitle, :title

  validates_uniqueness_of :name
  validates_presence_of :name, :title

  has_many :contents_photos, :dependent => :destroy
end
