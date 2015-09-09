json.array!(@trips) do |trip|
  json.extract! trip, :id, :name, :description, :itinerary_item_id, :blog_link, :photo_link, :tripit_link
  json.url trip_url(trip, format: :json)
end
