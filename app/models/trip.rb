class Trip < ActiveRecord::Base
  belongs_to :itinerary_item
end
