class CouponWallet < ApplicationRecord
  belongs_to :coupon
  belongs_to :customer

  def self.ransackable_attributes(auth_object = nil)
    ["id", "customer_id", "coupon_id", "amount"]
  end

  validates :customer_id, presence:true, numericality:{only_integer: true,greater_than_or_equal_to:0}
  validates :coupon_id, presence:true, numericality:{only_integer: true,greater_than_or_equal_to:0}
  validates :amount, presence:true, numericality:{only_integer: true,greater_than_or_equal_to:0}
end 
