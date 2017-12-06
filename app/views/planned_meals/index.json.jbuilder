json.array!(@planned_meals) do |planned_meal|
  json.extract! planned_meal, :id, :meal_date, :meal_type, :text, :eat_out, :url, :recipe_id, :attraction_id, :left_overs, :planned_meal_id, :food_item_id, :comment, :order
  json.url planned_meal_url(planned_meal, format: :json)
end
