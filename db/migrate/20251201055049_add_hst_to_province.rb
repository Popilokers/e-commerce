class AddHstToProvince < ActiveRecord::Migration[8.0]
  def change
    add_column :provinces, :hst, :decimal
  end
end
