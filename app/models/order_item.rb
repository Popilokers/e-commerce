class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def self.ransackable_attributes(auth_object = nil)
    ["id", "order_id", "product_id", "cost"]
  end

  validates :order_id, presence:true, numericality:{only_integer: true, greater_than:0}
  validates :product_id, presence:true, numericality:{only_integer: true, greater_than:0}
  validates :cost, presence:true, numericality:{only_decimal: true, greater_than:0}
end
