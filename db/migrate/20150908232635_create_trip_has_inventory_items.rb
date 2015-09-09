class CreateTripHasInventoryItems < ActiveRecord::Migration
  def change
    create_table :trip_has_inventory_items do |t|
      t.references :trip, index: true
      t.references :inventory_item, index: true

      t.timestamps
    end
  end
end
