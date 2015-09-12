class AddEndToItineraryActivity < ActiveRecord::Migration
  def change
    add_column :itinerary_activities, :end, :datetime
  end
end
