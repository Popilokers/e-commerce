class AddPstToProvince < ActiveRecord::Migration[8.0]
  def change
    add_column :provinces, :pst, :decimal
  end
end
