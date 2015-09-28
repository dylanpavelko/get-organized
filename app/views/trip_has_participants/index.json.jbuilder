json.array!(@trip_has_participants) do |trip_has_participant|
  json.extract! trip_has_participant, :id, :participant, :organizer, :private_viewer, :traveler
  json.url trip_has_participant_url(trip_has_participant, format: :json)
end
