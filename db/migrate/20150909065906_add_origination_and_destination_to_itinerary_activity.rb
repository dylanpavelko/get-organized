class AddOriginationAndDestinationToItineraryActivity < ActiveRecord::Migration
  def change
    add_reference :itinerary_activities, :origination, index: true
    add_reference :itinerary_activities, :destination, index: true
  end
end
