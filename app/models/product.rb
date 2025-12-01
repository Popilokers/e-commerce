class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "name", "description", "price", "in_stock", "category_id" ]
  end
  
  validates :name, presence:true
  validates :description, presence:true
  validates :price, presence:true, numericality:{greater_than:0}, is_numeric:true
  validates :in_stock, presence:true, is_boolean:true
  validates :category_id, presence:true,numericality:{greater_than:0}, is_numeric:true
end
