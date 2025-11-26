class RenameCarnumberToCardNumberInCustomers < ActiveRecord::Migration[8.0]
  def change
    rename_column :customers, :carnumber, :cardnumber
  end
end
