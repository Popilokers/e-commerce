class Province < ApplicationRecord
  validates :name, presence:true
  validates :code, presence:true, length:2
  validates :gst, presence:true, numericality:{greater_than_or_equal_to:0, less_than: 1}
  validates :pst, presence:true, numericality:{greater_than_or_equal_to:0, less_than: 1}
  validates :hst, presence:true, numericality:{greater_than_or_equal_to:0, less_than: 1}
end
