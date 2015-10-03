json.array!(@public_inventory_item_queues) do |public_inventory_item_queue|
  json.extract! public_inventory_item_queue, :id, :item_id, :reviewed
  json.url public_inventory_item_queue_url(public_inventory_item_queue, format: :json)
end
