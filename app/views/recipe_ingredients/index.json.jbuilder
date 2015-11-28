json.array!(@recipe_ingredients) do |recipe_ingredient|
  json.extract! recipe_ingredient, :id, :recipe_id, :amount, :quantity_type_id, :food_item_id
  json.url recipe_ingredient_url(recipe_ingredient, format: :json)
end
