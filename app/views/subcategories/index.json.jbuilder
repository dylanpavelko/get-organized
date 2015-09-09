json.array!(@subcategories) do |subcategory|
  json.extract! subcategory, :id, :subcategory, :category_id
  json.url subcategory_url(subcategory, format: :json)
end
