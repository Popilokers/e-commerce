require 'bcrypt'

class Customer < ApplicationRecord

  belongs_to :province

  has_secure_password  

  after_initialize :set_default_points, if: :new_record?
  
  def self.ransackable_attributes(auth_object = nil)
    ["cardumber", "created_at", "email", "first_name", "id", "last_name", "password", "points", "updated_at"]
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def set_default_points
    self.points ||= 0
  end

  validates :first_name, presence: true 
  validates :last_name, presence: true 
  validates :email, presence: true, uniqueness: true , format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  validates :province_id, presence: true, is_numeric:true
  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, is_numeric:true
end
