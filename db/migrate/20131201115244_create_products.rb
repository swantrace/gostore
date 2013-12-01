class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price
      t.string :category
      t.string :material
      t.integer :quantity
      t.decimal :sale_price
      t.boolean :mark_as_new
      t.boolean :mark_as_sale

      t.timestamps
    end
  end
end
