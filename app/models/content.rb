class Content < ActiveRecord::Base
  attr_accessible :body, :description, :name, :subtitle, :title

  validates_uniqueness_of :name
  validates_presence_of :description, :name, :subtitle, :title
end
