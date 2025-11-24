class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.string :category
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
