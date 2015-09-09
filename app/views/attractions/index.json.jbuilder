json.array!(@attractions) do |attraction|
  json.extract! attraction, :id, :attraction_category_id, :name
  json.url attraction_url(attraction, format: :json)
end
