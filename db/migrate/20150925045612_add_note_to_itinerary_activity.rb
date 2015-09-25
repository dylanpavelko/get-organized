class AddNoteToItineraryActivity < ActiveRecord::Migration
  def change
    add_column :itinerary_activities, :note, :text
    add_column :trip_has_inventory_items, :reused, :boolean
  end
end
