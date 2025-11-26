class Order < ApplicationRecord
  belongs_to :customer
  def self.ransackable_attributes(auth_object = nil)
    ["id", "customer_id"]
  end
end
