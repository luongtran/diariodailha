class Content < ActiveRecord::Base
  attr_accessible :body, :description, :name, :subtitle, :title
end
