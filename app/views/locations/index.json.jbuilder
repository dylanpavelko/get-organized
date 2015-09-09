json.array!(@locations) do |location|
  json.extract! location, :id, :name, :timezonen_id, :street_address, :street_address2, :city, :state, :zipcode, :country, :longitude, :latitude
  json.url location_url(location, format: :json)
end
