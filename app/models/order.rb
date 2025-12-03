class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  def self.ransackable_attributes(auth_object = nil)
    ["id", "customer_id"]
  end

  
  validates :customer_id, presence:true,numericality:{only_integer: true,greater_than: 0}
end
