class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :item
      t.text :description
      t.integer :price
      t.integer :stock
      t.boolean :lack

      t.timestamps null: false
    end
  end
end
