class AddAirlineToItineraryActivity < ActiveRecord::Migration
  def change
    add_reference :itinerary_activities, :airline, index: true
  end
end
