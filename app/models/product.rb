class Product < ApplicationRecord
  belongs_to :category

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "description", "price", "stock_quantity", "category_id"]
  end
end
