class Order < ApplicationRecord
  belongs_to :customer
  def self.ransackable_attributes(auth_object = nil)
    ["id", "customer_id"]
  end

  
  validates :customer_id, presence:true,numericality:{greater_than: 0}, is_numeric:true
end
