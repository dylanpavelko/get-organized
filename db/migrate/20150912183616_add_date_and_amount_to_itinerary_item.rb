class AddDateAndAmountToItineraryItem < ActiveRecord::Migration
  def change
    add_column :trip_has_inventory_items, :date, :date
    add_column :trip_has_inventory_items, :amount, :decimal
  end
end
