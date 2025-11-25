class CreateCouponWallets < ActiveRecord::Migration[8.0]
  def change
    create_table :coupon_wallets do |t|
      t.integer :amount
      t.references :coupon, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
