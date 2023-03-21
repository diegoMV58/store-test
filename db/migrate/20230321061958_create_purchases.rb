class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.integer :purchase_id
      t.integer :product_id
      t.integer :quantity
      t.timestamps
    end
    add_foreign_key :purchases, :products, column: :product_id
  end
end
