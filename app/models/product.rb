class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "name", "description", "price", "in_stock", "category_id" ]
  end
  
  validates :name, presence:true
  validates :description, presence:true
  validates :price, presence:true, numericality:{only_integer: true,greater_than:0}
  validates :in_stock, presence:true, inclusion: { in: [true, false] }
  validates :category_id, presence:true,numericality:{only_integer: true,greater_than:0}
end
