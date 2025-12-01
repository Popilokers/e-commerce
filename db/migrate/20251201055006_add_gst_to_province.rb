class AddGstToProvince < ActiveRecord::Migration[8.0]
  def change
    add_column :provinces, :gst, :decimal
  end
end
