class AddTripToItineraryActivity < ActiveRecord::Migration
  def change
    add_reference :itinerary_activities, :trip, index: true
  end
end
