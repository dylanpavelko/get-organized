class Attraction < ActiveRecord::Base
  belongs_to :attraction_category
  belongs_to :hotel, class_name: "HotelChain", foreign_key: "hotel_id"

  def trip_advisor_location_id
  	if self.trip_advisor_link != nil
  		self.trip_advisor_link.split('-d')[1].split('-').first
  	end
  end

  def hotel?
  	if self.attraction_category != nil and self.attraction_category.name == "Hotel"
  		return true
  	else
  		return false
  	end
  end
end
