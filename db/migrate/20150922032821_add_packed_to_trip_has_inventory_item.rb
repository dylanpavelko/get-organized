class AddPackedToTripHasInventoryItem < ActiveRecord::Migration
  def change
    add_column :trip_has_inventory_items, :packed, :boolean
  end
end
