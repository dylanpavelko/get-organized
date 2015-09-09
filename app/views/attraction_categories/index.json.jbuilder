json.array!(@attraction_categories) do |attraction_category|
  json.extract! attraction_category, :id, :name
  json.url attraction_category_url(attraction_category, format: :json)
end
