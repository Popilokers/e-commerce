class Province < ApplicationRecord
  validates :name, presence:true
  validates :code, presence:true, length:{is:2}
  validates :gst, presence:true, numericality:{only_integer: true,greater_than_or_equal_to:0, less_than: 1}
  validates :pst, presence:true, numericality:{only_integer: true,greater_than_or_equal_to:0, less_than: 1}
  validates :hst, presence:true, numericality:{only_integer: true,greater_than_or_equal_to:0, less_than: 1}
end
