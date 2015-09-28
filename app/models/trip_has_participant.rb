class TripHasParticipant < ActiveRecord::Base
	belongs_to :participant, class_name: "Person", foreign_key: "participant_id"
	belongs_to :trip, class_name: "Trip", foreign_key: "trip_id"

	validates :participant_id, :presence => true
	validates :trip_id, :presence => true
end
