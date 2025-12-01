class Coupon < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "cost"]
  end

  validates :name, presence: true
  validates :cost, presence: true, numericality:{only_integer: true,greater_than: 0}
end

