class Coupon < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "cost"]
  end
end

