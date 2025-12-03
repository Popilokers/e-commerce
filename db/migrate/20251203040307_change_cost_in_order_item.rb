class ChangeTotalInOrder < ActiveRecord::Migration[8.0]
  def change
    change_column :orders, :total, :decimal, precision: 10, scale: 2
  end
end
