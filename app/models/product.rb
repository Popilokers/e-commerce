class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "name", "description", "price", "stock_quantity", "category_id" ]
  end
end
