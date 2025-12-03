class ChangeCostInOrderItems < ActiveRecord::Migration[8.0]
  def change
    change_column :order_items, :cost, :decimal, precision: 10, scale: 2
  end
end
