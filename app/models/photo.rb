class Photo < ActiveRecord::Base
  attr_accessible :name

  belongs_to :album

  has_attached_file :pic, :styles => { :medium => "640x480>", :thumb => "100x100>" }

  validates_attachment :pic, :presence => true, :content_type => { :content_type => "image" }, :size => { :in => 0..3.megabytes }
end
