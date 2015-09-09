json.array!(@trip_has_inventory_items) do |trip_has_inventory_item|
  json.extract! trip_has_inventory_item, :id, :trip_id, :inventory_item_id
  json.url trip_has_inventory_item_url(trip_has_inventory_item, format: :json)
end
