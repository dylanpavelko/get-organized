json.array!(@inventory_options) do |inventory_option|
  json.extract! inventory_option, :id, :inventory_item_id, :food_items_id
  json.url inventory_option_url(inventory_option, format: :json)
end
