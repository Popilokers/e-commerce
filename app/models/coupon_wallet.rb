class CouponWallet < ApplicationRecord
  belongs_to :coupon
  belongs_to :customer

  def self.ransackable_attributes(auth_object = nil)
    ["id", "customer_id", "coupon_id", "amount"]
  end
end
