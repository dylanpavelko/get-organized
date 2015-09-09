json.array!(@activity_has_inventory_items) do |activity_has_inventory_item|
  json.extract! activity_has_inventory_item, :id, :activity_id, :inventory_item_id
  json.url activity_has_inventory_item_url(activity_has_inventory_item, format: :json)
end
