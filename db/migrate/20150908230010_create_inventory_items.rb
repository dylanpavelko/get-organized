class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.string :name
      t.decimal :amount
      t.references :quantity_type, index: true
      t.boolean :consumable
      t.decimal :price
      t.text :note
      t.text :detail
      t.string :brand

      t.timestamps
    end
  end
end
