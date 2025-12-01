class AddCodeToProvince < ActiveRecord::Migration[8.0]
  def change
    add_column :provinces, :code, :string
  end
end
