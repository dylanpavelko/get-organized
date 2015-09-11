class RemoveItineraryItemFromTrip < ActiveRecord::Migration
  def change
  	remove_column :trips, :itinerary_item_id
  end
end
