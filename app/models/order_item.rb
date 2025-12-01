class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def self.ransackable_attributes(auth_object = nil)
    ["id", "order_id", "product_id", "cost"]
  end

  validates :order_id, presence:true, is_numeric:true
  validates :product_id, presence:true, is_numeric:true
  validates :cost, presence:true, is_numeric:true
end
