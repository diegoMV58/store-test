class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :product_id
      t.integer :quantity
      t.integer :total
      t.timestamps
    end
    add_foreign_key :carts, :products, column: :product_id
  end
end
