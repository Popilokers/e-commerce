class CouponWallet < ApplicationRecord
  belongs_to :coupon
  belongs_to :customer
end
