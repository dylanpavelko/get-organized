json.array!(@itinerary_activities) do |itinerary_activity|
  json.extract! itinerary_activity, :id, :name, :attraction_id, :cost, :basis_id, :datetime, :order
  json.url itinerary_activity_url(itinerary_activity, format: :json)
end
