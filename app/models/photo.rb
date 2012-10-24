class Photo < ActiveRecord::Base
  attr_accessible :name

  belongs_to :album

  has_attached_file :pic, :styles => { :medium => "640x480>", :thumb => "100x100>" }

  validates_attachment :pic, :presence => true, :content_type => {:content_type => ["image/png", "image/jpg", "image/jpeg"] }, :size => { :in => 0..3.megabytes }
  validates_attachment_content_type :pic, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/pjpeg', 'image/x-png', 'image/jpeg2000'], :message => 'Iei'
end
