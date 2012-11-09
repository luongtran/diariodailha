class Photographer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :phone, :cep, :address, :city, :equipments, :peaks_of_activity, :confirmed_at

  has_many :albums

  validates_uniqueness_of :email
  validates_presence_of :name, :phone, :cep, :address, :city, :equipments, :peaks_of_activity
  
end
