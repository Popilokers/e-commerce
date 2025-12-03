class Category < ApplicationRecord
  has_many :product
  
  def self.ransackable_attributes(auth_object = nil)
    ["id", "name"]
  end
  
  validates :name, presence: true
end
