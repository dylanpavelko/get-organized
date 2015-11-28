json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :serving_size, :description, :source, :notes, :author_id
  json.url recipe_url(recipe, format: :json)
end
