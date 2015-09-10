class Attraction < ActiveRecord::Base
  belongs_to :attraction_category

  def trip_advisor_location_id
  	if self.trip_advisor_link != nil
  		self.trip_advisor_link.split('-d')[1].split('-').first
  	end
  end
end
