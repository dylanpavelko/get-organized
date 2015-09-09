class ItineraryActivity < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :basis
  belongs_to :trip
end
