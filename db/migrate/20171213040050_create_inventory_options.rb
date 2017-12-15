class CreateInventoryOptions < ActiveRecord::Migration
  def change
    create_table :inventory_options do |t|
      t.references :inventory_item, index: true
      t.references :food_items, index: true

      t.timestamps
    end
  end
end
