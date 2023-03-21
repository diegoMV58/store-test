class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :external_id
      t.string :title
      t.text :description
      t.integer :price
      t.string :image
      t.string :rating
      t.integer :stock
      t.string :category
      t.string :external_url

      t.timestamps
    end
  end
end
