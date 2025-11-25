class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :carnumber
      t.integer :points

      t.timestamps
    end
  end
end
