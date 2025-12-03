class AddStripeToOrder < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :payment_id, :string
    add_column :orders, :total, :decimal
  end
end
